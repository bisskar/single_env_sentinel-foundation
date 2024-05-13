variable "keyvault_resource_id" {
  type        = string
  description = "Key Vault resource ID"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "Location for Azure resources"
}

variable "resource_group_rg-vms" {
  type        = string
  description = "Key Vault resource group"
}