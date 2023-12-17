output "available_zones" {
  value       = data.google_compute_zones.by_region.names
  description = "The availability zones within the target region"
}

output "network" {
  value       = module.vpc.network
  description = "The VPC resource being created"
}

output "network_name" {
  value       = module.vpc.network_name
  description = "The name of the VPC being created"
}

output "network_id" {
  value       = module.vpc.network_id
  description = "The ID of the VPC being created"
}

output "network_self_link" {
  value       = module.vpc.network_self_link
  description = "The URI of the VPC being created"
}

output "subnets" {
  value       = module.vpc.subnets
  description = "The created subnet resources"
}
