output "thanos_identity_client_id" {
  value = azurerm_user_assigned_identity.thanos.client_id
}

output "thanos_container_id" {
  value = azurerm_storage_container.thanos.id
}