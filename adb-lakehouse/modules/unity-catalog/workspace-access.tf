resource "databricks_mws_permission_assignment" "grp-workspace-assignment" {
  workspace_id = var.workspace_id
  principal_id = data.databricks_user.user.id
  permissions  = ["ADMIN"]
}
