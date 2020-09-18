resource "google_compute_network" "vpc" {
  name                    = "${var.project_appname}-${terraform.workspace}-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
  name          = "${var.project_appname}-${terraform.workspace}-vpc-subnetwork"
  ip_cidr_range = "10.2.0.0/24"
  network       = google_compute_network.vpc.self_link
}

resource "google_compute_global_address" "ip_range" {
  name          = "${var.project_appname}-${terraform.workspace}-ip-addresses"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.vpc.id
}

resource "google_service_networking_connection" "vpc_connection" {
  network                 = google_compute_network.vpc.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.ip_range.name]
}