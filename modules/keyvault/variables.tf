variable "resource_group_rg-keyvault" {
  type        = string
  description = "Key Vault resource group"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "Location for Azure resources"
}