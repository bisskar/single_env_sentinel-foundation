output "key" {
  value       = module.vm.admin_password
  sensitive   = true
  description = "VM Admin password"
}