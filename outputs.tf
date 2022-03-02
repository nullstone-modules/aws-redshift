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
