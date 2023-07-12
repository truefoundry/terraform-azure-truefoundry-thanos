resource "azurerm_user_assigned_identity" "thanos" {
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = local.thanos_unique_name
}

# https://azure.github.io/azure-workload-identity/docs/quick-start.html
resource "azurerm_federated_identity_credential" "thanos" {
  name                = local.thanos_unique_name
  resource_group_name = var.resource_group_name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = var.cluster_oidc_issuer_url
  parent_id           = azurerm_user_assigned_identity.thanos.id
  subject             = "system:serviceaccount:${var.thanos_namespace}:${var.thanos_svc_acc}"
}
