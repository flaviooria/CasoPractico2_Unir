variable "subscription_id" {
  description = "La suscripción de Azure"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "La identificación del inquilino de Azure"
  type        = string
  sensitive   = true
}

variable "admin_user" {
  description = "El nombre de usuario de la VM"
  type        = string
  sensitive   = true
}