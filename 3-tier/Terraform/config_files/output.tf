# Retrieve Application LB endpoint
output "lb_dns_name" {
  description = "Name of Application LB"
  value       = aws_lb.mLB.dns_name
}