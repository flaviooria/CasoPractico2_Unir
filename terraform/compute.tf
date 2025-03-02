resource "azurerm_linux_virtual_machine" "vm_cp2" {
  depends_on = [tls_private_key.ssh_key]

  name                = "vm-cp2"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B1s"
  admin_username      = var.admin_user
  network_interface_ids = [
    azurerm_network_interface.nic_cp2.id
  ]

  admin_ssh_key {
    username   = var.admin_user
    public_key = tls_private_key.ssh_key.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}