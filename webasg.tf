resource "aws_autoscaling_group" "swiggy_auto_scaling" {
  name = "swiggy-web-asg"
  launch_template {
    id      = aws_launch_template.swiggy-web-template.id
    version = "$latest"
  }
  vpc_zone_identifier = [aws_subnet.swiggy-pub-sub-1, aws_subnet.swiggy_pub_sub_2]
  min_size            = 2
  max_size            = 3
  desired_capacity    = 2
}

resource "aws_launch_template" "swiggy-web-template" {
  name_prefix   = "swiggy-web-template"
  image_id      = "ami-099340ab7490f8ef6"
  instance_type = "t2.micro"
  key_name      = "NEW_VALUE"
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.swiggy-ec2-asg-sg.id]
  }
  user_data = base64encode(file("apache.sh"))
  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }
}

