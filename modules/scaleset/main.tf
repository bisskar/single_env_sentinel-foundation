module "naming" {
  source  = "Azure/naming/azurerm"
  version = ">= 0.3.0"
}

resource "azurerm_virtual_network" "this" {
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  name                = module.naming.virtual_network.name_unique
  resource_group_name = var.resource_group_rg_scaleset
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  tags = {
    source = "AVM Sample Default Deployment"
  }
}

resource "azurerm_subnet" "subnet" {
  address_prefixes     = ["10.0.1.0/24"]
  name                 = module.naming.subnet.name_unique
  resource_group_name  = var.resource_group_rg_scaleset
  virtual_network_name = azurerm_virtual_network.this.name
}

# network security group for the subnet with a rule to allow http, https and ssh traffic
resource "azurerm_network_security_group" "this" {
  location            = var.location
  name                = module.naming.network_security_group.name_unique
  resource_group_name = var.resource_group_rg_scaleset

  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_range     = "80"
    direction                  = "Inbound"
    name                       = "allow-http"
    priority                   = 100
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
  }
  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_range     = "443"
    direction                  = "Inbound"
    name                       = "allow-https"
    priority                   = 101
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
  }
  #ssh security rule
  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_range     = "22"
    direction                  = "Inbound"
    name                       = "allow-ssh"
    priority                   = 102
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
  }
}

resource "azurerm_public_ip" "natgwpip" {
  allocation_method   = "Static"
  location            = var.location
  name                = module.naming.public_ip.name_unique
  resource_group_name = var.resource_group_rg_scaleset
  sku                 = "Standard"
  tags = {
    source = "AVM Sample Default Deployment"
  }
  zones = ["1", "2", "3"]
}

resource "azurerm_nat_gateway" "this" {
  location            = var.location
  name                = module.naming.nat_gateway.name_unique
  resource_group_name = var.resource_group_rg_scaleset
  tags = {
    source = "AVM Sample Default Deployment"
  }
}

resource "azurerm_nat_gateway_public_ip_association" "this" {
  nat_gateway_id       = azurerm_nat_gateway.this.id
  public_ip_address_id = azurerm_public_ip.natgwpip.id
}

resource "azurerm_subnet_nat_gateway_association" "this" {
  nat_gateway_id = azurerm_nat_gateway.this.id
  subnet_id      = azurerm_subnet.subnet.id
}

resource "tls_private_key" "tls_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# This is the module call
module "terraform_azurerm_avm_res_compute_virtualmachinescaleset" {

  source                      = "Azure/avm-res-compute-virtualmachinescaleset/azurerm"
  version                     = ">= 0.13.0"
  name                        = module.naming.virtual_machine_scale_set.name_unique
  resource_group_name         = var.resource_group_rg_scaleset
  location                    = var.location
  platform_fault_domain_count = 1
  admin_password              = "P@ssw0rd1234!"
  instances                   = 2
  sku_name                    = "Standard_DC1s_v2"
  extension_protected_setting = {}
  user_data_base64            = null
  admin_ssh_keys = [(
    {
      id         = tls_private_key.tls_key.id
      public_key = tls_private_key.tls_key.public_key_openssh
      username   = "azureuser"
    }
  )]
  network_interface = [{
    name = "VMSS-NIC"
    ip_configuration = [{
      name      = "VMSS-IPConfig"
      subnet_id = azurerm_subnet.subnet.id
    }]
  }]
  os_profile = {
    linux_configuration = {
      disable_password_authentication = false
      user_data_base64                = base64encode(file("./modules/scaleset/user-data.sh"))
      admin_username                  = "azureuser"
      admin_ssh_key                   = toset([tls_private_key.tls_key.id])
      provision_vm_agent              = true
    }
  }
  source_image_reference = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-LTS-gen2"
    version   = "latest"
  }
  extension = [{
    name                       = "HealthExtension"
    publisher                  = "Microsoft.ManagedServices"
    type                       = "ApplicationHealthLinux"
    type_handler_version       = "1.0"
    auto_upgrade_minor_version = true
    settings                   = <<SETTINGS
    {
      "protocol": "http",
      "port" : 80,
      "requestPath": "health"
    }
SETTINGS
  }]
  tags = {
    source = "AVM Sample Default Deployment"
  }
  # Uncomment the code below to implement a VMSS Lock
  #lock = {
  #  name = "VMSSNoDelete"
  #  kind = "CanNotDelete"
  #}
  depends_on = [azurerm_subnet_nat_gateway_association.this]
}