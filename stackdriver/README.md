# stackdriver

Sets up our standard set of Stackdriver alert policies for a GCP
project.

An important caveat is that since pagerduty/slack integration requires
a manual configuration step, this module does not attempt to handle
those. It expects that you have created those integrations in the
project and can just put in the IDs as inputs for this module.

## Example

```
module "stackdriver_alerts" {
  source = "github.com/appsembler/tfmodules//stackdriver?ref=stackdriver-0.1.0"
  gce_project = "appsembler-example-123"
  
  throttled_write_ops_threshold = 2
  throttled_write_ops_duration = "1800s"
  
  cpu_high_threshold = 95
  
  notification_channels = [
    "projects/appsembler-example-123/notificationChannels/123412341234",
    "projects/appsembler-example-123/notificationChannels/432143114312"
  ]
}
```

## Variables

* `gce_project` - project id of the GCP project (required)
* `notification_channels` - list of notification channel ids.

Each alert is parameterizable via threshold and duration
variables. None are required (you just get the default values). The
threshold is the value where the alert triggers at, duration is how
long it has to stay over (or under) the threshold before the alert
triggers.

* `throttled_write_ops_threshold` - defaults to `1`
* `throttled_write_ops_duration` - defaults to `900s` (15 minutes)
* `disk_usage_threshold` - percentage of disk usage. defaults to `90`
* `disk_usage_duration` - defaults to `3600s`
* `disk_operations_threshold` - defaults to `4`
* `disk_operations_duration` - defaults to `900s`
* `cpu_high_threshold` - percentage CPU usage. This is the kind of
  metric that tends to be very spiky. It's usually pretty normal for
  CPU to spike to 100% for a while during a deploy or something. We
  are interested in getting an alert when it's been high for a long
  time, which is more likely to indicate something being stuck and
  actually needing attention. So the CPU alerts are split into three
  levels with decreasing thresholds and longer durations. defaults to `90`
* `cpu_high_duration` - defaults to `900s`
* `cpu_medium_threshold` - defaults to `80`
* `cpu_medium_duration` - defaults to `3600s`
* `cpu_low_threshold` - defaults to `50`
* `cpu_low_duration` - defaults to `21600s` (6 hours)
* `memory_threshold` - percentage memory usage. defaults to `90`.
* `memory_duration` - defaults to `900s`
* `disk_io_latency_threshold` - average latency on disk io. defaults
   to `3`
* `disk_io_latency_duration` - defaults to `900s`.
* `cloud_sql_high_cpu_threshold` - defaults to `0.5`
* `cloud_sql_high_cpu_duration` - defaults to `3600s`
* `cloud_sql_disk_utilization_threshold` - defaults to `0.9`
* `cloud_sql_disk_utilization_duration` - defaults to `3600s`
* `cloud_sql_disk_read_ops_threshold` - defaults to `1`
* `cloud_sql_disk_read_ops_duration` - defaults to `3600s`
* `cloud_sql_disk_write_ops_threshold` - defaults to `100`
* `cloud_sql_disk_write_ops_duration` - defaults to `3600s`
* `cloud_sql_memory_utilization_threshold` - defaults to `0.8`
* `cloud_sql_memory_utilization_duration` - defaults to `3600s`


## Outputs

This module does not produce any outputs.

## Releases

* `stackdriver-2.1.1` - adjust Cloud SQL write ops threshold
* `stackdriver-2.1.0` - add Cloud SQL monitoring (basic CPU, disk, memory utilization)
* `stackdriver-2.0.0` - require terraform 1.0.0
* `stackdriver-1.1.2` - fix a 0.12 warning about interpolation-only expressions
* `stackdriver-1.1.1` - fix a 0.12 warning about type constraints
* `stackdriver-1.1.0` - only include `sd.*` devices for disk usage
  (exlude `loop0`, etc, which can show up as 100% full but not
  actually indicate a problem)
* `stackdriver-1.0.0` - terraform 0.12 conversion
* `stackdriver-0.3.0` - add runbook links for every alert
* `stackdriver-0.2.0` - parameterize threshold/duration for all alerts
* `stackdriver-0.1.0` - initial version
