## Resource Groups, Log Analytics Workspace, Sentinel onboarding 
A terraform module to build a Resource Groups, Log Analytics Workspace and onboard Azure Sentinel 

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 2.49.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.103.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | ~> 2.49.1 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.103.1 |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_log_analytics_workspace.law-sentinel](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_resource_group.rg-names](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.sentinel_automation_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.sentinel_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_sentinel_log_analytics_workspace_onboarding.sentinel-onboarding](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_log_analytics_workspace_onboarding) | resource |
| [time_sleep.wait_30_seconds](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [time_sleep.wait_30_seconds1](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [azuread_service_principal.security_insights_app](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/service_principal) | data source |
| [azurerm_client_config.cfg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_law_name"></a> [law\_name](#input\_law\_name) | Log Analytics Workspace name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location for Azure resources | `string` | `"westeurope"` | no |
| <a name="input_subscription_name"></a> [subscription\_name](#input\_subscription\_name) | Azure subscription name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_law_workspace_id"></a> [law\_workspace\_id](#output\_law\_workspace\_id) | The ID of the Log Analytics workspace for law-related resources. |
| <a name="output_rg-automation"></a> [rg-automation](#output\_rg-automation) | The resource group for managing automation-related resources. |
| <a name="output_rg-keyvault"></a> [rg-keyvault](#output\_rg-keyvault) | The resource group for managing key vault-related resources. |
| <a name="output_rg-law"></a> [rg-law](#output\_rg-law) | The resource group for managing law-related resources. |
| <a name="output_rg-network"></a> [rg-network](#output\_rg-network) | The resource group for managing network-related resources. |
| <a name="output_rg-notebooks"></a> [rg-notebooks](#output\_rg-notebooks) | The resource group for managing notebooks-related resources. |
| <a name="output_rg-playbooks"></a> [rg-playbooks](#output\_rg-playbooks) | The resource group for managing playbooks-related resources. |
| <a name="output_rg-scaleset"></a> [rg-scaleset](#output\_rg-scaleset) | The resource group for managing scale set-related resources. |
| <a name="output_rg-shell"></a> [rg-shell](#output\_rg-shell) | The resource group for managing shell-related resources. |
| <a name="output_rg-vms"></a> [rg-vms](#output\_rg-vms) | The resource group for managing virtual machine-related resources. |
| <a name="output_rg-watchlist"></a> [rg-watchlist](#output\_rg-watchlist) | The resource group for managing watchlist-related resources. |
| <a name="output_rg-workbooks"></a> [rg-workbooks](#output\_rg-workbooks) | The resource group for managing workbooks-related resources. |
| <a name="output_sentinel_onboarding_id"></a> [sentinel\_onboarding\_id](#output\_sentinel\_onboarding\_id) | The ID of the Log Analytics workspace for Sentinel onboarding. |
<!-- END_TF_DOCS -->