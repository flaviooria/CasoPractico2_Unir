resource "azurerm_network_security_group" "nsg_cp2" {
  name                = "nsg_${var.tag_environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTPS"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = var.tag_environment
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "nisg_cp2" {
  network_interface_id      = azurerm_network_interface.nic_cp2.id
  network_security_group_id = azurerm_network_security_group.nsg_cp2.id
}