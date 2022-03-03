output "db_arn" {
  value       = aws_redshift_cluster.this.arn
  description = "string ||| The ARN of the created Redshift Cluster"
}

output "db_master_secret_name" {
  value       = aws_secretsmanager_secret.password.name
  description = "string ||| The name of the secret in AWS Secrets Manager containing the password"
}

output "db_endpoint" {
  value       = aws_redshift_cluster.this.endpoint
  description = "string ||| The endpoint URL to access the Redshift instance."
}

output "db_username" {
  value       = aws_redshift_cluster.this.master_username
  description = "string ||| The master username for the default database in the Redshift cluster."
}

output "db_database" {
  value       = aws_redshift_cluster.this.database_name
  description = "string ||| The name of the default database created in the Redshift cluster."
}

output "db_security_group_id" {
  value       = aws_security_group.this.id
  description = "string ||| The ID of the security group attached to the Redshift instance."
}

output "db_user_security_group_id" {
  value       = aws_security_group.user.id
  description = "string ||| The ID of a security group that, when attached to a network device, allows access to the Redshift instance."
}
