# CloudMon: Azure Cloud Monitoring & Remediation System

## 📌 Overview
CloudMon monitors Azure resources using a Python agent and remediates issues using a Go microservice. Infrastructure is managed with Terraform and configurations are handled in YAML.

## 🔧 Tech Stack
- Python
- Go
- YAML
- Terraform
- Azure

## 🚀 Setup
1. Clone repo
2. `cd terraform && terraform init && terraform apply`
3. Install Python deps: `pip install -r monitor_agent/requirements.txt`
4. Run `agent.py`
5. Run `main.go`

## 📁 Structure
- `monitor_agent/` - Python CPU monitor
- `remediation_service/` - Go server
- `terraform/` - IaC for Azure

1. Deploy Python Agent:
   - Use `deploy/vm_startup_script.sh` to auto-start agent on Azure VMs via cloud-init or remote SSH.

2. Deploy Go Remediation Service:
   - Build and publish Docker image.
   - Use `deploy/container_app_bicep.bicep` to deploy it to Azure Container Apps or package it in Azure Function with custom container.
   - Make sure to create an Azure Managed Environment named `cloudmon-env` beforehand.

3. Networking:
   - Use Azure VNet, subnets, and private endpoints to restrict communication securely.

## 📈 Enhancements
- Integrate Application Insights SDKs in both services for telemetry.
- Setup Azure Monitor or Grafana dashboard for visual insights.
- Use Azure Key Vault to manage secrets for both Python and Go components.
- Add CI/CD pipeline using GitHub Actions (see `.github/workflows/ci-cd.yml`) or Azure DevOps.


## 🧠 Author
Nasze’ Royster
