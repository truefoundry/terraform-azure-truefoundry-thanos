resource "azurerm_storage_account" "thanos" {
  name                     = replace(local.thanos_unique_name, "-", "")
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.tags
}

resource "azurerm_storage_container" "thanos" {
  name                  = local.thanos_unique_name
  storage_account_name  = azurerm_storage_account.thanos.name
  container_access_type = "blob"
}

resource "azurerm_role_assignment" "storage_thanos" {
  scope                = azurerm_storage_container.thanos.resource_manager_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.thanos.principal_id
}
