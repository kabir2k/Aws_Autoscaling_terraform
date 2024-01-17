

resource "aws_launch_template" "foobar" {
  name_prefix   = "foobar"
  image_id      =  var.image_id
  instance_type = var.instance_type
     key_name     = var.key_name

}

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["ap-south-1a"]
  desired_capacity   = 2
  max_size           = 3
  min_size           = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  launch_template {
   id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
}


