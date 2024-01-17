variable "instance_type" {
  description = "EC2 instance type"
  type = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type = string
}

variable "associate_public_ip" {
  type = string
}

variable "subnet_id" {
type = string
}

variable "vpc_security_group_ids" {
  type = string
}
