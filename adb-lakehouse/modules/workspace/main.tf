resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}


locals {
  rg_name     = azurerm_resource_group.this.name
  rg_id       = azurerm_resource_group.this.id
  rg_location = azurerm_resource_group.this.location
}

data "azurerm_client_config" "current" {
}
