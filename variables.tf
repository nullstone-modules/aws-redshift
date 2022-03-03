variable "redshift_version" {
  type        = string
  default     = "1.0"
  description = "Redshift Engine Version"
}

variable "instance_class" {
  type        = string
  default     = "dc2.large"
  description = <<EOF
The instance class for each of the nodes.
Valid values are ra3.xlplus, ra3.4xlarge, ra3.16xlarge, dc2.large, dc2.8xlarge, ds2.xlarge, ds2.8xlarge.
EOF
}

variable "node_count" {
  type        = number
  default     = 1
  description = "The number of nodes in your cluster"
}

variable "enable_public_access" {
  type        = bool
  default     = false
  description = <<EOF
By default, the redshift cluster is not accessible to the public.
If you want to access your database from outside the vpc, enable this option.
EOF
}

variable "database_name" {
  type = string
  default = "redshift"
  description = "The name of the default database to create"
}

locals {
  port = 5439
}
