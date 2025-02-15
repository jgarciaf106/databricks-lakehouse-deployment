# Required GitHub Action Secrets  

This repository uses GitHub Actions to automate infrastructure deployment using Terraform. The workflow requires several secrets to be configured in the repository settings under **Settings** → **Secrets and variables** → **Actions** → **New repository secret**.

## 🔒 Required Secrets  

| Secret Name                  | Description |
|------------------------------|-------------|
| `BACKEND_RG_NAME`            | Azure resource group name for Terraform backend storage. |
| `BACKEND_SA_NAME`            | Azure storage account name for Terraform backend. |
| `BACKEND_CONTAINER_NAME`     | Azure storage container name for Terraform backend. |
| `BACKEND_KEY`                | Terraform state file name (key) used in the backend configuration. |
| `AZURE_SUBSCRIPTION_ID`      | Azure subscription ID for authentication. |
| `AZURE_TENANT_ID`           | Azure tenant ID for authentication. |
| `AZURE_CLIENT_ID`           | Azure service principal client ID for authentication. |
| `AZURE_CLIENT_SECRET`       | Azure service principal client secret for authentication. |
| `DATABRICKS_ACCOUNT_ID`     | Databricks account ID for authentication. |
| `DATABRICKS_CLIENT_ID`      | Databricks OAuth client ID for authentication. |
| `DATABRICKS_CLIENT_SECRET`  | Databricks OAuth client secret for authentication. |
| `DEPLOYMENT_CONFIG`          | Multi-line configuration for Databricks deployment (see below). |

## 📄 DEPLOYMENT_CONFIG Format

The `DEPLOYMENT_CONFIG` secret must be set as a **multi-line** secret with the following key-value pairs:

```plaintext
databricks_workspace_name=databricks-workspace-name
environment_name=dev-qa-prd
location=dazure-region
managed_resource_group_name=resource.group.mrg
metastore_name=metastore-name
project_name=project-name
resource_group_name=resource.group.rg
private_subnet_address_prefixes=[\"16.0.1.0/24\"]
public_subnet_address_prefixes=[\"16.0.2.0/24\"]
vnet_address_space=16.0.0.0/22
storage_account_names=[\"storageaccount\"]
tags={\"owner\":\"email@email.com\"}
dev_team=[\"email@email.com\"]
```

## 🔧 Setting Up Secrets

To configure these secrets in your GitHub repository:

1. Navigate to your GitHub repository.
2. Go to **Settings** → **Secrets and variables** → **Actions**.
3. Click **New repository secret**.
4. Add each secret with its respective value.
5. Save and repeat for all required secrets.

## 🛠 Usage in GitHub Actions

These secrets are referenced in the GitHub Actions workflow to securely provide credentials and backend configurations. They are used in Terraform commands as environment variables.