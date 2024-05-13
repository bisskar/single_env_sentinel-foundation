#Key-Value pairs to create resource group names:
locals {
  resource_groups = {
    "rg-law" : "${var.subscription_name}-law-rg",
    "rg-shell" : "${var.subscription_name}-cloud-shell-storage-rg",
    "rg-watchlist" : "${var.subscription_name}-watchlists-rg",
    "rg-keyvault" : "${var.subscription_name}-keyvault-rg",
    "rg-notebooks" : "${var.subscription_name}-notebooks-rg",
    "rg-playbooks" : "${var.subscription_name}-playbooks-rg",
    "rg-workbooks" : "${var.subscription_name}-workbooks-rg",
    "rg-vm" : "${var.subscription_name}-vm-rg",
    "rg-network" : "${var.subscription_name}-network-rg",
    "rg-scaleset" : "${var.subscription_name}-scaleset-rg"
    "rg-automation" : "${var.subscription_name}-automation-rg"
  }
  retention_law       = 30
  commitment_plan_law = "PerGB2018"
}

#Resource Groups creation
resource "azurerm_resource_group" "rg-names" {
  for_each = local.resource_groups
  name     = each.value
  location = var.location
  tags = {
    "terraform" = "True"
  }
}

#Log Analytics Workspace creating
resource "azurerm_log_analytics_workspace" "law-sentinel" {
  name                = var.law_name
  location            = var.location
  resource_group_name = local.resource_groups["rg-law"]
  sku                 = local.commitment_plan_law
  retention_in_days   = local.retention_law

  tags = {
    "terraform" = "True"
  }
  depends_on = [azurerm_resource_group.rg-names]
}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [azurerm_log_analytics_workspace.law-sentinel]

  create_duration = "30s"
}

#Sentine Onboarding to Log Analytics Workspace
resource "azurerm_sentinel_log_analytics_workspace_onboarding" "sentinel-onboarding" {
  workspace_id                 = azurerm_log_analytics_workspace.law-sentinel.id
  customer_managed_key_enabled = false
  depends_on                   = [azurerm_log_analytics_workspace.law-sentinel]
}

resource "time_sleep" "wait_30_seconds1" {
  depends_on = [azurerm_sentinel_log_analytics_workspace_onboarding.sentinel-onboarding]

  create_duration = "30s"
}

#Adding Sentinel Contributor and Sentine Automation COntributor to Resource Group containing playbooks. 
resource "azurerm_role_assignment" "sentinel_contributor" {
  scope                = "/subscriptions/${data.azurerm_client_config.cfg.subscription_id}/resourceGroups/${local.resource_groups["rg-playbooks"]}"
  role_definition_name = "Microsoft Sentinel Contributor"
  principal_id         = data.azuread_service_principal.security_insights_app.object_id
  depends_on           = [azurerm_sentinel_log_analytics_workspace_onboarding.sentinel-onboarding]

}

resource "azurerm_role_assignment" "sentinel_automation_contributor" {
  scope                = "/subscriptions/${data.azurerm_client_config.cfg.subscription_id}/resourceGroups/${local.resource_groups["rg-playbooks"]}"
  role_definition_name = "Microsoft Sentinel Automation Contributor"
  principal_id         = data.azuread_service_principal.security_insights_app.object_id
  depends_on           = [azurerm_sentinel_log_analytics_workspace_onboarding.sentinel-onboarding]

}
