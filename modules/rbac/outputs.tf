output "contributor" {
  value       = azuread_group.groups["Contributor"].object_id
  description = "Contributor role with the subscription scope"
}

output "sentinel_responder" {
  value       = azuread_group.groups["Microsoft Sentinel Responder"].object_id
  description = "Microsoft Sentinel Responder role with the subscription scope"
}

output "sentinel_reader" {
  value       = azuread_group.groups["Microsoft Sentinel Reader"].object_id
  description = "Microsoft Sentinel Reader role with the subscription scope"
}

output "sentinel_contributor" {
  value       = azuread_group.groups["Microsoft Sentinel Contributor"].object_id
  description = "Microsoft Sentinel Contributor role with the subscription scope"
}

output "sentinel_playbook_operator" {
  value       = azuread_group.groups["Microsoft Sentinel Playbook Operator"].object_id
  description = "Microsoft Sentinel Playbook Operator role with the subscription scope"
}

output "sentinel_logic_app_contributor" {
  value       = azuread_group.groups["Logic App Contributor"].object_id
  description = "Logic App Contributor role with the subscription scope"
}

output "owner" {
  value       = azuread_group.groups["Owner"].object_id
  description = "Owner role with the subscription scope"
}

output "security_reader" {
  value       = azuread_group.groups["Security Reader"].object_id
  description = "Security Reader role with the subscription scope"
}

output "sentinel_automation_contributor" {
  value       = azuread_group.groups["Microsoft Sentinel Automation Contributor"].object_id
  description = "Microsoft Sentinel Automation Contributor role with the subscription scope"
}