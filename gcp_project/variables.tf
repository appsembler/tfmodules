variable "name" {
}

variable "project_id" {
}

variable "org_id" {
  type    = number
  default = 508326437899
}

variable "folder_id" {
  type    = string
  default = null
}

variable "billing_account" {
  default = "01637F-DF8783-566018"
}

variable "os_login" {
  description = "enable OS Login"
  default     = false
}

variable "ssh_keys" {
  default = ""
}

variable "owners" {
  description = "users who should be owners on all projects"
  type        = list(string)
  default     = []
}

variable "editors" {
  description = "users who should be editors on all projects"
  type        = list(string)
  default     = []
}

variable "domain" {
  description = "allow view access to the project to anyone in this domain"
  default     = "noderabbit.com"
}

variable "services" {
  description = "service APIs to enable"
  type        = list(string)
  default     = []
}

variable "labels" {
  description = "Labels"
  type        = map(string)
  default     = {}
}

