resource "local_file" "ansible_vars" {

  depends_on = [azurerm_container_registry.acr]

  filename = "${path.root}/../ansible/vars/vars.yml"
  content = templatefile("${path.root}/templates/vars.tftpl", {
    acr_username     = azurerm_container_registry.acr.admin_username,
    acr_password     = azurerm_container_registry.acr.admin_password,
    acr_login_server = azurerm_container_registry.acr.login_server,
  })

  file_permission = "0600" # Seguridad: solo el usuario puede leer/escribir
}

resource "null_resource" "cifrate_vars" {
  depends_on = [local_file.ansible_vars]

  provisioner "local-exec" {
    command = "ansible-vault encrypt ${path.root}/../ansible/vars/vars.yml --vault-password-file ${path.root}/../ansible/vars/.vault-pass"
  }
}