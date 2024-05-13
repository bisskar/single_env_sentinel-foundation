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
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.5 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_naming"></a> [naming](#module\_naming) | Azure/naming/azurerm | >= 0.3.0 |
| <a name="module_terraform_azurerm_avm_res_compute_virtualmachinescaleset"></a> [terraform\_azurerm\_avm\_res\_compute\_virtualmachinescaleset](#module\_terraform\_azurerm\_avm\_res\_compute\_virtualmachinescaleset) | Azure/avm-res-compute-virtualmachinescaleset/azurerm | >= 0.13.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_nat_gateway.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway) | resource |
| [azurerm_nat_gateway_public_ip_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway_public_ip_association) | resource |
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.natgwpip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_nat_gateway_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_nat_gateway_association) | resource |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [tls_private_key.tls_key](https://registry.terraform.io/providers/hashicorp/tls/4.0.5/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Location for Azure resources | `string` | `"westeurope"` | no |
| <a name="input_resource_group_rg_scaleset"></a> [resource\_group\_rg\_scaleset](#input\_resource\_group\_rg\_scaleset) | Key Vault resource group | `string` | n/a | yes |
<!-- END_TF_DOCS -->