output "updatevm_name" {
  value = module.updateinfra.updatevm_name
}

output "update_disk_link" {
  value = module.updateinfra.update_disk_link
}

output "vpc_network" {
  value = module.network.vpc_network
}

output "vpc_subnetwork" {
  value = module.network.vpc_subnetwork
}
