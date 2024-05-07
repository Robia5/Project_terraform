terraform {
    backend "s3" {
        bucket = "robia-tfstate-bucket"
        key = "final_pr/terraform.tfstate"
        region = "us-east-1"

        dynamodb_table = "robia-tfstate-tb"
    }
}

# ##################   network_module   ###################

module "network_module" {
  source = "../../modules/network_module"

  vpc_cidr = "10.0.0.0/16"

  availability_zones = ["us-east-1a", "us-east-1b"]
  public_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  map_public_ip_on_launch = true
  private_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

  tag_name = "my"
}
# ##################   aws_sg_module   ###################
module "aws_sg_module" {
  source = "../../modules/aws_sg_module"

  tag_name = "my"
  vpc_id = module.network_module.vpc_id

  security_groups = {
    "web" = {
      description   = "Security group for web servers"
      vpc_id        = module.network_module.vpc_id
      ingress_rules = [
        {
          from_port   = 80
          to_port     = 80
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        },
        {
          from_port   = 443
          to_port     = 443
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
      egress_rules = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }
  }
}
##################   aws_asg_module   ###################
module "aws_asg_module" {
  source = "../../modules/aws_asg_module"
  tag_name = "my"

  asg_name = "autoscaling_group"
  desired_capacity   = 2
  max_size       = 3
  min_size       = 1
  vpc_zone_identifier = [module.network_module.private_subnets[0], module.network_module.private_subnets[1]]


  alb_target_group_arn = module.aws_lb_module.alb_tg_arn

#################  launch template   ########################
  name_prefix    = "lt_asg"
  instance_type  = "t2.micro"
  image_id      = data.aws_ami.ami.id
  security_group_id = module.aws_sg_module.security_group_ids
  user_data = file("user_data.txt")
}


#################   aws_lb_module   ###################
module "aws_lb_module" {
  source = "../../modules/aws_lb_module"
  tag_name = "my"

  name = "alb"
  internal = false
  load_balancer_type = "application" 
  security_groups    = module.aws_sg_module.security_group_ids
  subnets = module.network_module.public_subnets

  enable_deletion_protection = false


#################  target group   ########################
  target_type = "instance"
  target_port        = 80
  target_protocol    = "HTTP"
  vpc_id      = module.network_module.vpc_id

    health_check_path                = "/"
    health_check_interval            = 30
    health_check_timeout             = 5
    health_check_healthy_threshold   = 2
    health_check_unhealthy_threshold = 2

  #################  alb_listener_ports   #################
  alb_listener_ports = [80]
}