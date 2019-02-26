# scale up alarm/ creating asg scaling policy for UP

resource "aws_autoscaling_policy" "mind-tree-demo-cpu-policy" {
  name                   = "mind-tree-demo-cpu-policy"
  autoscaling_group_name = "${aws_autoscaling_group.mind-tree-demo-autoscaling.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

# creating Cloudwatch alarm for check cpu utilization and increase instance if load more than 30% for 120 sec for 2 evalution period

resource "aws_cloudwatch_metric_alarm" "mind-tree-demo-cpu-alarm" {
  alarm_name          = "mind-tree-demo-cpu-alarm"
  alarm_description   = "mind-tree-demo-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "20"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.mind-tree-demo-autoscaling.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.mind-tree-demo-cpu-policy.arn}"]
}

# scale down alarm /creating asg scaling policy for Down

resource "aws_autoscaling_policy" "mind-tree-demo-cpu-policy-scaledown" {
  name                   = "mind-tree-demo-cpu-policy-scaledown"
  autoscaling_group_name = "${aws_autoscaling_group.mind-tree-demo-autoscaling.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

# creating Cloudwatch alarm for check cpu utilization and decrease instance if load comes under 5% for 120 sec for 2 evalution period 
  resource "aws_cloudwatch_metric_alarm" "mind-tree-demo-cpu-alarm-scaledown" {
  alarm_name          = "mind-tree-demo-cpu-alarm-scaledown"
  alarm_description   = "mind-tree-demo-cpu-alarm-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "5"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.mind-tree-demo-autoscaling.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.mind-tree-demo-cpu-policy-scaledown.arn}"]
}
