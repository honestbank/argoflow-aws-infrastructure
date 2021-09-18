data "aws_subnet" "kubeflow_db_subnet_a" {
  id = "subnet-9440efdc"
}

data "aws_subnet" "kubeflow_db_subnet_b" {
  id = "subnet-d50cb3b3"
}


resource "aws_db_subnet_group" "kubeflow_db_subnet_group" {
  name        = "kubeflow-db-subnet-group"
  description = "Kubeflow RDS DB subnet group"
  subnet_ids  = [data.aws_subnet.kubeflow_db_subnet_a.id, data.aws_subnet.kubeflow_db_subnet_b.id]
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
  vpc_security_group_ids = ["sg-084510ba4c3fb28cc"]
  db_subnet_group_name   = aws_db_subnet_group.kubeflow_db_subnet_group.name
}

# ######################################################################################################################
# Redis for OIDC
# ######################################################################################################################

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
}
