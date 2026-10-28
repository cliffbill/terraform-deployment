# Infraestructura Multi-Cloud con Terraform y Platform Engineering

Repositorio consumidor de infraestructura que implementa despliegues automatizados y modulares en **AWS**, **Microsoft Azure** y **Google Cloud Platform (GCP)** siguiendo buenas prácticas de Platform Engineering y DevOps.

---

## Estructura del Repositorio
terraform-deployment/
├── environments/
│   ├── aws/       # Entorno aislado para AWS (us-east-1)
│   ├── azure/     # Entorno aislado para Azure (eastus2)
│   └── gcp/       # Entorno aislado para GCP (us-central1)
├── .github/
│   └── workflows/
│       └── terraform.yml  # Pipeline automatizado Multi-Cloud
└── README.md

---

## Requisitos Previos
- Terraform >= 1.6.0 instalado.
- PowerShell o terminal compatible.
- Credenciales Cloud configuradas localmente:
  - AWS: AWS CLI configurado.
  - Azure: Azure CLI autenticado (`az login`).
  - GCP: gcloud SDK autenticado (`gcloud auth application-default login`).

---

## Instrucciones de Uso y Despliegue Local

1. Navegar al entorno deseado:
   ```powershell
   cd environments/gcp   # O bien environments/aws o environments/azure
Inicializar Terraform (descarga el módulo remoto desde GitHub):

PowerShell
terraform init
Planificar los cambios:

PowerShell
terraform plan
Aplicar el despliegue:

PowerShell
terraform apply
Limpieza y Destrucción de Recursos
Para evitar costos innecesarios en los entornos de laboratorio, destruye la infraestructura al finalizar:

PowerShell
terraform destroy
Automatización con GitHub Actions
El repositorio incluye un pipeline en .github/workflows/terraform.yml que permite ejecutar el ciclo de vida de Terraform mediante un selector manual (workflow_dispatch) eligiendo el proveedor cloud deseado.
