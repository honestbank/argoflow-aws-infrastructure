# ######################################################################################################################
# AWS Load Balancer Controller
# ######################################################################################################################

data "aws_iam_policy_document" "aws_load_balancer_controller_assume_role_policy_document" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    principals {
      type        = "Federated"
      identifiers = [var.kubeflow_cluster_oidc_provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.kubeflow_oidc_provider}:sub"
      values   = ["system:serviceaccount:kube-system:aws-load-balancer-controller"]
    }
  }
}

resource "aws_iam_policy" "aws_load_balancer_controller_policy" {
  name        = "aws_load_balancer_controller_policy"
  description = "IAM Policy allowing the AWS Load Balancer Controller to administer infrastructure resources"

  policy = file("../iam-policies/aws-load-balancer-controller.json")
}

resource "aws_iam_role" "aws_load_balancer_controller_role" {
  name               = "aws_load_balancer_controller_role"
  assume_role_policy = data.aws_iam_policy_document.aws_load_balancer_controller_assume_role_policy_document.json

  tags = {
    Terraform = "true"
    Stage     = var.stage
  }
}

resource "aws_iam_role_policy_attachment" "aws_load_balancer_controller_role_policy_attachment" {
  role       = aws_iam_role.aws_load_balancer_controller_role.name
  policy_arn = aws_iam_policy.aws_load_balancer_controller_policy.arn
}

# ######################################################################################################################
# Cluster Autoscaler
# ######################################################################################################################

data "aws_iam_policy_document" "cluster_autoscaler_assume_role_policy_document" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    principals {
      type        = "Federated"
      identifiers = [var.kubeflow_cluster_oidc_provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.kubeflow_oidc_provider}:sub"
      values   = ["system:serviceaccount:${var.cluster_autoscaler_kubernetes_service_account_namespace}:${var.cluster_autoscaler_kubernetes_service_account_name}"]
    }
  }
}

data "aws_iam_policy_document" "cluster_autoscaler_infrastructure_access_policy_document" {
  version = "2012-10-17"

  statement {
    actions = [
      "autoscaling:DescribeAutoScalingGroups",
      "autoscaling:DescribeAutoScalingInstances",
      "autoscaling:DescribeLaunchConfigurations",
      "autoscaling:DescribeTags",
      "autoscaling:SetDesiredCapacity",
      "autoscaling:TerminateInstanceInAutoScalingGroup",
      "ec2:DescribeLaunchTemplateVersions"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}

resource "aws_iam_policy" "cluster_autoscaler_policy" {
  name   = "cluster_autoscaler_policy"
  policy = data.aws_iam_policy_document.cluster_autoscaler_infrastructure_access_policy_document.json
}

resource "aws_iam_role" "cluster_autoscaler_irsa_role" {
  name               = "kubeflow-cluster-autoscaler-role"
  assume_role_policy = data.aws_iam_policy_document.cluster_autoscaler_assume_role_policy_document.json

  tags = {
    Terraform = "true"
    Stage     = var.stage
  }
}

resource "aws_iam_role_policy_attachment" "cluster_autoscaler_role_policy_attachment" {
  role       = aws_iam_role.cluster_autoscaler_irsa_role.name
  policy_arn = aws_iam_policy.cluster_autoscaler_policy.arn
}

# ######################################################################################################################
# external-dns
# Source: https://github.com/argoflow/argoflow-aws/blob/master/docs/iam_policies/external-dns.json
# ######################################################################################################################

data "aws_iam_policy_document" "external_dns_assume_role_policy_document" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    principals {
      type        = "Federated"
      identifiers = [var.kubeflow_cluster_oidc_provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.kubeflow_oidc_provider}:sub"
      values   = ["system:serviceaccount:kube-system:external-dns"]
    }
  }
}

resource "aws_iam_policy" "external_dns_policy" {
  name        = "external_dns_policy"
  description = "IAM Policy allowing the external-dns application to administer infrastructure resources"

  policy = file("../iam-policies/external-dns.json")
}

resource "aws_iam_role" "external_dns_role" {
  name               = "external_dns_role"
  assume_role_policy = data.aws_iam_policy_document.external_dns_assume_role_policy_document.json

  tags = {
    Terraform = "true"
    Stage     = var.stage
  }
}

resource "aws_iam_role_policy_attachment" "external_dns_role_policy_attachment" {
  role       = aws_iam_role.external_dns_role.name
  policy_arn = aws_iam_policy.external_dns_policy.arn
}

