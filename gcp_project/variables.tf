variable "name" {}
variable "project_id" {}

variable "org_id" {
  default = "508326437899"
}

variable "billing_account" {
  default = "01637F-DF8783-566018"
}

variable "ssh_keys" {}

variable "owners" {
  description = "users who should be owners on all projects"
  type        = "list"
  default     = []
}

variable "editors" {
  description = "users who should be editors on all projects"
  type        = "list"
  default     = []
}

variable "domain" {
  description = "allow view access to the project to anyone in this domain"
  default     = "noderabbit.com"
}

variable "services" {
  description = "service APIs to enable"
  type        = "list"
  default     = []
}
