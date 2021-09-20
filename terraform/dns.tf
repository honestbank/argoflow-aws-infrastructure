resource "aws_route53_zone" "argoflow_aws_subdomain" {
  name = var.route53_subdomain

  tags = {
    Terraform = "true"
    Stage     = var.stage
  }
}
