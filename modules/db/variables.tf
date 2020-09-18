variable "project_appname" {
  description = "Short name (codename) for project"
  default     = null
}

variable db_pass {
  description = "Password for DB user"
  default     = null
}

variable db_machine_type {
  description = "Type of machine to provision for the database"
  default     = "db-f1-micro"
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

variable "private_network" {
  description = "The private network the Cloud SQL instance is connected to"
}
