
output  "subnet1" {
  value = aws_subnet.subnet-1.id
}


output "vpc" {
  value = aws_vpc.elb.id
}

output "elb_security" {
  value =  aws_security_group.elb_security.id
}

output "lb" {
  value = aws_lb.test.id
}

output "lb_target" {
  value = aws_lb_target_group.test.arn
}

