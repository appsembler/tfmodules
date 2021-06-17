# AWS health check

Creates an AWS Health Check and associated Cloudwatch Alarm.

## Example

```
module "amc_ficus_health_check" {
  source = "github.com/appsembler/tfmodules//health_check"
  name = "AMC ficus"
  fqdn = "studio.tahoe.appsembler.com"
  path = "/heartbeat"
  notify_action = "${aws_sns_topic.amc_pagerduty_topic.arn}"
}
```

## Variables

* `name` - name of the health check (required)
* `fqdn` - hostname to check (required)
* `path` - path to check. defaults to `/`. Ideally, set this to some
  kind of smoketest or health check endpoint. `fqdn` and `path`
  together specify the full URL to check (HTTPS-only).
* `failure_threshold` - The number of consecutive health checks that
  an endpoint must pass or fail before the alarm is
  raised/cleared. Defaults to 3.
* `request_interval` - number of seconds between checks. defaults to 30.
* `regions` - list of regions to run the checks from. defaults to
  `["us-east-1", "eu-west-1", "us-west-1"]`. This is probably fine for
  most setups. If the check is for a customer with a large presence in
  some other region, it might be worth adding one for them as well.
* `notify_action` - ARN of an SNS topic that will be notified when
  this check fails/recovers. required.

## Outputs

There are no outputs from this module.

## Releases

* `health-check-1.0.0` - terraform 1.0.0 support
