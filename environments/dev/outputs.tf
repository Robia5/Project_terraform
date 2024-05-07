output "alb_dns_name" {
  description = "The DNS name of the load balancer"
  value = module.aws_lb_module.alb_dns_name
}