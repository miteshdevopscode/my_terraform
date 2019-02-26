# Creating Launch Config

resource "aws_launch_configuration" "mind-tree-demo-launchconfig" {
  name_prefix     = "mind-tree-demo-launchconfig"
  image_id        = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.my-demokey.key_name}"
  security_groups = ["${aws_security_group.allow-ssh.id}"]
}

# Creating ASG and Attaching Launch Config on it

resource "aws_autoscaling_group" "mind-tree-demo-autoscaling" {
  name                      = "mind-tree-demo-autoscaling"
  vpc_zone_identifier       = ["${aws_subnet.main-public-1.id}", "${aws_subnet.main-public-2.id}"]
  launch_configuration      = "${aws_launch_configuration.mind-tree-demo-launchconfig.name}"
  min_size                  = 1
  max_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "ec2 instance"
    propagate_at_launch = true
  }
}
