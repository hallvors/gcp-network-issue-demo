output "vpc_network" {
  value = google_service_networking_connection.vpc_connection.network
}

output "vpc_subnetwork" {
  value = google_compute_subnetwork.vpc_subnetwork.id
}

output "service_connection" {
  value = google_service_networking_connection.vpc_connection
}

output "ip_v4_address" {
  value = google_compute_global_address.static_public_ip_v4.address
}

output "ip_v6_address" {
  value = google_compute_global_address.static_public_ip_v6.address
}
