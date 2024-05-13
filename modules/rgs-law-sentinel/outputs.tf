output "rg-law" {
  value = local.resource_groups["rg-law"]
}
output "rg-shell" {
  value = local.resource_groups["rg-shell"]
}
output "rg-watchlist" {
  value = local.resource_groups["rg-watchlist"]
}
output "rg-keyvault" {
  value = local.resource_groups["rg-keyvault"]
}
output "rg-notebooks" {
  value = local.resource_groups["rg-notebooks"]
}
output "rg-playbooks" {
  value = local.resource_groups["rg-playbooks"]
}
output "rg-workbooks" {
  value = local.resource_groups["rg-workbooks"]
}
output "rg-vms" {
  value = local.resource_groups["rg-vm"]
}
output "rg-network" {
  value = local.resource_groups["rg-network"]
}
output "rg-scaleset" {
  value = local.resource_groups["rg-scaleset"]
}
output "sentinel_onboarding_id" {
  value = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel-onboarding.workspace_id
}
output "law_workspace_id" {
  value = azurerm_log_analytics_workspace.law-sentinel.id
}
output "rg-automation" {
  value = local.resource_groups["rg-automation"]
}
