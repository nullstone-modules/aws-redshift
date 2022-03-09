resource "aws_redshift_cluster" "this" {
  cluster_version              = var.redshift_version
  cluster_identifier           = local.resource_name
  port                         = local.port
  publicly_accessible          = var.enable_public_access
  cluster_subnet_group_name    = aws_redshift_subnet_group.this.name
  vpc_security_group_ids       = [aws_security_group.this.id]
  database_name                = var.database_name
  master_username              = replace(data.ns_workspace.this.block_ref, "-", "_")
  master_password              = random_password.this.result
  node_type                    = var.instance_class
  number_of_nodes              = var.node_count
  cluster_type                 = local.cluster_type
  final_snapshot_identifier    = "${local.resource_name}-${replace(timestamp(), ":", "-")}"
  encrypted                    = true
  cluster_parameter_group_name = aws_redshift_parameter_group.this.name
  tags                         = local.tags
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

locals {
  // Can only contain alphanumeric and hypen characters
  param_group_name = "${local.resource_name}-redshift${replace(var.redshift_version, ".", "-")}"
}

locals {
  enforce_ssl_parameter = var.enforce_ssl ? tomap({ "require_ssl" = "true" }) : tomap({})
  db_parameters         = merge(local.enforce_ssl_parameter)
}

resource "aws_redshift_parameter_group" "this" {
  name        = local.param_group_name
  family      = "redshift-${var.redshift_version}"
  tags        = local.tags
  description = "Redshift for ${local.block_name} (${local.env_name})"

  // When redshift version changes, we need to create a new one that attaches to the db
  //   because we can't destroy a parameter group that's in use
  lifecycle {
    create_before_destroy = true
  }

  dynamic "parameter" {
    for_each = local.db_parameters

    content {
      name  = parameter.key
      value = parameter.value
    }
  }
}
