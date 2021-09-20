
data "aws_subnet" "kubeflow_db_subnets" {
  count = length(var.aws_vpc_private_subnets)
  id    = var.aws_vpc_private_subnets[count.index]
}

resource "aws_db_subnet_group" "kubeflow_db_subnet_group" {
  name        = "kubeflow-db-subnet-group"
  description = "Kubeflow RDS DB subnet group"
  subnet_ids  = data.aws_subnet.kubeflow_db_subnets.*.id
}

resource "aws_db_instance" "kubeflow_db" {

  name           = "kubeflow"
  instance_class = "db.t3.micro"
  multi_az       = false

  ### Engine
  ### ---
  engine                     = "mysql"
  engine_version             = "8.0"
  parameter_group_name       = "default.mysql8.0"
  auto_minor_version_upgrade = true

  ### Auth
  ### ---
  # TODO: randomize or secure this somehow
  username = "kubeflow"
  password = "kubeflow" #tfsec:ignore:GEN003

  ### Storage
  ### ---
  backup_retention_period = 30
  storage_type            = "gp2"
  storage_encrypted       = true
  allocated_storage       = 20
  skip_final_snapshot     = true

  ### Networking
  ### ---
  publicly_accessible = false
  # Not sure where to get this in real-life
  vpc_security_group_ids = [var.aws_eks_cluster_primary_security_group_id]
  db_subnet_group_name   = aws_db_subnet_group.kubeflow_db_subnet_group.name
}

# ######################################################################################################################
# Redis for OIDC
# ######################################################################################################################

resource "aws_elasticache_subnet_group" "kubeflow_oidc_cache_subnet_group" {
  name       = "kubeflow-oidc-cache-subnet-group"
  subnet_ids = data.aws_subnet.kubeflow_db_subnets.*.id
}

# This cluster is used for OIDC - AWS088 warns on snapshot retention, which is not needed.
# tfsec:ignore:AWS088 (DO NOT ADD A BLANK LINE AFTER THIS)
resource "aws_elasticache_cluster" "kubeflow_oidc_cache" {
  cluster_id           = "kubeflow-oidc"
  engine               = "redis"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"
  engine_version       = "6.x"
  port                 = 6379

  security_group_ids = [var.aws_eks_cluster_primary_security_group_id]
  subnet_group_name  = aws_elasticache_subnet_group.kubeflow_oidc_cache_subnet_group.name
}

# ######################################################################################################################
# S3 Buckets for MLFlow and Pipelines
# ######################################################################################################################

resource "random_id" "kubeflow_pipelines_s3_bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "kubeflow_pipelines_s3_bucket" {
  bucket = "kubeflow-pipelines-${random_id.kubeflow_pipelines_s3_bucket_suffix.hex}"
  acl    = "private"

  tags = {
    Terraform = "true"
    Stage     = var.stage
  }
}

resource "aws_s3_bucket_public_access_block" "kubeflow_pipelines_s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.kubeflow_pipelines_s3_bucket.id

  block_public_acls   = true
  block_public_policy = true
}

resource "random_id" "kubeflow_mlflow_s3_bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "kubeflow_mlflow_s3_bucket" {
  bucket = "kubeflow-mlflow-${random_id.kubeflow_mlflow_s3_bucket_suffix.hex}"
  acl    = "private"

  tags = {
    Terraform = "true"
    Stage     = var.stage
  }
}

resource "aws_s3_bucket_public_access_block" "kubeflow_mlflow_s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.kubeflow_mlflow_s3_bucket.id

  block_public_acls   = true
  block_public_policy = true
}
