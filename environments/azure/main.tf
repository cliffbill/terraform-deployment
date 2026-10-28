terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "azure_infrastructure" {
  source   = "git::https://github.com/cliffbill/terraform-modules.git//azure/network?ref=v2.0.1"
  location = "eastus2"
}
