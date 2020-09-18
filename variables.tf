variable "project_appname" {
  description = "Short name (codename) for project"
  default     = "gcp-network-issue-demo"
}

variable service_account_file {
  description = "JSON file from Google with auth data"
  default     = "local-secrets/google-project-credentials.json"
}

variable server_to_server_acct_email {
  description = "Service account email address to set as VM instance service account, enables easy server-to-server comms like logging"
  default     = null
}

variable "google_project_id" {
  description = "The name of the project in which to create the VM instances"
  default     = null
  type        = string
}

variable "google_region" {
  description = "The region in which to create the VM in on GCE"
  default     = "europe-north1"
  type        = string
}

variable "google_zone" {
  description = "The zone in which to create the VM in on GCE"
  default     = "europe-north1-a"
  type        = string
}

variable "ip_v4" {
  type    = string
  default = null
}

variable "ip_v6" {
  type    = string
  default = null
}

variable "db_pass" {
  type    = string
  default = null
}
