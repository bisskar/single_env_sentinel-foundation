## Role Based Access Control

A terraform module to build a Security Groups with the subscription scope in Entra ID

## Locals

Key-Value pairs (map) to create Security Groups with the following format: {"RoleName" = "<subscription_name>_RoleName"}

- `Contributor` - "Contributor" role with the subscription scope
- `Microsoft Sentinel Responder` - "Microsoft Sentinel Responder" role with the subscription scope
- `Microsoft Sentinel Reader` - "Microsoft Sentinel Reader" role with the subscription scope
- `Microsoft Sentinel Contributor` - "Microsoft Sentinel Contributor" role with the subscription scope
- `Microsoft Sentinel Playbook Operator` - "Microsoft Sentinel Playbook Operator" role with the subscription scope
- `Logic App Contributor` - "Logic App Contributor" role with the subscription scope
- `Owner` - "Owner" role with the subscription scope
- `Security Reader` - "Security Reader" role with the subscription scope
- `Microsoft Sentinel Automation Contributor` - "Microsoft Sentinel Automation Contributor" role with the subscription scope
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | n/a |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Resources

| Name | Type |
|------|------|
| [azuread_group.groups](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/group) | resource |
| [azurerm_role_assignment.role_assignments](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [time_sleep.wait_30_seconds](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [azuread_group.az_read_grp](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_subscription_name"></a> [subscription\_name](#input\_subscription\_name) | Azure subscription name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_contributor"></a> [contributor](#output\_contributor) | Contributor role with the subscription scope |
| <a name="output_owner"></a> [owner](#output\_owner) | Owner role with the subscription scope |
| <a name="output_security_reader"></a> [security\_reader](#output\_security\_reader) | Security Reader role with the subscription scope |
| <a name="output_sentinel_automation_contributor"></a> [sentinel\_automation\_contributor](#output\_sentinel\_automation\_contributor) | Microsoft Sentinel Automation Contributor role with the subscription scope |
| <a name="output_sentinel_contributor"></a> [sentinel\_contributor](#output\_sentinel\_contributor) | Microsoft Sentinel Contributor role with the subscription scope |
| <a name="output_sentinel_logic_app_contributor"></a> [sentinel\_logic\_app\_contributor](#output\_sentinel\_logic\_app\_contributor) | Logic App Contributor role with the subscription scope |
| <a name="output_sentinel_playbook_operator"></a> [sentinel\_playbook\_operator](#output\_sentinel\_playbook\_operator) | Microsoft Sentinel Playbook Operator role with the subscription scope |
| <a name="output_sentinel_reader"></a> [sentinel\_reader](#output\_sentinel\_reader) | Microsoft Sentinel Reader role with the subscription scope |
| <a name="output_sentinel_responder"></a> [sentinel\_responder](#output\_sentinel\_responder) | Microsoft Sentinel Responder role with the subscription scope |
<!-- END_TF_DOCS -->