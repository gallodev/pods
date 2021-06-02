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
  name = "rg-${var.project_name}"
  location = "eastus"
}

resource "azurerm_virtual_network" "vn-ultima-aula" {
  name = "vn-${var.project_name}"
  address_space = ["10.0.0.0/16"]
  location = "eastus"
  resource_group_name = azurerm_resource_group.rg-ultima-aula.name
}

module "registry" {
  source = "./registry"

  azurerm_resource_group_name = azurerm_resource_group.rg-ultima-aula.name
  azurerm_resource_group_location = azurerm_resource_group.rg-ultima-aula.location
  project_name="ultima-aula"
}

module "cluster" {
  source = "./cluster"

  azurerm_resource_group_name = azurerm_resource_group.rg-ultima-aula.name
  azurerm_resource_group_location = azurerm_resource_group.rg-ultima-aula.location  
  app_id = var.app_id
  password = var.app_password
  
}

