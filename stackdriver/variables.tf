variable "gce_project" {}

variable "notification_channels" {
  description = "channels to send notifications to"
  type        = "list"
  default     = []
}
