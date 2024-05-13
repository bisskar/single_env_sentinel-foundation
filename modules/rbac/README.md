RBAC
===========


<p align="center">
  <img src="https://github.com/bisskar/Sentinel_Local/assets/65374155/5349bf80-173b-4c08-bd8b-0b8a7c2d3cda">
</p>

Description
----------------------
A terraform module to build a Security Groups with the subscription scope in Entra ID


Module Input Variables (Locals, Optional change)
----------------------

- `subscription_name` - Subscription name
  

Key-Value pairs (map) to create Security Groups with the following format: {"RoleName" = "<subscription_name>_RoleName"}
----------------------

- `Contributor` - "Contributor" role with the subscription scope
- `Microsoft Sentinel Responder` - "Microsoft Sentinel Responder" role with the subscription scope
- `Microsoft Sentinel Reader` - "Microsoft Sentinel Reader" role with the subscription scope
- `Microsoft Sentinel Contributor` - "Microsoft Sentinel Contributor" role with the subscription scope
- `Microsoft Sentinel Playbook Operator` - "Microsoft Sentinel Playbook Operator" role with the subscription scope
- `Logic App Contributor` - "Logic App Contributor" role with the subscription scope
- `Owner` - "Owner" role with the subscription scope
- `Security Reader` - "Security Reader" role with the subscription scope
- `Microsoft Sentinel Automation Contributor` - "Microsoft Sentinel Automation Contributor" role with the subscription scope

Usage
-----

```hcl
module "rbac" {
    source = "./modules/rbac"    
    subscription_name = local.subscription_name    
}
```

Outputs
=======

- `contributor` - Security Group "<subscription_name>_Contributor" object ID
- `sentinel_responder` - Security Group "<subscription_name>_SentinelOperator" object ID
- `sentinel_reader` - Security Group "<subscription_name>_SentinelReader" object ID
- `sentinel_contributor` - Security Group "<subscription_name>_SentinelContributor" object ID
- `sentinel_playbook_operator` - Security Group "<subscription_name>_PlaybookOperator" object ID
- `sentinel_logic_app_contributor` - Security Group "<subscription_name>_LogicAppContributor" object ID
- `owner` - Security Group "<subscription_name>_Owner" object ID
- `security_reader` - Security Group "<subscription_name>_SecurityReader" object ID
- `sentinel_automation_contributor` - Security Group "<subscription_name>_SentinelAutomationContributor" object ID


Authors
=======
Oskar Kazmierczyk
bisskar@gmail.com


module "rbac" {
    source = "./modules/rbac"
    subscription_name = local.subscription_name    
}