## Azure Virtual Machine
===========
This Terraform module deploys an Azure Virtual Machine (VM) with the following components:

- `Virtual Network`
- `Subnet`
- `Network Interface`
- `Virtual Machine`

## Module Local Parameters

VM OS/SKU size
- `virtualmachine_os_type`  = f.e: "Linux"
- `virtualmachine_sku_size` = f.e: "Standard_DC1s_v2"

Source image reference
- `publisher` = f.e: "Canonical"
- `offer`     = f.e: "0001-com-ubuntu-server-jammy"
- `sku`       = f.e: "22_04-lts-gen2"
- `version`   = f.e: "latest"

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_naming"></a> [naming](#module\_naming) | Azure/naming/azurerm | >= 0.3.0 |
| <a name="module_vm"></a> [vm](#module\_vm) | Azure/avm-res-compute-virtualmachine/azurerm | >= 0.13.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.vm_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vm_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_keyvault_resource_id"></a> [keyvault\_resource\_id](#input\_keyvault\_resource\_id) | Key Vault resource ID | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location for Azure resources | `string` | `"westeurope"` | no |
| <a name="input_resource_group_rg-vms"></a> [resource\_group\_rg-vms](#input\_resource\_group\_rg-vms) | Key Vault resource group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key"></a> [key](#output\_key) | VM Admin password |
<!-- END_TF_DOCS -->