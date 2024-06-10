terraform {

  required_version = "~> 1.8"

  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.107.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.49.1"
    }
  }
}

provider "azurerm" {
  features {}
}