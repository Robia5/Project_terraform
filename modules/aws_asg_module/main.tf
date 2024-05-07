###############################################################################
#                   Launch template
################################################################################
resource "aws_launch_template" "launch_template" {
  name_prefix   = var.name_prefix
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = var.user_data

  vpc_security_group_ids = var.security_group_id
  
  tags = {
    "Name" = "${var.tag_name}-lt-asg"
  }
}
################################################################################
#                    Autoscaling group
################################################################################
resource "aws_autoscaling_group" "asg" {
  name = var.asg_name
  desired_capacity = var.desired_capacity
  max_size         = var.max_size
  min_size         = var.min_size

  vpc_zone_identifier = var.vpc_zone_identifier

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = var.launch_template_version
  }
}
resource "aws_autoscaling_attachment" "asg_alb_attachment" {
  autoscaling_group_name = aws_autoscaling_group.asg.name
  lb_target_group_arn   = var.alb_target_group_arn
}