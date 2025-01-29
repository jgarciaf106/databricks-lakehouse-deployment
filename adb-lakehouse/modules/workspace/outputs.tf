output "workspace_id" {
  value       = azurerm_databricks_workspace.this.workspace_id
  description = "ID of the Databricks workspace"
}
output "workspace_url" {
  value       = "https://${azurerm_databricks_workspace.this.workspace_url}"
  description = "URL of the Databricks workspace"
}
