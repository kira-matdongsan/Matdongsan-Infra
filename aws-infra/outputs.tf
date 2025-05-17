output "console_login_user" {
  value = aws_iam_user.admin_user.name
}

output "console_login_url" {
  value = "https://${data.aws_caller_identity.current.account_id}.signin.aws.amazon.com/console"
}

output "rds_endpoint" {
  value = aws_db_instance.mysql.endpoint
}

output "s3_bucket_name" {
  value = aws_s3_bucket.app_bucket.bucket
}
