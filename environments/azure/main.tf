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

resource "azurerm_resource_group" "rg" {
  name     = "prod-azure-lab-rg"
  location = "eastus2"
  tags = {
    Environment = "production"
    Owner       = "platform-engineering"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "prod-azure-lab-vnet"
  address_space       = ["10.200.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "prod-azure-lab-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.200.1.0/24"]
}
