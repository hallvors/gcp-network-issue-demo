variable "project_appname" {
  description = "Short name (codename) for project"
  default     = null
}

variable "google_zone" {
  description = "The zone in which to create the VM in on GCE"
  default     = "europe-north1-a"
  type        = string
}

variable server_to_server_acct_email {
  description = "Service account email address to set as VM instance service account, enables using other GCP services like logging"
  default     = null
}

variable "network" {
  type        = string
  description = "Name of the network this instance should use"
}

variable "subnetwork" {
  type        = string
  description = "Name of the subnetwork this instance should use"
}
