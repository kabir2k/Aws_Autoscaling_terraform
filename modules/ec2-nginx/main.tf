resource "aws_instance" "my_ec2_instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip
   vpc_security_group_ids = [var.vpc_security_group_ids]
     user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              service nginx start
              EOF
}

