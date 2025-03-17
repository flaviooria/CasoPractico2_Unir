# Generamos el fichero acr_vars.yml para los playbooks de ansible
resource "null_resource" "remove_vars_if_exists" {
  depends_on = [azurerm_container_registry.acr]

  provisioner "local-exec" {
    command = "rm -f ../ansible/vars/acr_vars.yml"
  }
}

resource "local_file" "ansible_acr_file_vars" {

  depends_on = [null_resource.remove_vars_if_exists, azurerm_container_registry.acr]

  filename = "${path.root}/../ansible/vars/acr_vars.yml"
  content = templatefile("${path.root}/templates/vars.tftpl", {
    acr_username     = azurerm_container_registry.acr.admin_username,
    acr_login_server = azurerm_container_registry.acr.login_server,
  })

  file_permission = "0600" # Seguridad: solo el usuario puede leer/escribir
}

# Generamos el fichero secrets.enc para ejecutar playbooks que requieran la contraseña
resource "null_resource" "remove_password_vars_if_exists" {
  depends_on = [azurerm_container_registry.acr]

  provisioner "local-exec" {
    command = "rm -f ${path.root}/../ansible/vars/secrets.enc"
  }
}

resource "local_file" "ansible_password_file_vars" {

  depends_on = [null_resource.remove_password_vars_if_exists, azurerm_container_registry.acr]

  filename = "${path.root}/../ansible/vars/secrets.enc"
  content = templatefile("${path.root}/templates/password_var.tftpl", {
    acr_password = azurerm_container_registry.acr.admin_password,
  })

  file_permission = "0600" # Seguridad: solo el usuario puede leer/escribir
}

resource "null_resource" "cifrate_acr_password_ansible_vault" {
  depends_on = [local_file.ansible_acr_file_vars]

  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "ansible-vault encrypt ${path.root}/../ansible/vars/secrets.enc --vault-password-file ${path.root}/../ansible/vars/.vault-pass"
  }
}