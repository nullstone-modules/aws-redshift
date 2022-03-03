resource "aws_redshift_cluster" "this" {
  cluster_version           = var.redshift_version
  cluster_identifier        = local.resource_name
  port                      = local.port
  publicly_accessible       = var.enable_public_access
  cluster_subnet_group_name = aws_redshift_subnet_group.this.name
  vpc_security_group_ids    = [aws_security_group.this.id]
  database_name             = var.database_name
  master_username           = replace(data.ns_workspace.this.block_ref, "-", "_")
  master_password           = random_password.this.result
  node_type                 = var.instance_class
  number_of_nodes           = var.node_count
  cluster_type              = local.cluster_type
  final_snapshot_identifier = "${local.resource_name}-${replace(timestamp(), ":", "-")}"
  encrypted                 = true
  tags                      = local.tags
}

locals {
  cluster_type = var.node_count > 1 ? "multi-node" : "single-node"
}

resource "aws_redshift_subnet_group" "this" {
  name        = local.resource_name
  description = "Db subnet group for Redshift cluster"
  subnet_ids  = var.enable_public_access ? local.public_subnet_ids : local.private_subnet_ids
  tags        = local.tags
}
