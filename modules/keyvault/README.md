## Keyvault

A terraform module to build Azure Key Vault

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_keyvault"></a> [keyvault](#module\_keyvault) | Azure/avm-res-keyvault-vault/azurerm | ~> 0.5.3 |
| <a name="module_naming"></a> [naming](#module\_naming) | Azure/naming/azurerm | 0.4.1 |

## Resources

| Name | Type |
|------|------|
| [time_sleep.wait_30_seconds](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Location for Azure resources | `string` | `"westeurope"` | no |
| <a name="input_resource_group_rg-keyvault"></a> [resource\_group\_rg-keyvault](#input\_resource\_group\_rg-keyvault) | Key Vault resource group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_keyvault_resource_id"></a> [keyvault\_resource\_id](#output\_keyvault\_resource\_id) | n/a |
<!-- END_TF_DOCS -->