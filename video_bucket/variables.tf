variable name {}
variable customer {}

variable prefix {
  type    = "string"
  default = "appsembler"
}

variable price_class {
  type        = "string"
  default     = "PriceClass_200"
  description = "CloudFront price class"
}

variable allowed_referer {
  type        = "string"
  default     = ""
  description = "referer to check for"
}
