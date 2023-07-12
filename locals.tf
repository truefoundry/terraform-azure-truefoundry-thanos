locals {
  thanos_unique_name = substr("thanos-${var.cluster_name}", 0, 20)
  tags = merge(
    {
      "terraform-module" = "cluster-app-thanos"
      "terraform"        = "true"
    },
    var.tags
  )
}