output "aws_vpc" {
value = aws_vpc.vpc.id
}
output "ALB_Public_DNS" {
value = aws_lb.ALB.dns_name
}
