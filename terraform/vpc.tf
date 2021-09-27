/*
  Start of resource tagging logic to update the provided vpc and its subnets with the necessary tags for eks to work
  The toset() function is actually multiplexing the resource block, one for every item in the set. It is what allows
  for setting a tag on each of the subnets in the vpc.
*/
resource "aws_ec2_tag" "vpc_tag" {
  resource_id = var.aws_vpc_id
  key         = "kubernetes.io/cluster/${var.eks_cluster_name}"
  value       = "shared"
}

resource "aws_ec2_tag" "private_subnet_tag" {
  for_each    = toset(var.aws_vpc_private_subnets)
  resource_id = each.value
  key         = "kubernetes.io/role/internal-elb"
  value       = "1"
}

resource "aws_ec2_tag" "private_subnet_cluster_tag" {
  for_each    = toset(var.aws_vpc_private_subnets)
  resource_id = each.value
  key         = "kubernetes.io/cluster/${var.eks_cluster_name}"
  value       = "shared"
}

resource "aws_ec2_tag" "public_subnet_tag" {
  for_each    = toset(var.aws_vpc_public_subnets)
  resource_id = each.value
  key         = "kubernetes.io/role/elb"
  value       = "1"
}

resource "aws_ec2_tag" "public_subnet_cluster_tag" {
  for_each    = toset(var.aws_vpc_public_subnets)
  resource_id = each.value
  key         = "kubernetes.io/cluster/${var.eks_cluster_name}"
  value       = "shared"
}
