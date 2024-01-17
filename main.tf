module "ec2-nginx" {
  source = "/home/user/aws_studying/auto_scaleing_terraform/modules/ec2-nginx"
  instance_type          = "t2.micro"
  subnet_id        = module.elb.subnet1
  ami_id                 = "ami-0287a05f0ef0e9d9a"
  associate_public_ip = true
   vpc_security_group_ids = module.elb.elb_security
   
 
}


module "elb" {
  source = "./modules/elb"
  target_id = module.ec2-nginx.ec2 
}



module "key-pair" {
   source = "./modules/key-pair"
   key_name = "king-key"
}

 module "auto_scaling" {
    source = "./modules/auto_scaling"
    image_id      = "ami-09b384454f8736fcf"
    instance_type = "t2.micro"
     key_name = "king-key"
 }



 module "elb-ec2_attachment" {
   source = "./modules/elb-ec2_attachment"
 autoscaling_group_name = module.auto_scaling.auto
  elb                    = module.elb.lb
 }