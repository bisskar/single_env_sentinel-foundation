Azure Virtual Machine
===========


<p align="center">
  <img src="https://github.com/bisskar/Sentinel_Local/assets/65374155/6ac14e59-f923-4cc6-a8fb-e79b9a6ea93c">
</p>

Description
----------------------
This Terraform module deploys an Azure Virtual Machine (VM) with the following components:

- `Virtual Network`
- `Subnet`
- `Network Interface`
- `Virtual Machine`


### Module Local Parameters

VM OS/SKU size
- `virtualmachine_os_type`  = f.e: "Linux"
- `virtualmachine_sku_size` = f.e: "Standard_DC1s_v2"

Source image reference
- `publisher` = f.e: "Canonical"
- `offer`     = f.e: "0001-com-ubuntu-server-jammy"
- `sku`       = f.e: "22_04-lts-gen2"
- `version`   = f.e: "latest"


### Module Input Variables

- `subscription_name` = Azure subscribtion name
- `resource_group_rg-vms` = Resource Group name
- `keyvault_resource_id` = KeyVault Resource ID
- `region` = Azure Region

### Usage


```hcl
module "virtual-machine" {

    source = "./modules/virtual-machine"

    subscription_name = local.subscription_name
    resource_group_rg-vms = module.rgs-law-sentinel.rg-vms
    keyvault_resource_id = module.keyvault.keyvault_resource_id
    region = local.region

}
```

Outputs
=======
```
output "key" {
  value     = module.vm.admin_password
  sensitive = true
}

```

Authors
=======
Oskar Kazmierczyk
bisskar@gmail.com

