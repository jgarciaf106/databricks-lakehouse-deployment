# metastore creation
resource "databricks_metastore" "databricks-metastore" {
  name          = var.metastore_name
  owner         = var.dev_team[0]
  force_destroy = true
  region        = var.location
}

