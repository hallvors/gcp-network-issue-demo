resource "google_sql_database_instance" "instance" {
  name             = "${var.project_appname}-${terraform.workspace}-database-instance"
  database_version = "POSTGRES_9_6"
  region           = var.google_region

  settings {
    tier      = var.db_machine_type
    disk_size = 20

    backup_configuration {
      enabled = true
    }
    ip_configuration {
      ipv4_enabled    = false
      private_network = var.private_network
    }
    location_preference {
      zone = var.google_zone
    }
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_sql_database" "database" {
  name     = "${var.project_appname}-${terraform.workspace}-database"
  instance = google_sql_database_instance.instance.name

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_sql_user" "user" {
  name     = "${var.project_appname}-${terraform.workspace}-db-user"
  instance = google_sql_database_instance.instance.name
  password = var.db_pass != null && var.db_pass != "" ? var.db_pass : uuid()
}
