resource "azurerm_kubernetes_cluster" "default" {
  name                = "cub-ultima-aula"
  location            = var.azurerm_resource_group_location
  resource_group_name = var.azurerm_resource_group_name
  dns_prefix          = "cub-ultima-aula"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.app_id
    client_secret = var.password
  }

  role_based_access_control {
    enabled = true
  }

  addon_profile {
    http_application_routing {
      enabled = true
    }
  }
}