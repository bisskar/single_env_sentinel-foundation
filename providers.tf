terraform {

  required_version = "~> 1.8"

  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.101.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.48.0"
    }
  }
}

provider "azurerm" {
  features {}
}