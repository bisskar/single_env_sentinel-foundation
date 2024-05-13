variable "location" {
  type        = string
  default     = "westeurope"
  description = "Location for Azure resources"
}

variable "law_name" {
  type        = string
  description = "Log Analytics Workspace name"
}

variable "subscription_name" {
  type        = string
  description = "Azure subscription name"
}