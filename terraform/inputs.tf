# ###################################################################################################################
# argoflow-aws-infrastructure input variables
# ###################################################################################################################

variable "aws_eks_cluster_primary_security_group_id" {
  type        = string
  description = "Corresponds to the `cluster_primary_security_group_id` [output variable of the AWS EKS Terraform module](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest?tab=outputs)"
}

variable "aws_load_balancer_controller_namespace" {
  type        = string
  description = "The Kubernetes Namespace containing the aws-load-balancer-controller KSA (Kubernetes Service Account)"
  default     = "kube-system"
}

variable "aws_load_balancer_controller_service_account_name" {
  type        = string
  description = "The name of the aws-load-balancer-controller KSA (Kubernetes Service Account)"
  default     = "aws-load-balancer-controller"
}

variable "aws_region" {
  type        = string
  description = "The AWS region in which to build resources"
}

variable "aws_vpc_id" {
  type        = string
  description = "The VPC ID where the argoflow-aws instance will be located"
}

variable "aws_vpc_private_subnets" {
  type        = list(string)
  description = "A list of the private VPC subnet IDs used by the Kubeflow EKS cluster"
}

variable "aws_vpc_public_subnets" {
  type        = list(string)
  description = "A list of the public VPC subnet IDs used by the Kubeflow EKS cluster"
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

variable "eks_cluster_name" {
  type        = string
  description = "The name of the EKS (Elastic Kubernetes Service) cluster."
}

variable "kubeflow_cluster_oidc_provider_arn" {
  description = "The OIDC provider ARN of the Kubeflow Kubernetes cluster"
}

variable "stage" {
  description = "The stage (environment) of the build - usually one of [test, dev, qa, prod]"
}
