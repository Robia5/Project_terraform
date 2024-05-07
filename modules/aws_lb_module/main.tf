################################################################################
# Load Balancer
################################################################################
resource "aws_lb" "alb" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = var.security_groups
  subnets            = var.subnets

  enable_deletion_protection = var.enable_deletion_protection

  tags = {
    "Name" = "${var.tag_name}-alb"
  }
}

resource "aws_lb_listener" "alb_listener" {
  count         = length(var.alb_listener_ports)
  load_balancer_arn = aws_lb.alb.arn
  port          = var.alb_listener_ports[count.index]
  protocol      = var.alb_listen_protocol

  default_action {
    type             = var.alb_listener_type
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}
################################################################################
# Target Group
################################################################################
resource "aws_lb_target_group" "alb_tg" {
  name        = var.name_tg
  target_type = var.target_type
  port        = var.target_port
  protocol    = var.target_protocol
  vpc_id      = var.vpc_id

  health_check {
    path                = var.health_check_path
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }

  tags = {
    "Name" = "${var.tag_name}-tg-alb"
  }
}
