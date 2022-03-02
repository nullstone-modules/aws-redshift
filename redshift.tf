resource "aws_redshift_cluster" "this" {
  cluster_identifier = local.resource_name
  master_username    = replace(data.ns_workspace.this.block_ref, "-", "_")
  master_password    = random_password.this.result
  node_type          = "dc2.large"
  cluster_type       = "single-node"
  tags               = local.tags
}
