# Cloud Infrastructure Automation Module
## Overview
This module, named [ASG & ALB], is designed to simplify and automate the provisioning of cloud infrastructure components, including:

Auto Scaling Group (ASG): Dynamically scales compute resources based on demand.
Application Load Balancer (ALB): Distributes incoming application traffic across multiple targets.
Security Group: Acts as a virtual firewall to control inbound and outbound traffic.
Network: Defines the networking resources and configurations for your infrastructure.
By leveraging this module, users can easily create and manage complex cloud architectures with minimal effort.

Features
1. Easy Integration
Integrate this module into your infrastructure as code (IaC) projects effortlessly. With simple and intuitive APIs, you can quickly define and deploy your cloud infrastructure.

2. Flexible Configuration
Customize your infrastructure to meet specific requirements using a wide range of configuration options. From instance types to security policies, tailor every aspect of your setup according to your needs.

3. Scalability
Utilize Auto Scaling Groups to automatically adjust compute capacity based on demand. This ensures optimal performance and cost-efficiency, even during peak traffic periods.

4. High Availability
Ensure high availability and fault tolerance with Application Load Balancers, which distribute incoming traffic across multiple targets. This prevents any single point of failure and improves the reliability of your applications.

# Usage          ---network_module
```
module "network_module" {
  source = "../../modules/network_module"

  vpc_cidr = "10.0.0.0/16"

  availability_zones = ["us-east-1a", "us-east-1b"]
  public_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  map_public_ip_on_launch = true
  private_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
```
# ASG_module
```
module "aws_asg_module" {
  source = "../../modules/aws_asg_module"
  tag_name = "my"

  asg_name = "autoscaling_group"
  desired_capacity   = 2
  max_size       = 3
  min_size       = 1
  vpc_zone_identifier = [module.network_module.private_subnets[0], module.network_module.private_subnets[1]]
```
## Here for vpc_zone_identifier you can use subnet of module_network because has a outputs

## Сommands to start and create

```
terraform init                # initialization providers...
terraform plan                # pre-creation resource validation
terraform apply               # deploy
terraform destroy             # deletion
```
# Project_terraform
# Project_terraform
