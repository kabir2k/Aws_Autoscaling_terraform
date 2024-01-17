resource "aws_autoscaling_attachment" "example" {
  autoscaling_group_name = var.autoscaling_group_name
  elb    = var.elb
}