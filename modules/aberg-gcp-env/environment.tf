module "gcp_environment" {
  source = "../terraform-gke-cluster"

  project_id            = local.project_id
  entity                = local.entity
  region                = local.region
  subnets               = local.subnets

  gke_subnetwork          = "${local.entity}-${local.region}-gke"
  gke_node_pools          = local.gke_node_pools
  gke_ip_range_pods       = local.gke_ip_range_pods
  gke_ip_range_services   = local.gke_ip_range_services
  gke_deletion_protection = false

}
