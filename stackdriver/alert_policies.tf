resource "google_monitoring_alert_policy" "high_throttled_write_ops" {
  project      = var.gce_project
  display_name = "High Throttled Write Ops"
  combiner     = "OR"

  conditions {
    display_name = "Throttled write operations [MAX]"

    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/instance/disk/throttled_write_ops_count\" resource.type=\"gce_instance\""
      duration        = var.throttled_write_ops_duration
      comparison      = "COMPARISON_GT"
      threshold_value = var.throttled_write_ops_threshold

      trigger {
        count = 1
      }

      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_RATE"
        cross_series_reducer = "REDUCE_MAX"

        group_by_fields = [
          "metric.label.instance_name",
        ]
      }
    }
  }

  documentation {
    content   = "This tends to correlate with a process going out of control and writing files in an infinite loop.\n\nRunbook: https://appsembler.atlassian.net/wiki/spaces/ED/pages/43582006/ALERT+High+Throttled+Write+Ops"
    mime_type = "text/markdown"
  }

  # we just use this label to make it clear that this is a Terraform managed resource
  user_labels = {
    terraform = true
  }

  notification_channels = var.notification_channels
}

resource "google_monitoring_alert_policy" "disk_usage_90" {
  project      = var.gce_project
  display_name = "Disk usage over ${var.disk_usage_threshold}%"
  combiner     = "OR"

  conditions {
    display_name = "GCE VM Instance - Disk utilization for used"

    condition_threshold {
      filter          = "metric.type=\"agent.googleapis.com/disk/percent_used\" resource.type=\"gce_instance\" metric.label.\"state\"=\"used\" metric.label.\"device\"=monitoring.regex.full_match(\"sd.*\")"
      duration        = var.disk_usage_duration
      comparison      = "COMPARISON_GT"
      threshold_value = var.disk_usage_threshold

      trigger {
        count = 1
      }

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  documentation {
    content   = "Runbook: https://appsembler.atlassian.net/wiki/spaces/ED/pages/43451024/ALERT+Disk+filling+up"
    mime_type = "text/markdown"
  }

  # we just use this label to make it clear that this is a Terraform managed resource
  user_labels = {
    terraform = true
  }

  notification_channels = var.notification_channels
}

resource "google_monitoring_alert_policy" "high_disk_operations" {
  project      = var.gce_project
  display_name = "High Disk Operations"
  combiner     = "OR"

  conditions {
    display_name = "Disk operations"

    condition_threshold {
      filter          = "metric.type=\"agent.googleapis.com/disk/operation_count\" resource.type=\"gce_instance\""
      duration        = var.disk_operations_duration
      comparison      = "COMPARISON_GT"
      threshold_value = var.disk_operations_threshold

      trigger {
        count = 1
      }

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_RATE"
      }
    }
  }

  documentation {
    content   = "This probably means that some process has gone out of control.\n\nRunbook: https://appsembler.atlassian.net/wiki/spaces/ED/pages/43778617/ALERT+High+Disk+Operations"
    mime_type = "text/markdown"
  }

  # we just use this label to make it clear that this is a Terraform managed resource
  user_labels = {
    terraform = true
  }

  notification_channels = var.notification_channels
}

resource "google_monitoring_alert_policy" "cpu_90" {
  project      = var.gce_project
  display_name = "CPU over ${var.cpu_high_threshold}%"
  combiner     = "OR"

  conditions {
    display_name = "GCE VM Instance - CPU utilization"

    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" resource.type=\"gce_instance\""
      duration        = var.cpu_high_duration
      comparison      = "COMPARISON_GT"
      threshold_value = var.cpu_high_threshold / 100.0

      trigger {
        count = 1
      }

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  documentation {
    content   = "Runbook: https://appsembler.atlassian.net/wiki/spaces/ED/pages/43778627/ALERT+High+CPU"
    mime_type = "text/markdown"
  }

  # we just use this label to make it clear that this is a Terraform managed resource
  user_labels = {
    terraform = true
  }

  notification_channels = var.notification_channels
}

resource "google_monitoring_alert_policy" "cpu_80" {
  project      = var.gce_project
  display_name = "CPU over ${var.cpu_medium_threshold}%"
  combiner     = "OR"

  conditions {
    display_name = "GCE VM Instance - CPU utilization"

    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" resource.type=\"gce_instance\""
      duration        = var.cpu_medium_duration
      comparison      = "COMPARISON_GT"
      threshold_value = var.cpu_medium_threshold / 100.0

      trigger {
        count = 1
      }

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  documentation {
    content   = "Runbook: https://appsembler.atlassian.net/wiki/spaces/ED/pages/43778627/ALERT+High+CPU"
    mime_type = "text/markdown"
  }

  # we just use this label to make it clear that this is a Terraform managed resource
  user_labels = {
    terraform = true
  }

  notification_channels = var.notification_channels
}

resource "google_monitoring_alert_policy" "cpu_50" {
  project      = var.gce_project
  display_name = "CPU over ${var.cpu_low_threshold}%"
  combiner     = "OR"

  conditions {
    display_name = "GCE VM Instance - CPU utilization"

    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" resource.type=\"gce_instance\""
      duration        = var.cpu_low_duration
      comparison      = "COMPARISON_GT"
      threshold_value = var.cpu_low_threshold / 100.0

      trigger {
        count = 1
      }

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  documentation {
    content   = "Runbook: https://appsembler.atlassian.net/wiki/spaces/ED/pages/43778627/ALERT+High+CPU"
    mime_type = "text/markdown"
  }

  # we just use this label to make it clear that this is a Terraform managed resource
  user_labels = {
    terraform = true
  }

  notification_channels = var.notification_channels
}

resource "google_monitoring_alert_policy" "memory_90" {
  project      = var.gce_project
  display_name = "Memory over ${var.memory_threshold}%"
  combiner     = "OR"

  conditions {
    display_name = "GCE VM Instance - Memory utilization"

    condition_threshold {
      filter          = "metric.type=\"agent.googleapis.com/memory/percent_used\" resource.type=\"gce_instance\""
      duration        = var.memory_duration
      comparison      = "COMPARISON_GT"
      threshold_value = var.memory_threshold

      trigger {
        count = 1
      }

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  documentation {
    content   = "Runbook: https://appsembler.atlassian.net/wiki/spaces/ED/pages/43385928/ALERT+High+Memory+Usage"
    mime_type = "text/markdown"
  }

  # we just use this label to make it clear that this is a Terraform managed resource
  user_labels = {
    terraform = true
  }

  notification_channels = var.notification_channels
}

resource "google_monitoring_alert_policy" "slow_disk_io" {
  project      = var.gce_project
  display_name = "Slow disk I/O"
  combiner     = "OR"

  conditions {
    display_name = "Disk I/O time"

    condition_threshold {
      filter          = "metric.type=\"agent.googleapis.com/disk/io_time\" resource.type=\"gce_instance\""
      duration        = var.disk_io_latency_duration
      comparison      = "COMPARISON_GT"
      threshold_value = var.disk_io_latency_threshold

      trigger {
        count = 1
      }

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_RATE"
      }
    }
  }

  documentation {
    content   = "Disk I/O has been over 3ms for 15 minutes. This probably indicates a lot of contention or a hardware issue.\n\nRunbook: https://appsembler.atlassian.net/wiki/spaces/ED/pages/43352733/ALERT+Slow+Disk+IO"
    mime_type = "text/markdown"
  }

  # we just use this label to make it clear that this is a Terraform managed resource
  user_labels = {
    terraform = true
  }

  notification_channels = var.notification_channels
}
