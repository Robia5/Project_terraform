################################################################################
# Launch template
################################################################################

output "launch_template_id" {
  description = "The ID of the launch template"
  value       = try(aws_launch_template.launch_template.id, null)
}

output "launch_template_arn" {
  description = "The ARN of the launch template"
  value       = try(aws_launch_template.launch_template.arn, null)
}

output "launch_template_name" {
  description = "The name of the launch template"
  value       = try(aws_launch_template.launch_template.name, null)
}
################################################################################
# Autoscaling group
################################################################################

output "autoscaling_group_id" {
  description = "The autoscaling group id"
  value       = try(aws_autoscaling_group.asg.id, null)
}

output "autoscaling_group_name" {
  description = "The autoscaling group name"
  value       = try(aws_autoscaling_group.asg.name, null)
}

output "autoscaling_group_arn" {
  description = "The ARN for this AutoScaling Group"
  value       = try(aws_autoscaling_group.asg.arn, null)
}

output "autoscaling_group_min_size" {
  description = "The minimum size of the autoscale group"
  value       = try(aws_autoscaling_group.asg.min_size, null)
}

output "autoscaling_group_max_size" {
  description = "The maximum size of the autoscale group"
  value       = try(aws_autoscaling_group.asg.max_size, null)
}

output "autoscaling_group_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  value       = try(aws_autoscaling_group.asg.desired_capacity, null)
}

output "autoscaling_group_availability_zones" {
  description = "The availability zones of the autoscale group"
  value       = try(aws_autoscaling_group.asg.availability_zones, [])
}

output "autoscaling_group_vpc_zone_identifier" {
  description = "The VPC zone identifier"
  value       = try(aws_autoscaling_group.asg.vpc_zone_identifier, [])
}

output "autoscaling_group_load_balancers" {
  description = "The load balancer names associated with the autoscaling group"
  value       = try(aws_autoscaling_group.asg.load_balancers, [])
}

output "autoscaling_group_target_group_arns" {
  description = "List of Target Group ARNs that apply to this AutoScaling Group"
  value       = try(aws_autoscaling_group.asg.target_group_arns, [])
}