output "alb_dns_name" {
  description = "DNS name of the load balancer"
  value       = aws_lb.backend.dns_name
}

output "alb_zone_id" {
  description = "Zone ID of the load balancer"
  value       = aws_lb.backend.zone_id
}

output "alb_arn" {
  description = "ARN of the load balancer"
  value       = aws_lb.backend.arn
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.backend.arn
}

output "backend_security_group_id" {
  description = "Security group ID for backend instances"
  value       = aws_security_group.backend.id
}

output "asg_name" {
  description = "Auto Scaling Group name"
  value       = aws_autoscaling_group.backend.name
}