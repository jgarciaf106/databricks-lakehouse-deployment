variable "azure_client_id" {
  type        = string
  description = "Azure Client ID"
}

variable "azure_client_secret" {
  type        = string
  description = "Azure Client ID"
}

variable "azure_tenant_id" {
  type        = string
  description = "Azure Client ID"
}

variable "azure_subscription_id" {
  type        = string
  description = "Azure Client ID"
}


variable "location" {
  type        = string
  description = "(Required) The location for the resources in this module"
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group to create"
}

variable "managed_resource_group_name" {
  type        = string
  description = "(Optional) The name of the resource group where Azure should place the managed Databricks resources"
  default     = ""
}

variable "project_name" {
  type        = string
  description = "(Required) The name of the project associated with the infrastructure to be managed by Terraform"
}

variable "environment_name" {
  type        = string
  description = "(Required) The name of the project environment associated with the infrastructure to be managed by Terraform"
}

variable "vnet_address_space" {
  type        = string
  description = "(Required) The address space for the spoke Virtual Network"
}

variable "tags" {
  type        = map(string)
  description = "(Required) Map of tags to attach to resources"
  default     = {}
}

variable "databricks_workspace_name" {
  type        = string
  description = "Name of Databricks workspace"
}

variable "private_subnet_address_prefixes" {
  type        = list(string)
  description = "Address space for private Databricks subnet"
}

variable "public_subnet_address_prefixes" {
  type        = list(string)
  description = "Address space for public Databricks subnet"
}

variable "storage_account_names" {
  type        = list(string)
  description = "Names of the different storage accounts"
  default     = []
}

variable "metastore_name" {
  type        = string
  description = "the name of the metastore"
}
variable "account_id" {
  type        = string
  description = "Databricks Account ID"
}

variable "dev_team" {
  type        = list(string)
  description = "List of developers in the dev team"
}
