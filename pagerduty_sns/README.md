# Pagerduty SNS subscription

Creates an SNS topic with a pagerduty subscription connected. Intended
to be the target for a Cloudwatch alarm, etc.

## Example

```
module "example_pagerduty_topic" {
  name = "Example Topic"
  pagerduty_integration_url = "https://events.pagerduty.com/.../enqueue"
}
output "topic_arn" {
  value = "${module.example_pagerduty_topic.arn}"
}
```

Running `terraform apply` results in output like:

```
topic_arn = "arn:..."
```

## Variables

* `name` - name for the topic (required)
* `pagerduty_integration_url` - URL of the pagerduty endpoint for your
  integration (required). See the first part of
  [this guide](https://www.pagerduty.com/docs/guides/aws-cloudwatch-integration-guide/)
  for setting up the integration on the pagerduty side.

## Outputs

* `arn` - the ARN of the SNS topic. This is typically needed for
  connecting it to an alarm.

## Releases

* `pagerduty-sns-1.0.0` - Terraform 1.0.0 support
