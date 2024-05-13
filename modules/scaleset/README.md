VM Scale Sets
===========


<p align="center">
  <img src="https://github.com/bisskar/Sentinel_Local/assets/65374155/13317e93-7077-4e26-a355-a7ef14941a29">
</p>

Description
----------------------
A terraform module to deploy VM Scale Sets


Module Input Variables
----------------------

- `resource_group_rg_scaleset` - Resource group name 
- `region` - Azure region


Usage
-----

```hcl
module "scaleset" {
    source = "./modules/scaleset"

    region = local.region    
    resource_group_rg_scaleset = module.rgs-law-sentinel.rg-scaleset    
}
```

Authors
=======
Oskar Kazmierczyk
bisskar@gmail.com