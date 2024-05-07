variable "tag_name" {
  description = "A map of tags to assign to resources"
  type        = string
  default     = ""
}
variable "name" {
  description = "alb name"
  type = string
  default = "lb"
}

variable "internal" {
  description = "If true, the LB will be internal. Defaults to `false`"
  type        = bool
  default     = null
}
variable "load_balancer_type" {
  description = "The type of load balancer to create. Possible values are `application`, `gateway`, or `network`. The default value is `application`"
  type        = string
  default     = "application"
}
variable "security_groups" {
  description = "A list of security group IDs to assign to the LB"
  type        = list(string)
  default     = []
}
variable "subnets" {
  description = "A list of subnet IDs to attach to the LB. Subnets cannot be updated for Load Balancers of type `network`. Changing this value for load balancers of type `network` will force a recreation of the resource"
  type        = list(string)
  default     = null
}
variable "enable_deletion_protection" {
  description = "If `true`, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to `true`"
  type        = bool
  default     = true
}

variable "alb_listener_ports" {
  description = "Map of listener configurations to create"
  type        = any
  default     = {}
}

variable "alb_listen_protocol" {
  description = "port alb listenner"
  type        = string
  default     = null
}


variable "alb_listener_type" {
  description = "port alb listenner"
  type        = string
  default     = "forward"
}
################################################################################
# Target Group
################################################################################
variable "name_tg" {
    description = "The name target group for alb"
    type = string
    default = "tg"
}
variable "target_type" {
    description = "Target type"
    type = string
    default = " "
}
variable "target_port" {
    description = "Target port"
    type = number
    default = null
}
variable "target_protocol" {
    description = "Target protocol"
    type = string
    default = " TCP "
}
variable "vpc_id" {
  description = "Identifier of the VPC where the security group will be created"
  type        = string
  default     = null
}
variable "health_check_path" {
  description = "Путь для проверки состояния здоровья"
  type        = string
  default     = null
}

variable "health_check_interval" {
  description = "Интервал между проверками состояния здоровья (в секундах)"
  type        = number
  default     = null
}

variable "health_check_timeout" {
  description = "Таймаут для проверки состояния здоровья (в секундах)"
  type        = number
  default     = null
}

variable "health_check_healthy_threshold" {
  description = "Количество успешных проверок для перевода в состояние 'здоров'"
  type        = number
  default     = null
}

variable "health_check_unhealthy_threshold" {
  description = "Количество неудачных проверок для перевода в состояние 'не здоров'"
  type        = number
  default     = null
}

