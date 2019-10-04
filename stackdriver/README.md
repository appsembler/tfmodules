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
  notification_channels = [
    "projects/appsembler-example-123/notificationChannels/123412341234",
    "projects/appsembler-example-123/notificationChannels/432143114312"
  ]
}
```

## Variables

* `gce_project` - project id of the GCP project (required)
* `notification_channels` - list of notification channel ids.

## Outputs

This module does not produce any outputs.

## Releases

* `stackdriver-0.1.0` - initial version
