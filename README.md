## Microsoft Sentinel Foundation

This Terraform repository module is designed to deploy an IaaC Microsoft Sentinel landing zone:
- Resource Groups 
- Log Analytics Workspace 
- Sentinel Solution 
- RBAC permissions
- Key Vault
- (optional) Virtual Machines
- (optional) Scale Sets
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 2.49.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.103.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_keyvault"></a> [keyvault](#module\_keyvault) | ./modules/keyvault | n/a |
| <a name="module_rbac"></a> [rbac](#module\_rbac) | ./modules/rbac | n/a |
| <a name="module_rgs-law-sentinel"></a> [rgs-law-sentinel](#module\_rgs-law-sentinel) | ./modules/rgs-law-sentinel | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_law_name"></a> [law\_name](#input\_law\_name) | Log Analytics Workspace name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location for Azure resources | `string` | `"westeurope"` | no |
| <a name="input_subscription_name"></a> [subscription\_name](#input\_subscription\_name) | Azure subscription name | `string` | n/a | yes |
<!-- END_TF_DOCS -->