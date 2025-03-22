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

variable "rg_cp2_name" {
  description = "El nombre del grupo de recursos"
  type        = string
  default     = "rg-terraform-cp2"
}

variable "location" {
  description = "La ubicación de los recursos"
  type        = string
  default     = "West Europe"
}

variable "tag_environment" {
  description = "El entorno de los recursos"
  type        = string
  default     = "cp2"
}

variable "acr_name" {
  description = "Nombre del registro de contenedores"
  type        = string
  default     = "acrCp2"
}