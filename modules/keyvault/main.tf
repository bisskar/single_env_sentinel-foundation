# This is the module call
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.1"
}

module "keyvault" {
  source                        = "Azure/avm-res-keyvault-vault/azurerm"
  version                       = "~> 0.5.3"
  name                          = module.naming.key_vault.name_unique
  location                      = var.location
  resource_group_name           = var.resource_group_rg-keyvault
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  public_network_access_enabled = false

  network_acls = {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

  role_assignments = {
    deployment_user_secrets = {
      role_definition_id_or_name = "Key Vault Secrets Officer"
      principal_id               = data.azurerm_client_config.current.object_id
    },
    deployment_user_keys = {
      role_definition_id_or_name = "Key Vault Crypto Officer"
      principal_id               = data.azurerm_client_config.current.object_id
    }
  }

  wait_for_rbac_before_secret_operations = {
    create = "60s"
  }

  tags = {
    terraform = "True"
  }
}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [module.keyvault]

  create_duration = "30s"
}