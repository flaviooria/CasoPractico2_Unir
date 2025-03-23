- Volver al [inicio](../README.md)

## Estructura de proyecto ansible
```bash
├── collections
│   └── requirements.yml
├── playbooks
│   ├── acr_playbook.yml
│   ├── aks_playbook.yml
│   ├── httpd_playbook.yml
│   ├── k8s
│   │   ├── api-deployment.yml
│   │   ├── api-service.yml
│   │   ├── backend-pvc.yml
│   │   ├── db-deployment.yml
│   │   ├── db-service.yml
│   │   ├── env-configmap.yml
│   │   └── secrets.yml
│   └── podman_playbook.yml
├── README.md
├── templates
│   └── api_deployment.j2
└── vars
    └── aks_vars.yml
```
## Requisitos
- Python >=3.10
- SO Linux

## Instalación 

```bash
pip install ansible
pip install ansible-lint
pip install kubernetes
```

## Instalar colecciones de ansible
```bash
ansible-galaxy collection install -r collections/requirements.yml
```

## Comandos para ejecutar este proyecto con ansible 

- Probar la conexión a la maquina virtual - host vm-cp2

```bash
ansible -i inventory.ini vm-cp2 -m ping   
```

- Ejecutar playbooks de ansible
```bash
./playbooks/
├── acr_playbook.yml
├── aks_playbook.yml
├── httpd_playbook.yml
├── k8s/
│   ├── api-deployment.yml
│   ├── api-service.yml
│   ├── backend-pvc.yml
│   ├── db-deployment.yml
│   ├── db-service.yml
│   ├── env-configmap.yml
│   └── secrets.yml
└── podman_playbook.yml
```

- Instalar podman en la vm
```bash
ansible-playbook -i inventory.ini playbooks/podman_playbook.yml 
```

- Ejecutar playbook para subir imagen a ACR y descargar la imagen

```bash
ansible-playbook -i inventory.ini -e @vars/secrets.enc --vault-password-file vars/.vault-pass playbooks/acr_playbook.yml
```

- Ejecutar playbook para crear contenedor de servidor web apache2
```bash
ansible-playbook -i inventory.ini playbooks/httpd_playbook.yml
```

- Luego probar en: `https://<ip_publica>:8443`
- Crendenciales: usuario: adminuser, password: admin123#

- Ejecutar playbook para crear cluster de kubernetes y desplegar la app
```bash
ansible-playbook -i inventory.ini playbooks/aks_playbook.yml
```

