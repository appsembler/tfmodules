variable "gce_project" {}

variable "notification_channels" {
  description = "channels to send notifications to"
  type        = list
  default     = []
}

variable "throttled_write_ops_threshold" {
  default = "1"
}

variable "throttled_write_ops_duration" {
  default = "900s"
}

variable "disk_usage_threshold" {
  default = "90"
}

variable "disk_usage_duration" {
  default = "3600s"
}

variable "disk_operations_threshold" {
  default = "4"
}

variable "disk_operations_duration" {
  default = "900s"
}

variable "cpu_high_threshold" {
  default = "90"
}

variable "cpu_high_duration" {
  default = "900s"
}

variable "cpu_medium_threshold" {
  default = "80"
}

variable "cpu_medium_duration" {
  default = "3600s"
}

variable "cpu_low_threshold" {
  default = "50"
}

variable "cpu_low_duration" {
  default = "21600s"
}

variable "memory_threshold" {
  default = "90"
}

variable "memory_duration" {
  default = "900s"
}

variable "disk_io_latency_threshold" {
  default = "3"
}

variable "disk_io_latency_duration" {
  default = "900s"
}

variable "cloud_sql_high_cpu_duration" {
  default = "3600s"
}

variable "cloud_sql_high_cpu_threshold" {
  default = "0.5"
}

variable "cloud_sql_disk_utilization_duration" {
  default = "3600s"
}

variable "cloud_sql_disk_utilization_threshold" {
  default = "0.9"
}

variable "cloud_sql_disk_read_ops_duration" {
  default = "3600s"
}

variable "cloud_sql_disk_read_ops_threshold" {
  default = "1"
}

variable "cloud_sql_disk_write_ops_duration" {
  default = "3600s"
}

variable "cloud_sql_disk_write_ops_threshold" {
  default = "100"
}

variable "cloud_sql_memory_utilization_duration" {
  default = "3600s"
}

variable "cloud_sql_memory_utilization_threshold" {
  default = "0.8"
}

