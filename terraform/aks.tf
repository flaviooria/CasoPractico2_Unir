resource "azurerm_kubernetes_cluster" "aks_cp2" {
  name                = "fop-aks-${var.tag_environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "fop-aks-${var.tag_environment}"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = var.tag_environment
  }
}

resource "azurerm_role_assignment" "aks_acr" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks_cp2.kubelet_identity[0].object_id
  skip_service_principal_aad_check = true
}