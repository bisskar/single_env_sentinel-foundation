output "contributor" {
  value = azuread_group.groups["Contributor"].object_id
}
output "sentinel_responder" {
  value = azuread_group.groups["Microsoft Sentinel Responder"].object_id
}
output "sentinel_reader" {
  value = azuread_group.groups["Microsoft Sentinel Reader"].object_id
}
output "sentinel_contributor" {
  value = azuread_group.groups["Microsoft Sentinel Contributor"].object_id
}
output "sentinel_playbook_operator" {
  value = azuread_group.groups["Microsoft Sentinel Playbook Operator"].object_id
}
output "sentinel_logic_app_contributor" {
  value = azuread_group.groups["Logic App Contributor"].object_id
}
output "owner" {
  value = azuread_group.groups["Owner"].object_id
}
output "security_reader" {
  value = azuread_group.groups["Security Reader"].object_id
}
output "sentinel_automation_contributor" {
  value = azuread_group.groups["Microsoft Sentinel Automation Contributor"].object_id
}

