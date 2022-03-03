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
  description = "string ||| The endpoint URL to access the Postgres instance."
}

output "db_security_group_id" {
  value       = aws_security_group.this.id
  description = "string ||| The ID of the security group attached to the Postgres instance."
}

output "db_user_security_group_id" {
  value       = aws_security_group.user.id
  description = "string ||| The ID of a security group that, when attached to a network device, allows access to the Postgres instance."
}

output "db_admin_function_name" {
  value       = module.db_admin.function_name
  description = "string ||| AWS Lambda Function name for database admin utility"
}
