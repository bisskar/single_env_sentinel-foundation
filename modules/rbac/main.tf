locals {
  security_groups = {
    "Contributor"                               = "${var.subscription_name}_Contributor"
    "Microsoft Sentinel Responder"              = "${var.subscription_name}_SentinelOperator",
    "Microsoft Sentinel Reader"                 = "${var.subscription_name}_SentinelReader",
    "Microsoft Sentinel Contributor"            = "${var.subscription_name}_SentinelContributor",
    "Microsoft Sentinel Playbook Operator"      = "${var.subscription_name}_PlaybookOperator",
    "Logic App Contributor"                     = "${var.subscription_name}_LogicAppContributor",
    "Owner"                                     = "${var.subscription_name}_Owner"
    "Security Reader"                           = "${var.subscription_name}_SecurityReader",
    "Microsoft Sentinel Automation Contributor" = "${var.subscription_name}_SentinelAutomationContributor"
  }
}

resource "azuread_group" "groups" {
  for_each         = local.security_groups
  display_name     = each.value
  security_enabled = true

}

resource "azurerm_role_assignment" "role_assignments" {
  for_each             = data.azuread_group.az_read_grp
  scope                = data.azurerm_subscription.current.id
  principal_id         = data.azuread_group.az_read_grp[each.key].id
  role_definition_name = each.key

  depends_on = [azuread_group.groups]
}


resource "time_sleep" "wait_30_seconds" {
  depends_on = [azurerm_role_assignment.role_assignments]

  create_duration = "30s"
}
