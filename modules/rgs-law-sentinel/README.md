Resource Groups, Log Analytics Workspace, Sentinel onboarding 
===========


<p align="center">
  <img src="https://github.com/bisskar/Sentinel_Local/assets/65374155/063267fe-9c45-4741-a497-3adc61e4ac88">
</p>

Description
----------------------
A terraform module to build a Resource Groups, Log Analytics Workspace and onboard Azure Sentinel 


Module Input Variables
----------------------

- `region` - Azure location
- `law_name` - Log Analytics Workspace name 
- `subscription_name` - Subscription name

Usage
-----

```hcl
module "rgs-law-sentinel" {

    source = "./modules/rgs-law-sentinel"

    region = local.region
    subscription_name = local.subscription_name
    law_name = local.law_name
}
```

Outputs
=======

 - `rg-law` - Name of the Log Analytics Workspace resource group
 - `rg-shell` - Name of the Cloud Shell resource group
 - `rg-watchlist` - Name of the Watchlist resource group
 - `rg-keyvault` - Name of the KeyVault resource group
 - `rg-notebooks` - Name of the Notebooks resource group
 - `rg-playbooks` - Name of the  Playbooks resource group
 - `rg-workbooks` - Name of the Workbooks resource group
 - `rg-vms` - Name of the Virtual Machines resource group
 - `rg-network` - Name of the Network resource group
 - `rg-scaleset` - Name of the Scale Sets resource group
 - `rg-automation` - Name of the Automation resource group
 - `sentinel_onboarding_id` - Sentinel Onboarding ID
 - `law_workspace_id` - Log Analytics Workspace ID


Authors
=======
Oskar Kazmierczyk
bisskar@gmail.com
