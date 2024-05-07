variable "tag_name" {
  description = "A map of tags to assign to resources"
  type        = string
  default     = ""
}

variable "name_prefix" {
  description = "Determines whether to use `name` as is or create a unique name beginning with the `name` as the prefix"
  type        = string
  default     = true
}
variable "image_id" {
  description = "The AMI from which to launch the instance"
  type        = string
  default     = ""
}
variable "instance_type" {
  description = "The type of the instance. If present then `instance_requirements` cannot be present"
  type        = string
  default     = null
}
variable "key_name" {
  description = "The key name that should be used for the instance"
  type        = string
  default     = null
}
variable "user_data" {
  description = "The Base64-encoded user data to provide when launching the instance"
  type        = string
  default     = null
}
variable "security_group_id" {
  description = "A list of security group IDs to associate"
  type        = list(string)
  default     = []
}
################################################################################
# Autoscaling group
################################################################################
variable "asg_name" {
  description = "Name used across the resources created"
  type        = string
}


variable "desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the autoscaling group"
  type        = number
  default     = null
}
variable "max_size" {
  description = "The maximum size of the autoscaling group"
  type        = number
  default     = null
}

variable "min_size" {
  description = "The minimum size of the autoscaling group"
  type        = number
  default     = null
}
variable "vpc_zone_identifier" {
  description = "A list of subnet IDs to launch resources in. Subnets automatically determine which availability zones the group will reside. Conflicts with `availability_zones`"
  type        = list(string)
  default     = null
}
variable "launch_template_version" {
  description = "Launch template version. Can be version number, `$Latest`, or `$Default`"
  type        = string
  default     = "$Default"
}
variable "alb_target_group_arn" {
  description = "load balancer target group arn"
  type        = string
}

