# argoflow-aws Core Module

This folder contains the core code of the [argoflow-aws-infrastructure repo](https://github.com/honestbank/argoflow-aws-infrastructure).
When embedding this repo as a submodule, point the Terraform module source to this folder rather than the root of the repo.
The root of the repo contains a [wrapper](/argoflow-aws-infrastructure-wrapper.tf) that allows for testing and validation
of the module on [Terraform Cloud](https://app.terraform.io).

For background info on this repo and its functionality at a higher level, see the [repo readme](/README.md).

---

>
> To regenerate this section, delete everything under the horizontal divider below and run
> `terraform-docs markdown ./ >> README.md` in the folder root.
>
---
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.58.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.kubeflow_db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.kubeflow_db_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_ec2_tag.private_subnet_cluster_tag](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_ec2_tag.private_subnet_tag](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_ec2_tag.public_subnet_cluster_tag](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_ec2_tag.public_subnet_tag](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_ec2_tag.vpc_tag](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_elasticache_cluster.kubeflow_oidc_cache](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster) | resource |
| [aws_elasticache_subnet_group.kubeflow_oidc_cache_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_iam_access_key.kubeflow_pipelines_user_credentials](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.aws_load_balancer_controller_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cert_manager_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cluster_autoscaler_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.external_dns_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.external_secrets_argocd_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.external_secrets_auth_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.external_secrets_istio_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.external_secrets_kubeflow_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.external_secrets_mlflow_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.external_secrets_monitoring_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.external_secrets_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.aws_load_balancer_controller_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.cert_manager_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.cluster_autoscaler_irsa_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.external_dns_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.external_secrets_argocd_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.external_secrets_auth_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.external_secrets_istio_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.external_secrets_kubeflow_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.external_secrets_mlflow_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.external_secrets_monitoring_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.external_secrets_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.aws_load_balancer_controller_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cert_manager_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cluster_autoscaler_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.external_dns_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.external_secrets_argocd_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.external_secrets_auth_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.external_secrets_istio_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.external_secrets_kubeflow_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.external_secrets_mlflow_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.external_secrets_monitoring_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.external_secrets_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user.kubeflow_pipelines_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.kubeflow_pipelines_user_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_kms_key.kubeflow_secrets_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_route53_zone.argoflow_aws_subdomain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_s3_bucket.kubeflow_mlflow_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.kubeflow_pipelines_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.kubeflow_mlflow_s3_bucket_public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.kubeflow_pipelines_s3_bucket_public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_secretsmanager_secret.kubeflow_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [random_id.kubeflow_mlflow_s3_bucket_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_id.kubeflow_oidc_cookie_secret](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_id.kubeflow_pipelines_s3_bucket_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_id.secrets_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_iam_policy_document.aws_load_balancer_controller_assume_role_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cert_manager_irsa_assume_role_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cluster_autoscaler_assume_role_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cluster_autoscaler_infrastructure_access_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.external_dns_assume_role_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.external_dns_infrastructure_access_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.external_secrets_assume_role_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.external_secrets_infrastructure_access_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_access_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_subnet.kubeflow_db_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_eks_cluster_primary_security_group_id"></a> [aws\_eks\_cluster\_primary\_security\_group\_id](#input\_aws\_eks\_cluster\_primary\_security\_group\_id) | Corresponds to the `cluster_primary_security_group_id` [output variable of the AWS EKS Terraform module](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest?tab=outputs) | `string` | n/a | yes |
| <a name="input_aws_load_balancer_controller_namespace"></a> [aws\_load\_balancer\_controller\_namespace](#input\_aws\_load\_balancer\_controller\_namespace) | The Kubernetes Namespace containing the aws-load-balancer-controller KSA (Kubernetes Service Account) | `string` | `"kube-system"` | no |
| <a name="input_aws_load_balancer_controller_service_account_name"></a> [aws\_load\_balancer\_controller\_service\_account\_name](#input\_aws\_load\_balancer\_controller\_service\_account\_name) | The name of the aws-load-balancer-controller KSA (Kubernetes Service Account) | `string` | `"aws-load-balancer-controller"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region in which to build resources | `string` | n/a | yes |
| <a name="input_aws_secretsmanager_account_id"></a> [aws\_secretsmanager\_account\_id](#input\_aws\_secretsmanager\_account\_id) | The AWS account ID that hosts Secrets Manager resources | `string` | n/a | yes |
| <a name="input_aws_vpc_id"></a> [aws\_vpc\_id](#input\_aws\_vpc\_id) | The VPC ID where the argoflow-aws instance will be located | `string` | n/a | yes |
| <a name="input_aws_vpc_private_subnets"></a> [aws\_vpc\_private\_subnets](#input\_aws\_vpc\_private\_subnets) | A list of the private VPC subnet IDs used by the Kubeflow EKS cluster | `list(string)` | n/a | yes |
| <a name="input_aws_vpc_public_subnets"></a> [aws\_vpc\_public\_subnets](#input\_aws\_vpc\_public\_subnets) | A list of the public VPC subnet IDs used by the Kubeflow EKS cluster | `list(string)` | n/a | yes |
| <a name="input_cluster_autoscaler_kubernetes_service_account_name"></a> [cluster\_autoscaler\_kubernetes\_service\_account\_name](#input\_cluster\_autoscaler\_kubernetes\_service\_account\_name) | The Kubernetes Service Account used by the cluster-autoscaler pod | `string` | `"cluster-autoscaler"` | no |
| <a name="input_cluster_autoscaler_kubernetes_service_account_namespace"></a> [cluster\_autoscaler\_kubernetes\_service\_account\_namespace](#input\_cluster\_autoscaler\_kubernetes\_service\_account\_namespace) | The Kubernetes Namespace in which the cluster-autoscaler Service Account is located | `string` | `"kube-system"` | no |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | The name of the EKS (Elastic Kubernetes Service) cluster. | `string` | n/a | yes |
| <a name="input_external_secret_names"></a> [external\_secret\_names](#input\_external\_secret\_names) | The secrets that need to be created in AWS Secrets Manager | `list(string)` | <pre>[<br>  "argocd/https_username",<br>  "argocd/https_password",<br>  "auth/client_id",<br>  "auth/client_secret",<br>  "auth/cookie_secret",<br>  "istio-system/auth_ca_cert",<br>  "istio-system/auth_cert",<br>  "istio-system/auth_cert_pk",<br>  "istio-system/gateway_ca_cert",<br>  "istio-system/gateway_cert",<br>  "istio-system/gateway_cert_pk",<br>  "istio-system/monitoring_ca_cert",<br>  "istio-system/monitoring_cert",<br>  "istio-system/monitoring_cert_pk",<br>  "kubeflow/rds_username",<br>  "kubeflow/rds_password",<br>  "kubeflow/s3_accesskey",<br>  "kubeflow/s3_secretkey",<br>  "mlflow/rds_username",<br>  "mlflow/rds_password"<br>]</pre> | no |
| <a name="input_kubeflow_cluster_oidc_provider_arn"></a> [kubeflow\_cluster\_oidc\_provider\_arn](#input\_kubeflow\_cluster\_oidc\_provider\_arn) | The OIDC provider ARN of the Kubeflow Kubernetes cluster | `string` | n/a | yes |
| <a name="input_route53_subdomain"></a> [route53\_subdomain](#input\_route53\_subdomain) | The subdomain to create in Route53 for this argoflow-aws instance | `string` | n/a | yes |
| <a name="input_stage"></a> [stage](#input\_stage) | The stage (environment) of the build - usually one of [test, dev, qa, prod] | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubeflow_aws_load_balancer_controller_iam_role_arn"></a> [kubeflow\_aws\_load\_balancer\_controller\_iam\_role\_arn](#output\_kubeflow\_aws\_load\_balancer\_controller\_iam\_role\_arn) | The ARN of the IAM role to be used by the AWS Load Balancer Controller |
| <a name="output_kubeflow_cert_manager_iam_role_arn"></a> [kubeflow\_cert\_manager\_iam\_role\_arn](#output\_kubeflow\_cert\_manager\_iam\_role\_arn) | The ARN of the IAM role to be used by the cert-manager application |
| <a name="output_kubeflow_cluster_autoscaler_iam_role_arn"></a> [kubeflow\_cluster\_autoscaler\_iam\_role\_arn](#output\_kubeflow\_cluster\_autoscaler\_iam\_role\_arn) | The ARN of the IAM role to be used by the Cluster Autoscaler |
| <a name="output_kubeflow_external_dns_iam_role_arn"></a> [kubeflow\_external\_dns\_iam\_role\_arn](#output\_kubeflow\_external\_dns\_iam\_role\_arn) | The ARN of the IAM role to be used by the external-dns application |
| <a name="output_kubeflow_external_secrets_argocd_iam_role_arn"></a> [kubeflow\_external\_secrets\_argocd\_iam\_role\_arn](#output\_kubeflow\_external\_secrets\_argocd\_iam\_role\_arn) | IAM role allowing the external-secrets application to administer ArgoCD secrets |
| <a name="output_kubeflow_external_secrets_auth_role_arn"></a> [kubeflow\_external\_secrets\_auth\_role\_arn](#output\_kubeflow\_external\_secrets\_auth\_role\_arn) | IAM role allowing the external-secrets application to administer auth secrets |
| <a name="output_kubeflow_external_secrets_iam_role_arn"></a> [kubeflow\_external\_secrets\_iam\_role\_arn](#output\_kubeflow\_external\_secrets\_iam\_role\_arn) | The ARN of the IAM role to be used by the external-secrets application |
| <a name="output_kubeflow_external_secrets_istio_role_arn"></a> [kubeflow\_external\_secrets\_istio\_role\_arn](#output\_kubeflow\_external\_secrets\_istio\_role\_arn) | IAM role allowing the external-secrets application to administer istio secrets |
| <a name="output_kubeflow_external_secrets_kubeflow_role_arn"></a> [kubeflow\_external\_secrets\_kubeflow\_role\_arn](#output\_kubeflow\_external\_secrets\_kubeflow\_role\_arn) | IAM role allowing the external-secrets application to administer kubeflow secrets |
| <a name="output_kubeflow_external_secrets_mlflow_policy_arn"></a> [kubeflow\_external\_secrets\_mlflow\_policy\_arn](#output\_kubeflow\_external\_secrets\_mlflow\_policy\_arn) | IAM role allowing the external-secrets application to administer mlflow secrets |
| <a name="output_kubeflow_external_secrets_monitoring_role_arn"></a> [kubeflow\_external\_secrets\_monitoring\_role\_arn](#output\_kubeflow\_external\_secrets\_monitoring\_role\_arn) | IAM policy allowing the external-secrets application to administer monitoring secrets |
| <a name="output_kubeflow_mlflow_s3_bucket_name"></a> [kubeflow\_mlflow\_s3\_bucket\_name](#output\_kubeflow\_mlflow\_s3\_bucket\_name) | S3 bucket for MLFlow |
| <a name="output_kubeflow_oidc_cookie_secret"></a> [kubeflow\_oidc\_cookie\_secret](#output\_kubeflow\_oidc\_cookie\_secret) | The cookie secret to inject into argoflow-aws OIDC setup |
| <a name="output_kubeflow_pipelines_aws_iam_username"></a> [kubeflow\_pipelines\_aws\_iam\_username](#output\_kubeflow\_pipelines\_aws\_iam\_username) | The username of the AWS IAM user for Kubeflow Pipelines |
| <a name="output_kubeflow_pipelines_s3_bucket_name"></a> [kubeflow\_pipelines\_s3\_bucket\_name](#output\_kubeflow\_pipelines\_s3\_bucket\_name) | S3 bucket for Kubeflow Pipelines |
| <a name="output_kubeflow_pipelines_user_credentials_access_key_id"></a> [kubeflow\_pipelines\_user\_credentials\_access\_key\_id](#output\_kubeflow\_pipelines\_user\_credentials\_access\_key\_id) | The access key ID for the AWS IAM user with permissions to the Kubeflow Pipelines S3 bucket |
| <a name="output_kubeflow_pipelines_user_credentials_secret_access_key"></a> [kubeflow\_pipelines\_user\_credentials\_secret\_access\_key](#output\_kubeflow\_pipelines\_user\_credentials\_secret\_access\_key) | The secret access key for the AWS IAM user with permissions to the Kubeflow Pipelines S3 bucket |
| <a name="output_kubeflow_rds_host"></a> [kubeflow\_rds\_host](#output\_kubeflow\_rds\_host) | The hostname of the Kubeflow RDS instance |
| <a name="output_kubeflow_redis_oidc_cache_nodes"></a> [kubeflow\_redis\_oidc\_cache\_nodes](#output\_kubeflow\_redis\_oidc\_cache\_nodes) | The nodes of the Kubeflow redis cache to be used for OIDC |
| <a name="output_kubeflow_route53_zone_id"></a> [kubeflow\_route53\_zone\_id](#output\_kubeflow\_route53\_zone\_id) | The ID of the AWS Route 53 zone created for this Kubeflow instance |
| <a name="output_kubeflow_route53_zone_name"></a> [kubeflow\_route53\_zone\_name](#output\_kubeflow\_route53\_zone\_name) | The name of the AWS Route 53 zone created for this Kubeflow instance |
| <a name="output_kubeflow_route53_zone_nameservers"></a> [kubeflow\_route53\_zone\_nameservers](#output\_kubeflow\_route53\_zone\_nameservers) | The nameservers of the AWS Route 53 zone created for this Kubeflow instance |
| <a name="output_secretsmanager_secrets"></a> [secretsmanager\_secrets](#output\_secretsmanager\_secrets) | The AWS Secrets Manager secrets created for Kubeflow |
