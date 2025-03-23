- Volver al [inicio](../README.md)

# Estructura del proyecto

```bash
├── acr_credentials.tf
├── acr.tf
├── aks_generate_config.tf
├── aks.tf
├── compute.tf
├── generate_ssh_file.tf
├── inventory.tf
├── main.tf
├── network.tf
├── outputs.tf
├── README.md
├── security.tf
├── ssh_key.tf
├── templates
│   ├── inventory.tftpl
│   ├── password_var.tftpl
│   └── vars.tftpl
└── variables.tf
```

# Requisitos
- Tener instalado terraform >= v1.11 [instalar](https://developer.hashicorp.com/terraform/install)

# Iniciar proyecto

```bash
terraform init
```

# Ejecutar proyecto

```bash
terraform apply -auto-approve
```

# Destruir proyecto

```bash
terraform destroy -auto-approve
```
