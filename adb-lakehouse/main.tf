module "workspace" {
  source                          = "./modules/workspace"
  project_name                    = var.project_name
  environment_name                = var.environment_name
  location                        = var.location
  vnet_address_space              = var.vnet_address_space
  resource_group_name             = var.resource_group_name
  managed_resource_group_name     = var.managed_resource_group_name
  databricks_workspace_name       = var.databricks_workspace_name
  private_subnet_address_prefixes = var.private_subnet_address_prefixes
  public_subnet_address_prefixes  = var.public_subnet_address_prefixes
  storage_account_names           = var.storage_account_names
  tags                            = var.tags
}

module "uc-metastore" {
  depends_on       = [module.workspace]
  source           = "./modules/unity-catalog"
  metastore_name   = var.metastore_name
  workspace_id     = module.workspace.workspace_id
  location         = var.location
  project_name     = var.project_name
  environment_name = var.environment_name
  dev_team         = var.dev_team
  providers = {
    databricks = databricks.account
  }
}

