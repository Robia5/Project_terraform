variable "tag_name" {
  description = "tag name"
  type        = string
}

variable "vpc_cidr" {
  description = "The ID of the VPC in which the endpoint will be used"
  type        = string
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "public_cidrs" {
  description = "The ID of the public_subnets in which the endpoint will be used"
  type        = list(string)
  default = []
}
variable "availability_zones" {
  description = "The ID of the public_subnets in which the endpoint will be used"
  type        = list(string)
  default = []
}

variable "map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is `false`"
  type        = bool
  default     = false
}

variable "private_cidrs" {
  description = "The ID of the private_subnets in which the endpoint will be used"
  type        = list(string)
  default = []
}

variable "eip_cidr" {
  description = "The ID of the private_subnets in which the endpoint will be used"
  type        = string
  default = null
}