# ######################################################################################################################
# cert-manager
# Source: https://github.com/argoflow/argoflow-aws/blob/master/docs/iam_policies/cert-manager.json
# ######################################################################################################################

data "aws_iam_policy_document" "cert_manager_irsa_assume_role_policy_document" {
  version = "2012-10-17"

  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    principals {
      type        = "Federated"
      identifiers = [var.kubeflow_cluster_oidc_provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.kubeflow_oidc_provider}:sub"
      values   = ["system:serviceaccount:cert-manager:cert-manager"]
    }
  }
}

resource "aws_iam_policy" "cert_manager_policy" {
  name        = "cert_manager_policy"
  description = "IAM Policy allowing the cert_manager application to administer infrastructure resources"

  policy = file("../iam-policies/cert-manager.json")
}

resource "aws_iam_role" "cert_manager_role" {
  name               = "cert_manager_role"
  assume_role_policy = data.aws_iam_policy_document.cert_manager_irsa_assume_role_policy_document.json

  tags = {
    Terraform = "true"
    Stage     = var.stage
  }
}

resource "aws_iam_role_policy_attachment" "cert_manager_role_policy_attachment" {
  role       = aws_iam_role.cert_manager_role.name
  policy_arn = aws_iam_policy.cert_manager_policy.arn
}

# ######################################################################################################################
# external-secrets
# Source: https://github.com/argoflow/argoflow-aws/blob/master/docs/iam_policies/external-secrets-option-1.json
# ######################################################################################################################

data "aws_iam_policy_document" "external_secrets_assume_role_policy_document" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    principals {
      type        = "Federated"
      identifiers = [var.kubeflow_cluster_oidc_provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.kubeflow_oidc_provider}:sub"
      values   = ["system:serviceaccount:kube-system:external-secrets"]
    }
  }
}

resource "aws_iam_policy" "external_secrets_policy" {
  name        = "external_secrets_policy"
  description = "IAM Policy allowing the external-secrets application to administer infrastructure resources"

  policy = file("../iam-policies/external-secrets-option-1.json")
}

resource "aws_iam_role" "external_secrets_role" {
  name               = "external_secrets_role"
  assume_role_policy = data.aws_iam_policy_document.external_secrets_assume_role_policy_document.json

  tags = {
    Terraform = "true"
    Stage     = var.stage
  }
}

resource "aws_iam_role_policy_attachment" "external_secrets_role_policy_attachment" {
  role       = aws_iam_role.external_secrets_role.name
  policy_arn = aws_iam_policy.external_secrets_policy.arn
}

# external-secrets - ArgoCD
# Source: https://github.com/argoflow/argoflow-aws/blob/master/docs/iam_policies/external-secrets_argocd.json

resource "aws_iam_policy" "external_secrets_argocd_policy" {
  name        = "external_secrets_argocd_policy"
  description = "IAM Policy allowing the external-secrets application to administer ArgoCD secrets"

  policy = file("../iam-policies/external-secrets_argocd.json")
}

resource "aws_iam_role" "external_secrets_argocd_role" {
  name               = "external_secrets_argocd_role"
  assume_role_policy = data.aws_iam_policy_document.external_secrets_assume_role_policy_document.json

  tags = {
    Terraform = "true"
    Stage     = var.stage
  }
}

resource "aws_iam_role_policy_attachment" "external_secrets_argocd_role_policy_attachment" {
  role       = aws_iam_role.external_secrets_argocd_role.name
  policy_arn = aws_iam_policy.external_secrets_argocd_policy.arn
}

# external-secrets - Kubeflow
# Source: https://github.com/argoflow/argoflow-aws/blob/master/docs/iam_policies/external-secrets_kubeflow.json

resource "aws_iam_policy" "external_secrets_kubeflow_policy" {
  name        = "external_secrets_kubeflow_policy"
  description = "IAM Policy allowing the external-secrets application to administer kubeflow secrets"

  policy = file("../iam-policies/external-secrets_kubeflow.json")
}

resource "aws_iam_role" "external_secrets_kubeflow_role" {
  name               = "external_secrets_kubeflow_role"
  assume_role_policy = data.aws_iam_policy_document.external_secrets_assume_role_policy_document.json

  tags = {
    Terraform = "true"
    Stage     = var.stage
  }
}

resource "aws_iam_role_policy_attachment" "external_secrets_kubeflow_role_policy_attachment" {
  role       = aws_iam_role.external_secrets_kubeflow_role.name
  policy_arn = aws_iam_policy.external_secrets_kubeflow_policy.arn
}

