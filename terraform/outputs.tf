output "public_ip" {
  value = azurerm_linux_virtual_machine.vm_cp2.public_ip_address
}

output "acr_name" {
  description = "Nombre del Azure Container Registry"
  value       = azurerm_container_registry.acr.name
}

output "acr_login_server" {
  description = "Servidor de login del ACR"
  value       = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  description = "Usuario administrador del ACR"
  value       = azurerm_container_registry.acr.admin_username
}

output "acr_admin_password" {
  description = "Contraseña del usuario administrador del ACR"
  value       = azurerm_container_registry.acr.admin_password
  sensitive   = true # Oculta la salida en la terminal
}
