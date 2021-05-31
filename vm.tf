terraform {
  required_version = ">= 0.13"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

resource "azurerm_resource_group" "rg-ultima-aula" {
  name = "rgUltimaAula"
  location = "eastus"
}

resource "azurerm_virtual_network" "vn-ultima-aula" {
  name = "vnUltimaAula"
  address_space = ["10.0.0.0/16"]
  location = "eastus"
  resource_group_name = azurerm_resource_group.rg-ultima-aula.name
}