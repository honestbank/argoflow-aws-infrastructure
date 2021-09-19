variable "external_secret_names" {
  type        = list(string)
  description = "The secrets that need to be created in AWS Secrets Manager"

  default = [
    "argocd/https_username",
    "argocd/https_password",
    "auth/client_id",
    "auth/client_secret",
    "auth/cookie_secret",
    "istio-system/auth_ca_cert",
    "istio-system/auth_cert",
    "istio-system/auth_cert_pk",
    "istio-system/gateway_ca_cert",
    "istio-system/gateway_cert",
    "istio-system/gateway_cert_pk",
    "istio-system/monitoring_ca_cert",
    "istio-system/monitoring_cert",
    "istio-system/monitoring_cert_pk",
    "kubeflow/rds_username",
    "kubeflow/rds_password",
    "kubeflow/s3_accesskey",
    "kubeflow/s3_secretkey",
    "mlflow/rds_username",
    "mlflow/rds_password",
  ]
}

resource "random_id" "secrets_suffix" {
  byte_length = 4
}

resource "aws_kms_key" "kubeflow_secrets_key" {
  enable_key_rotation = true
}

resource "aws_secretsmanager_secret" "kubeflow_secret" {
  count                   = length(var.external_secret_names)
  name                    = "kubeflow/${var.external_secret_names[count.index]}-${random_id.secrets_suffix.hex}"
  recovery_window_in_days = "0"
  kms_key_id              = aws_kms_key.kubeflow_secrets_key.id
}

# This value needs to be placed into AWS Secrets Manager
# into the key specified by this config line:
# https://github.com/honestbank/argoflow-aws/blob/cd369f559ee1e5af931fbd57df756e3f076b1c35/setup.conf#L56
resource "random_id" "kubeflow_oidc_cookie_secret" {
  byte_length = 16
}

# #####################################################################################################################
# TODO: migrate to individual resources below, or use a map since using lists/arrays in Terraform
# can cause resources to be destroyed when their order changes.
# #####################################################################################################################

//resource "aws_secretsmanager_secret" "argocd_https_username" {
//  name  = "kubeflow/argocd/https_username"
//}
//
//resource "aws_secretsmanager_secret" "argocd_https_password" {
//  name  = "kubeflow/argocd/https_password"
//}
//
//resource "aws_secretsmanager_secret" "auth_client_id"{
//  name  = "auth/client_id"
//}
//
//resource "aws_secretsmanager_secret" ""{
//  name  = ""
//}
//
//resource "aws_secretsmanager_secret" "auth_client_secret"{
//  name  = "auth/client_secret"
//}
//
//resource "aws_secretsmanager_secret" "auth_cookie_secret"{
//  name  = "auth/cookie_secret"
//}
//
//resource "aws_secretsmanager_secret" "istio_system_auth_ca_cert"{
//  name  = "istio-system/auth_ca_cert"
//}
//
//resource "aws_secretsmanager_secret" "istio_system_auth_cert"{
//  name  = "istio-system/auth_cert"
//}
//
//resource "aws_secretsmanager_secret" "istio_system_auth_cert_pk"{
//  name  = "istio-system/auth_cert_pk"
//}
//
//resource "aws_secretsmanager_secret" "istio_system_gateway_ca_cert"{
//  name  = "istio-system/gateway_ca_cert"
//}
//
//resource "aws_secretsmanager_secret" "istio_system_gateway_cert"{
//  name  = "istio-system/gateway_cert"
//}
//
//resource "aws_secretsmanager_secret" "istio_system_gateway_cert_pk"{
//  name  = "istio-system/gateway_cert_pk"
//}
//
//resource "aws_secretsmanager_secret" "istio_system_monitoring_ca_cert"{
//  name  = "istio-system/monitoring_ca_cert"
//}
//
//resource "aws_secretsmanager_secret" "istio_system_monitoring_cert"{
//  name  = "istio-system/monitoring_cert"
//}
//
//resource "aws_secretsmanager_secret" "istio_system_monitoring_cert_pk"{
//  name  = "istio-system/monitoring_cert_pk"
//}
//
//resource "aws_secretsmanager_secret" "kubeflow_rds_username"{
//  name  = "kubeflow/rds_username"
//}
//
//resource "aws_secretsmanager_secret" "kubeflow_rds_password"{
//  name  = "kubeflow/rds_password"
//}
//
//resource "aws_secretsmanager_secret" "kubeflow_s3_accesskey"{
//  name  = "kubeflow/s3_accesskey"
//}
//
//resource "aws_secretsmanager_secret" "kubeflow_s3_secretkey"{
//  name  = "kubeflow/s3_secretkey"
//}
//
//resource "aws_secretsmanager_secret" "mlflow_rds_username"{
//  name  = "mlflow/rds_username"
//}
//
//resource "aws_secretsmanager_secret" "mlflow_rds_password"{
//  name  = "mlflow/rds_password"
//}