# external-secrets - MLFlow
# Source: https://github.com/argoflow/argoflow-aws/blob/master/docs/iam_policies/external-secrets_mlflow.json

resource "aws_iam_policy" "external_secrets_mlflow_policy" {
  name        = "external_secrets_mlflow_policy"
  description = "IAM Policy allowing the external-secrets application to administer mlflow secrets"

  policy = file("../iam-policies/external-secrets_mlflow.json")
}

resource "aws_iam_role" "external_secrets_mlflow_role" {
  name               = "external_secrets_mlflow_role"
  assume_role_policy = data.aws_iam_policy_document.external_secrets_assume_role_policy_document.json

  tags = {
    Terraform = "true"
    Stage     = var.stage
  }
}

resource "aws_iam_role_policy_attachment" "external_secrets_mlflow_role_policy_attachment" {
  role       = aws_iam_role.external_secrets_mlflow_role.name
  policy_arn = aws_iam_policy.external_secrets_mlflow_policy.arn
}

# external-secrets - Auth
# Source: https://github.com/argoflow/argoflow-aws/blob/master/docs/iam_policies/external-secrets_auth.json

resource "aws_iam_policy" "external_secrets_auth_policy" {
  name        = "external_secrets_auth_policy"
  description = "IAM Policy allowing the external-secrets application to administer auth secrets"

  policy = file("../iam-policies/external-secrets_auth.json")
}

resource "aws_iam_role" "external_secrets_auth_role" {
  name               = "external_secrets_auth_role"
  assume_role_policy = data.aws_iam_policy_document.external_secrets_assume_role_policy_document.json

  tags = {
    Terraform = "true"
    Stage     = var.stage
  }
}

resource "aws_iam_role_policy_attachment" "external_secrets_auth_role_policy_attachment" {
  role       = aws_iam_role.external_secrets_auth_role.name
  policy_arn = aws_iam_policy.external_secrets_auth_policy.arn
}

# external-secrets - istio-system
# Source: https://github.com/argoflow/argoflow-aws/blob/master/docs/iam_policies/external-secrets_istio-system.json

resource "aws_iam_policy" "external_secrets_istio_policy" {
  name        = "external_secrets_istio_policy"
  description = "IAM Policy allowing the external-secrets application to administer istio secrets"

  policy = file("../iam-policies/external-secrets_istio-system.json")
}

resource "aws_iam_role" "external_secrets_istio_role" {
  name               = "external_secrets_istio_role"
  assume_role_policy = data.aws_iam_policy_document.external_secrets_assume_role_policy_document.json

  tags = {
    Terraform = "true"
    Stage     = var.stage
  }
}

resource "aws_iam_role_policy_attachment" "external_secrets_istio_role_policy_attachment" {
  role       = aws_iam_role.external_secrets_istio_role.name
  policy_arn = aws_iam_policy.external_secrets_istio_policy.arn
}

# external-secrets - monitoring
# Source: https://github.com/argoflow/argoflow-aws/blob/master/docs/iam_policies/external-secrets_monitoring.json

resource "aws_iam_policy" "external_secrets_monitoring_policy" {
  name        = "external_secrets_monitoring_policy"
  description = "IAM Policy allowing the external-secrets application to administer monitoring secrets"

  policy = file("../iam-policies/external-secrets_monitoring.json")
}

resource "aws_iam_role" "external_secrets_monitoring_role" {
  name               = "external_secrets_monitoring_role"
  assume_role_policy = data.aws_iam_policy_document.external_secrets_assume_role_policy_document.json

  tags = {
    Terraform = "true"
    Stage     = var.stage
  }
}

resource "aws_iam_role_policy_attachment" "external_secrets_monitoring_role_policy_attachment" {
  role       = aws_iam_role.external_secrets_monitoring_role.name
  policy_arn = aws_iam_policy.external_secrets_monitoring_policy.arn
}

# ######################################################################################################################
# IAM User for Pipelines Bucket
# ######################################################################################################################

resource "aws_iam_user" "kubeflow_pipelines_user" {
  name = "kubeflow-pipelines"

  tags = {
    Terraform = "true"
  }
}

resource "aws_iam_user_policy" "kubeflow_pipelines_user_policy" {
  name = "kubeflow_pipelines_user_policy"
  user = aws_iam_user.kubeflow_pipelines_user.name

  policy = file("../iam-policies/pipelines-iam-user-s3-access.json")
}

resource "aws_iam_access_key" "kubeflow_pipelines_user_credentials" {
  user = aws_iam_user.kubeflow_pipelines_user.name
}
