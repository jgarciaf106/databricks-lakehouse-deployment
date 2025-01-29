variable "workspace_id" {
  type        = string
  description = "The ID of Databricks workspace"
}

variable "location" {
  type        = string
  description = "(Required) The location for the resources in this module"
}

variable "metastore_name" {
  type        = string
  description = "the name of the metastore"
}

variable "project_name" {
  type        = string
  description = "(Required) The name of the project associated with the infrastructure to be managed by Terraform"
}

variable "environment_name" {
  type        = string
  description = "(Required) The name of the project environment associated with the infrastructure to be managed by Terraform"
}

variable "dev_team" {
  type        = list(string)
  description = "List of developers in the dev team"
}