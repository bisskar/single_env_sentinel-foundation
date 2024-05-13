module "naming" {
  source  = "Azure/naming/azurerm"
  version = ">= 0.3.0"
}

locals {
  tags = {
    terraform = "True"
  }
  #VM OS/SKU size
  virtualmachine_os_type  = "Linux"
  virtualmachine_sku_size = "Standard_DC1s_v2"

  #Source image reference
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-jammy"
  sku       = "22_04-lts-gen2"
  version   = "latest"
}

resource "azurerm_virtual_network" "vm_vnet" {
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  name                = module.naming.virtual_network.name_unique
  resource_group_name = var.resource_group_rg-vms
  tags                = local.tags
}

resource "azurerm_subnet" "vm_subnet" {
  address_prefixes     = ["10.0.1.0/24"]
  name                 = module.naming.subnet.name_unique
  resource_group_name  = var.resource_group_rg-vms
  virtual_network_name = azurerm_virtual_network.vm_vnet.name
}

module "vm" {
  source  = "Azure/avm-res-compute-virtualmachine/azurerm"
  version = ">= 0.13.0"

  location                               = var.location
  resource_group_name                    = var.resource_group_rg-vms
  virtualmachine_os_type                 = local.virtualmachine_os_type
  name                                   = module.naming.virtual_machine.name_unique
  admin_credential_key_vault_resource_id = var.keyvault_resource_id
  virtualmachine_sku_size                = local.virtualmachine_sku_size
  zone                                   = 1

  source_image_reference = {
    publisher = local.publisher
    offer     = local.offer
    sku       = local.sku
    version   = local.version
  }

  network_interfaces = {
    network_interface_1 = {
      name = module.naming.network_interface.name_unique
      ip_configurations = {
        ip_configuration_1 = {
          name                          = "${module.naming.network_interface.name_unique}-ipconfig1"
          private_ip_subnet_resource_id = azurerm_subnet.vm_subnet.id
        }
      }
    }
  }

  tags = local.tags

}
