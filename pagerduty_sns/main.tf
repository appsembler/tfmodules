resource "aws_sns_topic" "topic" {
  name = "${var.name}"
}

resource "aws_sns_topic_subscription" "subscription" {
  topic_arn              = "${aws_sns_topic.topic.arn}"
  protocol               = "https"
  endpoint               = "${var.pagerduty_integration_url}"
  endpoint_auto_confirms = true
}
