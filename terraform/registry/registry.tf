resource "azurerm_container_registry" "acr-ultima-aula" {
  name                     = "acrUltimaAula"
  resource_group_name      = var.azurerm_resource_group_name
  location                 = var.azurerm_resource_group_location
  sku                      = "Basic"
  admin_enabled            = false
}

output "azurerm_container_registry_id" {
  value = azurerm_container_registry.acr-ultima-aula.id
}