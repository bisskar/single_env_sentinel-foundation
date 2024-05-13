data "azuread_service_principal" "security_insights_app" {
  display_name = "Azure Security Insights"
  depends_on   = [azurerm_sentinel_log_analytics_workspace_onboarding.sentinel-onboarding]
}

data "azurerm_client_config" "cfg" {

}