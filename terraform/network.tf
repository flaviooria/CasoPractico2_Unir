# Create virtual network
resource "azurerm_virtual_network" "avnet_cp2" {
  name                = "${var.tag_environment}_network"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = var.tag_environment
  }
}

resource "azurerm_subnet" "subnet_cp2" {
  name                 = "subnet_${var.tag_environment}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.avnet_cp2.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "ip_cp2" {
  name                = "ip_${var.tag_environment}_public"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Basic"

  tags = {
    environment = var.tag_environment
  }
}


# Create network interface
resource "azurerm_network_interface" "nic_cp2" {
  name                = "nic_${var.tag_environment}_network"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "nic_ip_${var.tag_environment}_config"
    subnet_id                     = azurerm_subnet.subnet_cp2.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.4"
    public_ip_address_id          = azurerm_public_ip.ip_cp2.id
  }

  tags = {
    environment = var.tag_environment
  }
}