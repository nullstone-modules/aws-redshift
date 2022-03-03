# aws-redshift
Produces a standard, best-practice Amazon Redshift data warehouse in AWS

## Inputs

- `redshift_version: string` - Redshift Engine Version - default: 1.0
- `instance_class: string` - Redshift Instance Class - default: dc2.large
- `node_count: number` - Number of nodes in the Redshift cluster - default: 1
- `enable_public_access: boolean` - Make this cluster available to the public - default: false
- `database_name: string` - The name of the default database to create in the cluster - default: redshift

## Outputs

- `db_arn: string` - Redshift Cluster ARN
- `db_master_secret_name: string` - Name of AWS Secrets Manager Secret that holds database master credentials
- `db_endpoint: string` - Redshift Connection Endpoint
- `db_username: string` - The master username for connecting to the Redshift cluster
- `db_database: string` - The default database name for the Redshift cluster
- `db_security_group_id: string` - Security Group ID for RDS Cluster
- `db_user_security_group_id: string` - Security Group ID - Attach to any instance to gain access to the postgres cluster
