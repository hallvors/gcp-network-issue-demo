variable "project_appname" {
  description = "Short name (codename) for project"
  default     = null
}

variable ip_v4 {
  description = "Static IP address, IPv4, if not supplied GCP will create one"
  default     = null
  type        = string
}

variable ip_v6 {
  description = "Static IP address, IPv6, if not supplied GCP will create one"
  default     = null
  type        = string
}
