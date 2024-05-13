output "rg-law" {
  value       = local.resource_groups["rg-law"]
  description = "The resource group for managing law-related resources."
}

output "rg-shell" {
  value       = local.resource_groups["rg-shell"]
  description = "The resource group for managing shell-related resources."
}

output "rg-watchlist" {
  value       = local.resource_groups["rg-watchlist"]
  description = "The resource group for managing watchlist-related resources."
}

output "rg-keyvault" {
  value       = local.resource_groups["rg-keyvault"]
  description = "The resource group for managing key vault-related resources."
}

output "rg-notebooks" {
  value       = local.resource_groups["rg-notebooks"]
  description = "The resource group for managing notebooks-related resources."
}

output "rg-playbooks" {
  value       = local.resource_groups["rg-playbooks"]
  description = "The resource group for managing playbooks-related resources."
}

output "rg-workbooks" {
  value       = local.resource_groups["rg-workbooks"]
  description = "The resource group for managing workbooks-related resources."
}

output "rg-vms" {
  value       = local.resource_groups["rg-vm"]
  description = "The resource group for managing virtual machine-related resources."
}

output "rg-network" {
  value       = local.resource_groups["rg-network"]
  description = "The resource group for managing network-related resources."
}

output "rg-scaleset" {
  value       = local.resource_groups["rg-scaleset"]
  description = "The resource group for managing scale set-related resources."
}

output "rg-automation" {
  value       = local.resource_groups["rg-automation"]
  description = "The resource group for managing automation-related resources."
}

output "sentinel_onboarding_id" {
  value       = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel-onboarding.workspace_id
  description = "The ID of the Log Analytics workspace for Sentinel onboarding."
}

output "law_workspace_id" {
  value       = azurerm_log_analytics_workspace.law-sentinel.id
  description = "The ID of the Log Analytics workspace for law-related resources."
}