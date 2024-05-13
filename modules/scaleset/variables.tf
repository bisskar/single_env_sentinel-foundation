variable "location" {
  type        = string
  default     = "westeurope"
  description = "Location for Azure resources"
}

variable "resource_group_rg_scaleset" {
  type        = string
  description = "Key Vault resource group"
}