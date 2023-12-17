module "kubernetes" {
  source = "../kubernetes"

  entity             = var.entity
  project_id         = var.project_id
  region             = var.region
  
  # GKE
  network             = module.network.network_name
  subnetwork          = var.gke_subnetwork
  ip_range_services   = var.gke_ip_range_services
  ip_range_pods       = var.gke_ip_range_pods
  deletion_protection = var.gke_deletion_protection

  node_pools  = var.gke_node_pools

}
