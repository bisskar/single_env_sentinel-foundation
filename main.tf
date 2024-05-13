#Resource Groups, Log Analytics Workspace, Sentinel
module "rgs-law-sentinel" {
  source            = "./modules/rgs-law-sentinel"
  location          = var.location
  subscription_name = var.subscription_name
  law_name          = var.law_name
}

# Entra ID Security Groups, subscription scope
module "rbac" {
  source            = "./modules/rbac"
  subscription_name = var.subscription_name

  depends_on = [module.rgs-law-sentinel]
}

# Keyvault
module "keyvault" {
  source                     = "./modules/keyvault"
  resource_group_rg-keyvault = module.rgs-law-sentinel.rg-keyvault
  location                   = var.location

  depends_on = [module.rgs-law-sentinel]
}

# # Virtual Machine 
# module "virtual-machine" {
#     source = "./modules/virtual-machine"
#     subscription_name = local.subscription_name
#     resource_group_rg-vms = module.rgs-law-sentinel.rg-vms
#     keyvault_resource_id = module.keyvault.keyvault_resource_id
#     region = local.region
# }

# Scaleset
# module "scaleset" {
#     source = "./modules/scaleset"
#     region = local.region    
#     resource_group_rg_scaleset = module.rgs-law-sentinel.rg-scaleset    
# }
