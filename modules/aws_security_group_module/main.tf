resource "aws_security_group" "sg" {
  for_each = var.security_groups

  name        = each.key
  description = each.value["description"]
  vpc_id      = var.vpc_id

  tags = {
    "Name" = "${var.tag_name}-security-group"
  }

  dynamic "ingress" {
    for_each = each.value["ingress_rules"]

    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  dynamic "egress" {
    for_each = each.value["egress_rules"]

    content {
      from_port   = egress.value["from_port"]
      to_port     = egress.value["to_port"]
      protocol    = egress.value["protocol"]
      cidr_blocks = egress.value["cidr_blocks"]
    }
  }
}