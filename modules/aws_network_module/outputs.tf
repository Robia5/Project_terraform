################################################################################
# VPC
################################################################################
output "vpc_id" {
  description = "The ID of the VPC"
  value       = try(aws_vpc.vpc.id, null)
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = try(aws_vpc.vpc.arn, null)
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = try(aws_vpc.vpc.cidr_block, null)
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = try(aws_vpc.vpc.default_security_group_id, null)
}

output "default_route_table_id" {
  description = "The ID of the default route table"
  value       = try(aws_vpc.vpc.default_route_table_id, null)
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = try(aws_vpc.vpc.enable_dns_support, null)
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = try(aws_vpc.vpc.enable_dns_hostnames, null)
}

output "vpc_owner_id" {
  description = "The ID of the AWS account that owns the VPC"
  value       = try(aws_vpc.vpc.owner_id, null)
}
################################################################################
# Internet Gateway
################################################################################

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = try(aws_internet_gateway.igw.id, null)
}

output "igw_arn" {
  description = "The ARN of the Internet Gateway"
  value       = try(aws_internet_gateway.igw.arn, null)
}

################################################################################
# Publiс Subnets
################################################################################

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public_subnets[*].id
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = aws_subnet.public_subnets[*].arn
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = compact(aws_subnet.public_subnets[*].cidr_block)
}

output "public_route_table_association_ids" {
  description = "List of IDs of the public route table association"
  value       = aws_route_table_association.public_rt_ass[*].id
}
################################################################################
# Private Subnets
################################################################################

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private_subnets[*].id
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = aws_subnet.private_subnets[*].arn
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = compact(aws_subnet.private_subnets[*].cidr_block)
}

output "private_route_table_association_ids" {
  description = "List of IDs of the private route table association"
  value       = aws_route_table_association.private_rt_ass[*].id
}

output "nat_ids" {
  description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = aws_eip.eip.id
}

output "natgw_ids" {
  description = "List of NAT Gateway IDs"
  value       = aws_nat_gateway.natgw.id
}
################################################################################
# Static values (arguments)
################################################################################
output "azs" {
  description = "A list of availability zones specified as argument to this module"
  value       = var.availability_zones
}