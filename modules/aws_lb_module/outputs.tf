output "alb_tg_arn" {
  description = "ARN of the Application Load Balancer target group"
  value       = aws_lb_target_group.alb_tg.arn
}

output "target_groups" {
  description = "Map of target groups created and their attributes"
  value       = aws_lb_target_group.alb_tg
}

output "alb_dns_name" {
  description = "The DNS name of the load balancer"
  value = aws_lb.alb.dns_name
}

output "id" {
  description = "The ID and ARN of the load balancer we created"
  value       = try(aws_lb.alb.id, null)
}

output "arn" {
  description = "The ID and ARN of the load balancer we created"
  value       = try(aws_lb.alb.arn, null)
}

output "zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records"
  value       = try(aws_lb.alb.zone_id, null)
}

output "listeners" {
  description = "Map of listeners created and their attributes"
  value       = aws_lb_listener.alb_listener
}
