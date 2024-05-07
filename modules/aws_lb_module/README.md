# AWS Application Load Balancer (ALB) Terraform module

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.alb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.alb_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_listen_protocol"></a> [alb\_listen\_protocol](#input\_alb\_listen\_protocol) | port alb listenner | `string` | `null` | no |
| <a name="input_alb_listener_ports"></a> [alb\_listener\_ports](#input\_alb\_listener\_ports) | Map of listener configurations to create | `any` | `{}` | no |
| <a name="input_alb_listener_type"></a> [alb\_listener\_type](#input\_alb\_listener\_type) | port alb listenner | `string` | `"forward"` | no |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | If `true`, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to `true` | `bool` | `true` | no |
| <a name="input_health_check_healthy_threshold"></a> [health\_check\_healthy\_threshold](#input\_health\_check\_healthy\_threshold) | Количество успешных проверок для перевода в состояние 'здоров' | `number` | `null` | no |
| <a name="input_health_check_interval"></a> [health\_check\_interval](#input\_health\_check\_interval) | Интервал между проверками состояния здоровья (в секундах) | `number` | `null` | no |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | Путь для проверки состояния здоровья | `string` | `null` | no |
| <a name="input_health_check_timeout"></a> [health\_check\_timeout](#input\_health\_check\_timeout) | Таймаут для проверки состояния здоровья (в секундах) | `number` | `null` | no |
| <a name="input_health_check_unhealthy_threshold"></a> [health\_check\_unhealthy\_threshold](#input\_health\_check\_unhealthy\_threshold) | Количество неудачных проверок для перевода в состояние 'не здоров' | `number` | `null` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | If true, the LB will be internal. Defaults to `false` | `bool` | `null` | no |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | The type of load balancer to create. Possible values are `application`, `gateway`, or `network`. The default value is `application` | `string` | `"application"` | no |
| <a name="input_name"></a> [name](#input\_name) | alb name | `string` | `"lb"` | no |
| <a name="input_name_tg"></a> [name\_tg](#input\_name\_tg) | The name target group for alb | `string` | `"tg"` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | A list of security group IDs to assign to the LB | `list(string)` | `[]` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | A list of subnet IDs to attach to the LB. Subnets cannot be updated for Load Balancers of type `network`. Changing this value for load balancers of type `network` will force a recreation of the resource | `list(string)` | `null` | no |
| <a name="input_tag_name"></a> [tag\_name](#input\_tag\_name) | A map of tags to assign to resources | `string` | `""` | no |
| <a name="input_target_port"></a> [target\_port](#input\_target\_port) | Target port | `number` | `null` | no |
| <a name="input_target_protocol"></a> [target\_protocol](#input\_target\_protocol) | Target protocol | `string` | `" TCP "` | no |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | Target type | `string` | `" "` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Identifier of the VPC where the security group will be created | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | The DNS name of the load balancer |
| <a name="output_alb_tg_arn"></a> [alb\_tg\_arn](#output\_alb\_tg\_arn) | ARN of the Application Load Balancer target group |
| <a name="output_arn"></a> [arn](#output\_arn) | The ID and ARN of the load balancer we created |
| <a name="output_id"></a> [id](#output\_id) | The ID and ARN of the load balancer we created |
| <a name="output_listeners"></a> [listeners](#output\_listeners) | Map of listeners created and their attributes |
| <a name="output_target_groups"></a> [target\_groups](#output\_target\_groups) | Map of target groups created and their attributes |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | The zone\_id of the load balancer to assist with creating DNS records |
