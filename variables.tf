variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type = string
}

variable "location" {
  description = "Location of the cluster"
  type = string
}

variable "cluster_oidc_issuer_url" {
  description = "The oidc url of the eks cluster"
  type        = string
}

variable "thanos_svc_acc" {
  description = "The k8s thanos service account name"
  type        = string
}

variable "thanos_namespace" {
  description = "The k8s thanos namespace"
  type        = string
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "AWS Tags common to all the resources created"
}
