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
  source = "git::https://github.com/cliffbill/terraform-modules.git//azure/network?ref=v2.0.0"

  name_prefix    = "prod-azure-lab"
  location       = "East US"
  vnet_cidr      = ["10.200.0.0/16"]
  subnet_cidr    = ["10.200.1.0/24"]
  admin_username = "azureadmin"

  tags = {
    Environment = "production"
    Owner       = "platform-engineering"
  }
}
