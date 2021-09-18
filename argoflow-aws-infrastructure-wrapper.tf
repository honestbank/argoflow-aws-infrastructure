module "argoflow_aws_infrastructure" {
  source = "./terraform"

  aws_eks_cluster_primary_security_group_id               = var.aws_eks_cluster_primary_security_group_id
  aws_load_balancer_controller_namespace                  = var.aws_load_balancer_controller_namespace
  aws_load_balancer_controller_service_account_name       = var.aws_load_balancer_controller_service_account_name
  aws_region                                              = var.aws_region
  aws_vpc_id                                              = var.aws_vpc_id
  aws_vpc_private_subnets                                 = var.aws_vpc_private_subnets
  aws_vpc_public_subnets                                  = var.aws_vpc_public_subnets
  cluster_autoscaler_kubernetes_service_account_name      = var.cluster_autoscaler_kubernetes_service_account_name
  cluster_autoscaler_kubernetes_service_account_namespace = var.cluster_autoscaler_kubernetes_service_account_namespace
  eks_cluster_name                                        = var.eks_cluster_name
  kubeflow_cluster_oidc_provider_arn                      = var.kubeflow_cluster_oidc_provider_arn
  stage                                                   = var.stage
}
