provider "google" {
  version     = "~> 3.29.0"
  project     = var.google_project_id
  region      = var.google_region
  zone        = var.google_zone
  credentials = file("${var.service_account_file}")
}

provider "google-beta" {
  project     = var.google_project_id
  region      = var.google_region
  zone        = var.google_zone
  credentials = file("${var.service_account_file}")
}

terraform {
  required_version = ">= 0.12.6"
}

module "network" {
  source             = "./modules/network"
  project_appname    = var.project_appname
  ip_v4              = var.ip_v4
  ip_v6              = var.ip_v6
}

module "updateinfra" {
  source                      = "./modules/vm"
  project_appname             = var.project_appname
  google_zone                 = var.google_zone
  server_to_server_acct_email = var.server_to_server_acct_email
  network                     = module.network.vpc_network
  subnetwork                  = module.network.vpc_subnetwork
}

module "database" {
  source             = "./modules/db"
  private_network    = module.network.vpc_network
  project_appname    = var.project_appname
  google_region      = var.google_region
  google_zone        = var.google_zone
  db_pass            = var.db_pass
}
