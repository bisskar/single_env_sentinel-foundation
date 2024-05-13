data "azuread_group" "az_read_grp" {
  for_each         = local.security_groups
  display_name     = each.value
  security_enabled = true

  depends_on = [azuread_group.groups]
}

data "azurerm_subscription" "current" {
}

