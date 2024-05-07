# AWS Auto Scaling Group (ASG) Terraform module

## Terraform module which creates Auto Scaling resources on AWS.

## Available Features

- Autoscaling group with launch template - either created by the module or utilizing an existing launch template

- Ability to configure autoscaling groups to set instance refresh configuration and add lifecycle hooks
- Ability to create an autoscaling group that respects `desired_capacity` or one that ignores to allow for scaling without conflicting

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | n/a     |



## Resources

| Name                                                                                                                                                | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_autoscaling_attachment.asg_alb_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment) | resource |
| [aws_autoscaling_group.asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group)                          | resource |
| [aws_launch_template.launch_template](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template)                  | resource |

## Inputs

| Name                                                                                                   | Description                                                                                                                                                      | Type           | Default      | Required |
| ------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| <a name="input_alb_target_group_arn"></a> [alb_target_group_arn](#input_alb_target_group_arn)          | load balancer target group arn                                                                                                                                   | `string`       | n/a          |   yes    |
| <a name="input_asg_name"></a> [asg_name](#input_asg_name)                                              | Name used across the resources created                                                                                                                           | `string`       | n/a          |   yes    |
| <a name="input_desired_capacity"></a> [desired_capacity](#input_desired_capacity)                      | The number of Amazon EC2 instances that should be running in the autoscaling group                                                                               | `number`       | `null`       |    no    |
| <a name="input_image_id"></a> [image_id](#input_image_id)                                              | The AMI from which to launch the instance                                                                                                                        | `string`       | `""`         |    no    |
| <a name="input_instance_type"></a> [instance_type](#input_instance_type)                               | The type of the instance. If present then `instance_requirements` cannot be present                                                                              | `string`       | `null`       |    no    |
| <a name="input_key_name"></a> [key_name](#input_key_name)                                              | The key name that should be used for the instance                                                                                                                | `string`       | `null`       |    no    |
| <a name="input_launch_template_version"></a> [launch_template_version](#input_launch_template_version) | Launch template version. Can be version number, `$Latest`, or `$Default`                                                                                         | `string`       | `"$Default"` |    no    |
| <a name="input_max_size"></a> [max_size](#input_max_size)                                              | The maximum size of the autoscaling group                                                                                                                        | `number`       | `null`       |    no    |
| <a name="input_min_size"></a> [min_size](#input_min_size)                                              | The minimum size of the autoscaling group                                                                                                                        | `number`       | `null`       |    no    |
| <a name="input_name_prefix"></a> [name_prefix](#input_name_prefix)                                     | Determines whether to use `name` as is or create a unique name beginning with the `name` as the prefix                                                           | `string`       | `true`       |    no    |
| <a name="input_security_group_id"></a> [security_group_id](#input_security_group_id)                   | A list of security group IDs to associate                                                                                                                        | `list(string)` | `[]`         |    no    |
| <a name="input_tag_name"></a> [tag_name](#input_tag_name)                                              | A map of tags to assign to resources                                                                                                                             | `string`       | `""`         |    no    |
| <a name="input_user_data"></a> [user_data](#input_user_data)                                           | The Base64-encoded user data to provide when launching the instance                                                                                              | `string`       | `null`       |    no    |
| <a name="input_vpc_zone_identifier"></a> [vpc_zone_identifier](#input_vpc_zone_identifier)             | A list of subnet IDs to launch resources in. Subnets automatically determine which availability zones the group will reside. Conflicts with `availability_zones` | `list(string)` | `null`       |    no    |

## Outputs

| Name                                                                                                                                               | Description                                                            |
| -------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| <a name="output_autoscaling_group_arn"></a> [autoscaling_group_arn](#output_autoscaling_group_arn)                                                 | The ARN for this AutoScaling Group                                     |
| <a name="output_autoscaling_group_availability_zones"></a> [autoscaling_group_availability_zones](#output_autoscaling_group_availability_zones)    | The availability zones of the autoscale group                          |
| <a name="output_autoscaling_group_desired_capacity"></a> [autoscaling_group_desired_capacity](#output_autoscaling_group_desired_capacity)          | The number of Amazon EC2 instances that should be running in the group |
| <a name="output_autoscaling_group_id"></a> [autoscaling_group_id](#output_autoscaling_group_id)                                                    | The autoscaling group id                                               |
| <a name="output_autoscaling_group_load_balancers"></a> [autoscaling_group_load_balancers](#output_autoscaling_group_load_balancers)                | The load balancer names associated with the autoscaling group          |
| <a name="output_autoscaling_group_max_size"></a> [autoscaling_group_max_size](#output_autoscaling_group_max_size)                                  | The maximum size of the autoscale group                                |
| <a name="output_autoscaling_group_min_size"></a> [autoscaling_group_min_size](#output_autoscaling_group_min_size)                                  | The minimum size of the autoscale group                                |
| <a name="output_autoscaling_group_name"></a> [autoscaling_group_name](#output_autoscaling_group_name)                                              | The autoscaling group name                                             |
| <a name="output_autoscaling_group_target_group_arns"></a> [autoscaling_group_target_group_arns](#output_autoscaling_group_target_group_arns)       | List of Target Group ARNs that apply to this AutoScaling Group         |
| <a name="output_autoscaling_group_vpc_zone_identifier"></a> [autoscaling_group_vpc_zone_identifier](#output_autoscaling_group_vpc_zone_identifier) | The VPC zone identifier                                                |
| <a name="output_launch_template_arn"></a> [launch_template_arn](#output_launch_template_arn)                                                       | The ARN of the launch template                                         |
| <a name="output_launch_template_id"></a> [launch_template_id](#output_launch_template_id)                                                          | The ID of the launch template                                          |
| <a name="output_launch_template_name"></a> [launch_template_name](#output_launch_template_name)                                                    | The name of the launch template                                        |
