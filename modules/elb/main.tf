resource "aws_vpc" "elb" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "autoscaling"
  }
}


resource "aws_lb_target_group" "test" {
  protocol = "HTTP"
  name     = "app-office-target-group-1"
  port     = 80
  vpc_id  =  aws_vpc.elb.id
}



resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = "${aws_lb_target_group.test.arn}"
  target_id        = var.target_id
  port             = 80

}


resource "aws_subnet" "subnet-1" {

  availability_zone = "ap-south-1a"
  vpc_id =  aws_vpc.elb.id
  cidr_block = "10.0.0.0/25"    
}


resource "aws_subnet" "subnet_2" {

  availability_zone = "ap-south-1b"
   vpc_id =  aws_vpc.elb.id
  cidr_block = "10.0.0.128/25"
}
resource "aws_lb" "test" {
  name               = "ec2-app-new-1"
  internal           = false
  load_balancer_type = "application"
  enable_deletion_protection = true
   security_groups    = [aws_security_group.elb_security.id]
  subnets         = [aws_subnet.subnet-1.id,aws_subnet.subnet_2.id]
  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn =  "${aws_lb.test.arn}"
  port              = "80"
  protocol          = "HTTP"
 



  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.test.arn}"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.elb.id

  tags = {
    Name = "autoscalling"
  }
}
resource "aws_route_table" "example" {
  vpc_id = aws_vpc.elb.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}



resource "aws_route_table_association" "association_subnet1" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.example.id
}

resource "aws_route_table_association" "association_subnet2" {
  subnet_id      = aws_subnet.subnet_2.id
  route_table_id = aws_route_table.example.id
}






resource "aws_security_group" "elb_security" {
  vpc_id = aws_vpc.elb.id

  



  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
 ingress {
    from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] 
  
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  
}