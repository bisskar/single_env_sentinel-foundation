terraform {

  required_version = "~> 1.8"

  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.103.1"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.51.0"
    }
  }
}

provider "azurerm" {
  features {}
}