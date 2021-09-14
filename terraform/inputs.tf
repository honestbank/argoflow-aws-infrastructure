# ###################################################################################################################
# General
# ###################################################################################################################

variable "aws_region" {
  description = "The AWS region in which to build resources"
}

variable "stage" {
  description = "The stage (environment) of the build - usually one of [test, dev, qa, prod]"
}

# Kubernetes Cluster Autoscaler: https://github.com/kubernetes/autoscaler
# Cluster Autoscaler YAML: https://raw.githubusercontent.com/kubernetes/autoscaler/master/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml

variable "cluster_autoscaler_kubernetes_service_account_name" {
  description = "The Kubernetes Service Account used by the cluster-autoscaler pod"
  default     = "cluster-autoscaler"
}

variable "cluster_autoscaler_kubernetes_service_account_namespace" {
  description = "The Kubernetes Namespace in which the cluster-autoscaler Service Account is located"
  default     = "kube-system"
}

variable "kubeflow_cluster_oidc_provider_arn" {
  description = "The OIDC provider ARN of the Kubeflow Kubernetes cluster"
}
