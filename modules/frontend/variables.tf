variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "backend_alb_dns_name" {
  description = "Backend ALB DNS name for API calls"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name for static website (must be globally unique)"
  type        = string
  default     = ""
}