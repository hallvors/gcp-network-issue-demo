# IP addresses
resource "google_compute_global_address" "static_public_ip_v4" {
  name        = "${var.project_appname}-${terraform.workspace}-v4"
  description = "Static IPv4 for ${var.project_appname} load balancer. Managed by Terraform"
  ip_version  = "IPV4"
  address     = var.ip_v4
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_compute_global_address" "static_public_ip_v6" {
  name        = "${var.project_appname}-${terraform.workspace}-v6"
  description = "Static IPv6 for ${var.project_appname} load balancer. Managed by Terraform"
  ip_version  = "IPV6"
  address     = var.ip_v6
  lifecycle {
    prevent_destroy = true
  }
}
