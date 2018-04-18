resource "aws_route53_health_check" "check" {
  fqdn = "${var.fqdn}"
  port = 443
  type = "HTTPS"
  resource_path = "${var.path}"
  failure_threshold = "${var.failure_threshold}"
  request_interval = "${var.request_interval}"

  regions = "${var.regions}"

  tags {
     Name = "tf-${var.name}-health-check"
     Terraform = true
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm" {
   alarm_name = "tf-${var.name}-health-check-status"
   comparison_operator = "LessThanThreshold"
   evaluation_periods = "1"
   metric_name = "HealthCheckStatus"
   namespace = "AWS/Route53"
   period = "60"
   threshold = "1"

   alarm_actions = ["${var.notify_action}"]

   statistic = "Minimum"
   dimensions {
     HealthCheckId = "${aws_route53_health_check.check.id}"
   }
   treat_missing_data = "missing"
}
