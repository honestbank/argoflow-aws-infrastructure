output "kubeflow_rds_host" {
  description = "The hostname of the Kubeflow RDS instance"
  value       = module.argoflow_aws_infrastructure.kubeflow_rds_host
}

output "kubeflow_cluster_autoscaler_iam_role_arn" {
  description = "The ARN of the IAM role to be used by the Cluster Autoscaler"
  value       = module.argoflow_aws_infrastructure.kubeflow_cluster_autoscaler_iam_role_arn
}

output "kubeflow_aws_load_balancer_controller_iam_role_arn" {
  description = "The ARN of the IAM role to be used by the AWS Load Balancer Controller"
  value       = module.argoflow_aws_infrastructure.kubeflow_aws_load_balancer_controller_iam_role_arn
}

output "kubeflow_external_dns_iam_role_arn" {
  description = "The ARN of the IAM role to be used by the external-dns application"
  value       = module.argoflow_aws_infrastructure.kubeflow_external_dns_iam_role_arn
}

output "kubeflow_cert_manager_iam_role_arn" {
  description = "The ARN of the IAM role to be used by the cert-manager application"
  value       = module.argoflow_aws_infrastructure.kubeflow_cert_manager_iam_role_arn
}

output "kubeflow_external_secrets_iam_role_arn" {
  description = "The ARN of the IAM role to be used by the external-secrets application"
  value       = module.argoflow_aws_infrastructure.kubeflow_external_secrets_iam_role_arn
}

output "kubeflow_external_secrets_argocd_iam_role_arn" {
  description = "IAM role allowing the external-secrets application to administer ArgoCD secrets"
  value       = module.argoflow_aws_infrastructure.kubeflow_external_secrets_argocd_iam_role_arn
}

output "kubeflow_external_secrets_kubeflow_role_arn" {
  description = "IAM role allowing the external-secrets application to administer kubeflow secrets"
  value       = module.argoflow_aws_infrastructure.kubeflow_external_secrets_kubeflow_role_arn
}

output "kubeflow_external_secrets_mlflow_policy_arn" {
  description = "IAM role allowing the external-secrets application to administer mlflow secrets"
  value       = module.argoflow_aws_infrastructure.kubeflow_external_secrets_mlflow_policy_arn
}

output "kubeflow_external_secrets_auth_role_arn" {
  description = "IAM role allowing the external-secrets application to administer auth secrets"
  value       = module.argoflow_aws_infrastructure.kubeflow_external_secrets_auth_role_arn
}

output "kubeflow_external_secrets_istio_role_arn" {
  description = "IAM role allowing the external-secrets application to administer istio secrets"
  value       = module.argoflow_aws_infrastructure.kubeflow_external_secrets_istio_role_arn
}

output "kubeflow_external_secrets_monitoring_role_arn" {
  description = "IAM policy allowing the external-secrets application to administer monitoring secrets"
  value       = module.argoflow_aws_infrastructure.kubeflow_external_secrets_monitoring_role_arn
}

output "kubeflow_redis_oidc_cache_nodes" {
  description = "The nodes of the Kubeflow redis cache to be used for OIDC"
  value       = module.argoflow_aws_infrastructure.kubeflow_redis_oidc_cache_nodes
}

output "kubeflow_mlflow_s3_bucket_name" {
  description = "S3 bucket for MLFlow"
  value       = module.argoflow_aws_infrastructure.kubeflow_mlflow_s3_bucket_name
}

output "kubeflow_oidc_cookie_secret" {
  description = "The cookie secret to inject into argoflow-aws OIDC setup"
  value       = module.argoflow_aws_infrastructure.kubeflow_oidc_cookie_secret
}

output "kubeflow_pipelines_s3_bucket_name" {
  description = "S3 bucket for Kubeflow Pipelines"
  value       = module.argoflow_aws_infrastructure.kubeflow_pipelines_s3_bucket_name
}

output "secretsmanager_secrets" {
  description = "The AWS Secrets Manager secrets created for Kubeflow"
  value       = module.argoflow_aws_infrastructure.secretsmanager_secrets
}

output "kubeflow_pipelines_aws_iam_username" {
  description = "The username of the AWS IAM user for Kubeflow Pipelines"
  value       = module.argoflow_aws_infrastructure.kubeflow_pipelines_aws_iam_username
}

output "kubeflow_pipelines_user_credentials_access_key_id" {
  description = "The access key ID for the AWS IAM user with permissions to the Kubeflow Pipelines S3 bucket"
  value       = module.argoflow_aws_infrastructure.kubeflow_pipelines_user_credentials_access_key_id
}

output "kubeflow_pipelines_user_credentials_secret_access_key" {
  description = "The secret access key for the AWS IAM user with permissions to the Kubeflow Pipelines S3 bucket"
  sensitive   = true
  value       = module.argoflow_aws_infrastructure.kubeflow_pipelines_user_credentials_secret_access_key
}

output "kubeflow_route53_zoneid" {
  description = "The Zone ID of the AWS Route 53 zone created for this Kubeflow instance"
  value       = module.argoflow_aws_infrastructure.kubeflow_route53_zone_id
}

output "kubeflow_route53_zone_name" {
  description = "The name of the AWS Route 53 zone created for this Kubeflow instance"
  value       = module.argoflow_aws_infrastructure.kubeflow_route53_zone_name
}

output "kubeflow_route53_zone_nameservers" {
  description = "The nameservers of the AWS Route 53 zone created for this Kubeflow instance"
  value       = module.argoflow_aws_infrastructure.kubeflow_route53_zone_nameservers
}
