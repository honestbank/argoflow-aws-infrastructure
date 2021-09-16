locals {
  kubeflow_oidc_provider = split("oidc-provider/", var.kubeflow_cluster_oidc_provider_arn).1
}
