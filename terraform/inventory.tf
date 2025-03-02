resource "local_file" "create_inventory" {

  depends_on = [tls_private_key.ssh_key, local_file.ssh_key_file, azurerm_linux_virtual_machine.vm_cp2]

  filename = "${path.root}/../ansible/inventory.ini"
  content = templatefile("${path.root}/templates/inventory.tftpl", {
    vm_name    = azurerm_linux_virtual_machine.vm_cp2.name
    vm_ip      = azurerm_linux_virtual_machine.vm_cp2.public_ip_address
    admin_user = var.admin_user
  })
}