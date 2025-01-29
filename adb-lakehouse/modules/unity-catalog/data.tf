data "databricks_user" "user" {
  user_name = var.dev_team[0]
}
