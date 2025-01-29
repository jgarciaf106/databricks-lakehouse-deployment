resource "azurerm_storage_account" "dls" {
  depends_on               = [azurerm_resource_group.this]
  count                    = length(var.storage_account_names)
  name                     = "dls${var.storage_account_names[count.index]}"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags                     = var.tags
  is_hns_enabled           = true
}
