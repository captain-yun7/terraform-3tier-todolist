output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "backend_public_ip" {
  description = "Backend EC2 public IP"
  value       = module.backend.backend_public_ip
}

output "backend_url" {
  description = "Backend URL"
  value       = "http://${module.backend.backend_public_ip}:8080"
}

output "frontend_url" {
  description = "Frontend CloudFront URL"
  value       = module.frontend.cloudfront_url
}

output "db_endpoint" {
  description = "Database endpoint"
  value       = module.db.db_instance_endpoint
  sensitive   = true
}

output "s3_bucket_name" {
  description = "Frontend S3 bucket name"
  value       = module.frontend.s3_bucket_name
}