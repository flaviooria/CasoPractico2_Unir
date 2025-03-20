resource "azurerm_container_registry" "acr" {
  name                = "acrCp2"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  admin_enabled       = true

  public_network_access_enabled = true

  tags = {
    environment = "cp2"
  }
}