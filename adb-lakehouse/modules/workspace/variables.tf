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
  description = "Names of additional storage accounts to create"
  default     = []
}
