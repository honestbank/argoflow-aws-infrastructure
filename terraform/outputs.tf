output "kubeflow_rds_host" {
  description = "The hostname of the Kubeflow RDS instance"
  value       = aws_db_instance.kubeflow_db.address
}

output "kubeflow_cluster_autoscaler_iam_role_arn" {
  description = "The ARN of the IAM role to be used by the Cluster Autoscaler"
  value       = aws_iam_role.cluster_autoscaler_irsa_role.arn
}

output "kubeflow_aws_load_balancer_controller_iam_role_arn" {
  description = "The ARN of the IAM role to be used by the AWS Load Balancer Controller"
  value       = aws_iam_role.aws_load_balancer_controller_role.arn
}

output "kubeflow_external_dns_iam_role_arn" {
  description = "The ARN of the IAM role to be used by the external-dns application"
  value       = aws_iam_role.external_dns_role.arn
}

output "kubeflow_cert_manager_iam_role_arn" {
  description = "The ARN of the IAM role to be used by the cert-manager application"
  value       = aws_iam_role.cert_manager_role.arn
}

output "kubeflow_external_secrets_iam_role_arn" {
  description = "The ARN of the IAM role to be used by the external-secrets application"
  value       = aws_iam_role.external_secrets_role.arn
}

output "kubeflow_external_secrets_argocd_iam_role_arn" {
  description = "IAM role allowing the external-secrets application to administer ArgoCD secrets"
  value       = aws_iam_role.external_secrets_argocd_role.arn
}

output "kubeflow_external_secrets_kubeflow_role_arn" {
  description = "IAM role allowing the external-secrets application to administer kubeflow secrets"
  value       = aws_iam_role.external_secrets_kubeflow_role.arn
}

output "kubeflow_external_secrets_mlflow_policy_arn" {
  description = "IAM role allowing the external-secrets application to administer mlflow secrets"
  value       = aws_iam_role.external_secrets_mlflow_role.arn
}

output "kubeflow_external_secrets_auth_role_arn" {
  description = "IAM role allowing the external-secrets application to administer auth secrets"
  value       = aws_iam_role.external_secrets_auth_role.arn
}

output "kubeflow_external_secrets_istio_role_arn" {
  description = "IAM role allowing the external-secrets application to administer istio secrets"
  value       = aws_iam_role.external_secrets_istio_role.arn
}

output "kubeflow_external_secrets_monitoring_role_arn" {
  description = "IAM policy allowing the external-secrets application to administer monitoring secrets"
  value       = aws_iam_role.external_secrets_monitoring_role.arn
}

output "kubeflow_mlflow_s3_bucket_name" {
  description = "S3 bucket for MLFlow"
  value       = aws_s3_bucket.kubeflow_mlflow_s3_bucket.id
}

output "kubeflow_oidc_cookie_secret" {
  description = "The cookie secret to inject into argoflow-aws OIDC setup"
  value       = random_id.kubeflow_oidc_cookie_secret.hex
}

output "kubeflow_pipelines_s3_bucket_name" {
  description = "S3 bucket for Kubeflow Pipelines"
  value       = aws_s3_bucket.kubeflow_pipelines_s3_bucket.id
}

output "kubeflow_redis_oidc_cache_nodes" {
  description = "The nodes of the Kubeflow redis cache to be used for OIDC"
  value       = aws_elasticache_cluster.kubeflow_oidc_cache.cache_nodes
}

output "secretsmanager_secrets" {
  description = "The AWS Secrets Manager secrets created for Kubeflow"
  value       = ["${aws_secretsmanager_secret.kubeflow_secret.*.name}"]
}

output "kubeflow_pipelines_aws_iam_username" {
  description = "The username of the AWS IAM user for Kubeflow Pipelines"
  value       = aws_iam_user.kubeflow_pipelines_user.name
}

output "kubeflow_pipelines_user_credentials_access_key_id" {
  description = "The access key ID for the AWS IAM user with permissions to the Kubeflow Pipelines S3 bucket"
  value       = aws_iam_access_key.kubeflow_pipelines_user_credentials.id
}

output "kubeflow_pipelines_user_credentials_secret_access_key" {
  description = "The secret access key for the AWS IAM user with permissions to the Kubeflow Pipelines S3 bucket"
  sensitive   = true
  value       = aws_iam_access_key.kubeflow_pipelines_user_credentials.secret
}

output "kubeflow_route53_zone_id" {
  description = "The ID of the AWS Route 53 zone created for this Kubeflow instance"
  value       = aws_route53_zone.argoflow_aws_subdomain.zone_id
}

output "kubeflow_route53_zone_name" {
  description = "The name of the AWS Route 53 zone created for this Kubeflow instance"
  value       = aws_route53_zone.argoflow_aws_subdomain.name
}

output "kubeflow_route53_zone_nameservers" {
  description = "The nameservers of the AWS Route 53 zone created for this Kubeflow instance"
  value       = aws_route53_zone.argoflow_aws_subdomain.name_servers
}
