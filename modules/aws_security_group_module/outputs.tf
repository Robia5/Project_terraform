output "security_group_ids" {
  description = " The ID of the security group."
  # value = [{ for i, v in aws_security_group.sg : i => v.id }]
  value = values(aws_security_group.sg)[*].id
}

output "security_group_arn" {
  description = "The ARN of the security group"
  value       = try(aws_security_group.sg.arn, "")
}

output "security_group_vpc_id" {
  description = "The VPC ID"
  value       = try(aws_security_group.sg.vpc_id, "")
}

output "security_group_owner_id" {
  description = "The owner ID"
  value       = try(aws_security_group.sg.owner_id, "")
}

output "security_group_name" {
  description = "The name of the security group"
  value       = try(aws_security_group.sg.name, "")
}

output "security_group_description" {
  description = "The description of the security group"
  value       = try(aws_security_group.sg.description, "")
}