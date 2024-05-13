output "key" {
  value     = module.vm.admin_password
  sensitive = true
}