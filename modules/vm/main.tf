resource google_compute_disk updatevm_disk {
  description = "Initial disk for project, used for booting update VMs to pull and build code"
  name        = "${var.project_appname}-${terraform.workspace}-updatevm-disk"
  image       = "ubuntu-1804-lts"
}

resource google_compute_instance updatevm {
  description = "This virtual machine will be used to pull updates, build the app, and from the associated disk new images can be created"

  name = "${var.project_appname}-${terraform.workspace}-update-vm"
  boot_disk {
    source = google_compute_disk.updatevm_disk.self_link
    auto_delete = false
  }
  machine_type = "n1-standard-1"
  zone         = var.google_zone

  metadata = {
    name                      = var.project_appname
    env                       = terraform.workspace
    google-logging-enabled    = "true"
    google-monitoring-enabled = "true"
  }

  tags = [
    "ssh",
    "http",
    "allow-loadbalancer-traffic",
    "allow-iap"
  ]


  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
  # Update VM needs a public IP
    access_config {
      network_tier = "STANDARD"
    }
  }

  service_account {
    email  = var.server_to_server_acct_email
    scopes = ["cloud-platform"]
  }
}
