resource "google_monitoring_alert_policy" "high_throttled_write_ops" {
  project      = "${var.gce_project}"
  display_name = "High Throttled Write Ops"
  combiner     = "OR"

  conditions {
    display_name = "Throttled write operations [MAX]"

    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/instance/disk/throttled_write_ops_count\" resource.type=\"gce_instance\""
      duration        = "900s"
      comparison      = "COMPARISON_GT"
      threshold_value = 1

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
    content   = "This tends to correlate with a process going out of control and writing files in an infinite loop."
    mime_type = "text/markdown"
  }

  # we just use this label to make it clear that this is a Terraform managed resource
  user_labels {
    terraform = true
  }

  notification_channels = "${var.notification_channels}"
}

resource "google_monitoring_alert_policy" "disk_usage_90" {
  project      = "${var.gce_project}"
  display_name = "Disk usage over 90%"
  combiner     = "OR"

  conditions {
    display_name = "GCE VM Instance - Disk utilization for used"

    condition_threshold {
      filter          = "metric.type=\"agent.googleapis.com/disk/percent_used\" resource.type=\"gce_instance\" metric.label.\"state\"=\"used\""
      duration        = "3600s"
      comparison      = "COMPARISON_GT"
      threshold_value = 90

      trigger {
        count = 1
      }

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  # we just use this label to make it clear that this is a Terraform managed resource
  user_labels {
    terraform = true
  }

  notification_channels = "${var.notification_channels}"
}

resource "google_monitoring_alert_policy" "high_disk_operations" {
  project      = "${var.gce_project}"
  display_name = "High Disk Operations"
  combiner     = "OR"

  conditions {
    display_name = "Disk operations"

    condition_threshold {
      filter          = "metric.type=\"agent.googleapis.com/disk/operation_count\" resource.type=\"gce_instance\""
      duration        = "900s"
      comparison      = "COMPARISON_GT"
      threshold_value = 4

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
    content   = "This probably means that some process has gone out of control."
    mime_type = "text/markdown"
  }

  # we just use this label to make it clear that this is a Terraform managed resource
  user_labels {
    terraform = true
  }

  notification_channels = "${var.notification_channels}"
}

resource "google_monitoring_alert_policy" "cpu_90" {
  project      = "${var.gce_project}"
  display_name = "CPU over 90%"
  combiner     = "OR"

  conditions {
    display_name = "GCE VM Instance - CPU utilization"

    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" resource.type=\"gce_instance\""
      duration        = "900s"
      comparison      = "COMPARISON_GT"
      threshold_value = 0.9

      trigger {
        count = 1
      }

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  # we just use this label to make it clear that this is a Terraform managed resource
  user_labels {
    terraform = true
  }

  notification_channels = "${var.notification_channels}"
}

resource "google_monitoring_alert_policy" "cpu_80" {
  project      = "${var.gce_project}"
  display_name = "CPU over 80%"
  combiner     = "OR"

  conditions {
    display_name = "GCE VM Instance - CPU utilization"

    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" resource.type=\"gce_instance\""
      duration        = "3600s"
      comparison      = "COMPARISON_GT"
      threshold_value = 0.8

      trigger {
        count = 1
      }

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  # we just use this label to make it clear that this is a Terraform managed resource
  user_labels {
    terraform = true
  }

  notification_channels = "${var.notification_channels}"
}

resource "google_monitoring_alert_policy" "cpu_50" {
  project      = "${var.gce_project}"
  display_name = "CPU over 50%"
  combiner     = "OR"

  conditions {
    display_name = "GCE VM Instance - CPU utilization"

    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" resource.type=\"gce_instance\""
      duration        = "21600s"
      comparison      = "COMPARISON_GT"
      threshold_value = 0.5

      trigger {
        count = 1
      }

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  # we just use this label to make it clear that this is a Terraform managed resource
  user_labels {
    terraform = true
  }

  notification_channels = "${var.notification_channels}"
}

resource "google_monitoring_alert_policy" "memory_90" {
  project      = "${var.gce_project}"
  display_name = "Memory over 90%"
  combiner     = "OR"

  conditions {
    display_name = "GCE VM Instance - Memory utilization"

    condition_threshold {
      filter          = "metric.type=\"agent.googleapis.com/memory/percent_used\" resource.type=\"gce_instance\""
      duration        = "900s"
      comparison      = "COMPARISON_GT"
      threshold_value = 90

      trigger {
        count = 1
      }

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  # we just use this label to make it clear that this is a Terraform managed resource
  user_labels {
    terraform = true
  }

  notification_channels = "${var.notification_channels}"
}

resource "google_monitoring_alert_policy" "slow_disk_io" {
  project      = "${var.gce_project}"
  display_name = "Slow disk I/O"
  combiner     = "OR"

  conditions {
    display_name = "Disk I/O time"

    condition_threshold {
      filter          = "metric.type=\"agent.googleapis.com/disk/io_time\" resource.type=\"gce_instance\""
      duration        = "900s"
      comparison      = "COMPARISON_GT"
      threshold_value = 3

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
    content   = "Disk I/O has been over 3ms for 15 minutes. This probably indicates a lot of contention or a hardware issue."
    mime_type = "text/markdown"
  }

  # we just use this label to make it clear that this is a Terraform managed resource
  user_labels {
    terraform = true
  }

  notification_channels = "${var.notification_channels}"
}
