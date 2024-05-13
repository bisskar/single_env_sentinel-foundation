terraform {

  required_version = "~> 1.8"

  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}