sentinel-landing-zone
===========

<p align="center">
  <img src="https://github.com/bisskar/SentinelContent/assets/65374155/5dc93d74-1cc3-4e1f-83e5-d45aac05a9c4">
</p>

## Overview
This Terraform root module is designed to deploy an IaaC Microsoft Sentinel landing zone setup, including Storage Account for Terraform State file, Resource Groups, Log Analytics Workspace, Sentinel configurations, RBAC permissions, Key Vault, and optionally Virtual Machines and Scale Sets.

### Prerequisites
Before deploying, ensure you have the necessary permissions and configurations:
- Review and understand the required [Azure RBAC permissions](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference).
- Use `az ad sp create-for-rbac` to create a service principal with the appropriate role assignments scoped to your subscription.

### Create Service Principal
```powershell
az ad sp create-for-rbac --name "<desired_display_name>" --role="Owner" --scopes="/subscriptions/<subscription_id>"
# Set environment variables for ARM authentication // local deployment
$env:ARM_CLIENT_ID       = "<client_id>"
$env:ARM_CLIENT_SECRET   = "<client_secret>"
$env:ARM_TENANT_ID       = "<tenant_id>"
$env:ARM_SUBSCRIPTION_ID = "<subscription_id>"

# Clear environment variables after use (optional)
Remove-Item -Path Env:\ARM_CLIENT_ID
Remove-Item -Path Env:\ARM_CLIENT_SECRET
Remove-Item -Path Env:\ARM_TENANT_ID
Remove-Item -Path Env:\ARM_SUBSCRIPTION_ID

# Verify environment variables (optional)
gci env:ARM_*
```

### Authenticate with Azure CLI using service principal
```powershell
az login --service-principal -u "$env:ARM_CLIENT_ID" -p "$env:ARM_CLIENT_SECRET" --tenant "$env:ARM_TENANT_ID"
```

### Grant permissions to the registered application (replace <client_id> with your app ID)
# Required application permissions:

- `Application.ReadWrite.All`, ID: 1bfefb4e-e0b5-418b-a88f-73c46d2cc8e9	
- `Directory.Read.All`, ID: 7ab1d382-f21e-4acd-a863-ba3e13f7da61	
- `Group.ReadWrite.All`, ID: 62a82d76-70ea-41e2-9197-370581804d09	
- `Directory.ReadWrite.All`, ID: 19dbc75e-c2e2-444c-a770-ec69d8559fc7	
- `APIConnectors.ReadWrite.All`, ID: 1dfe531a-24a6-4f1b-80f4-7a0dc5a0a171	
- `AppRoleAssignment.ReadWrite.All`, ID: 06b708a9-e830-4db3-a914-8e69da51d44f	
- `RoleManagement.ReadWrite.Directory`, ID: 9e3f62cf-ca93-4989-b6ce-bf83c28f9fe8	

```powershell
$p1 = az ad app permission add --id <app-id> --api 00000003-0000-0000-c000-000000000000 --api-permissions 1bfefb4e-e0b5-418b-a88f-73c46d2cc8e9=Role
$p2 = az ad app permission add --id <app-id> --api 00000003-0000-0000-c000-000000000000 --api-permissions 7ab1d382-f21e-4acd-a863-ba3e13f7da61=Role
$p3 = az ad app permission add --id <app-id> --api 00000003-0000-0000-c000-000000000000 --api-permissions 62a82d76-70ea-41e2-9197-370581804d09=Role
$p4 = az ad app permission add --id <app-id> --api 00000003-0000-0000-c000-000000000000 --api-permissions 19dbc75e-c2e2-444c-a770-ec69d8559fc7=Role
$p5 = az ad app permission add --id <app-id> --api 00000003-0000-0000-c000-000000000000 --api-permissions 1dfe531a-24a6-4f1b-80f4-7a0dc5a0a171=Role
$p6 = az ad app permission add --id <app-id> --api 00000003-0000-0000-c000-000000000000 --api-permissions 06b708a9-e830-4db3-a914-8e69da51d44f=Role
$p7 = az ad app permission add --id <app-id> --api 00000003-0000-0000-c000-000000000000 --api-permissions 9e3f62cf-ca93-4989-b6ce-bf83c28f9fe8=Role
```

# Admin consent for the permissions (replace <client_id> with your app ID)

```powershell
az ad app permission admin-consent --id <client_id>
```

### Locals
The following local variables are required for configuring this Terraform deployment:

- `region`: Azure Region where resources will be deployed (e.g., "westeurope").
- `subscription_name`: Azure Subscription name used for deployment (e.g., "public-cloud").
- `tfstate_storage_name`: Name of the Azure Storage Account used for Terraform state management (e.g., "state20240503").
- `law_name`: Name of the Log Analytics Workspace (e.g., "public-cloud-law") for monitoring and analytics.


Authors
=======
Oskar Kazmierczyk
bisskar@gmail.com





