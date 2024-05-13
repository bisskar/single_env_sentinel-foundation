Keyvault
===========


<p align="center">
  <img src="https://github.com/bisskar/Sentinel_Local/assets/65374155/6d6709e3-3f07-4717-b78f-17c721ad0437">
</p>

Description
----------------------
A terraform module to build a Key Vault


Module Input Variables
----------------------

- `resource_group_rg-keyvault` - Resource group name 
- `region` - Azure region

Usage
-----

```hcl
module "keyvault" {
    source = "./modules/keyvault"

    resource_group_rg-keyvault = module.rgs-law-sentinel.rg-keyvault
    region = local.region
}
```

Outputs
=======

 - `keyvault_resource_id` - Key Vault resource ID

Authors
=======
Oskar Kazmierczyk
bisskar@gmail.com



