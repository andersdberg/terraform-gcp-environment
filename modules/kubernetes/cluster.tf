module "gke" {
  source = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"

  #####################################
  ############ Required ###############
  #####################################

  project_id = var.project_id
  name       = local.cluster_name

  network                  = var.network
  subnetwork               = var.subnetwork
  # The primary IP address range for pods across the GKE cluster
  cluster_ipv4_cidr        = var.cluster_ipv4_cidr
  # The name of a secondary subnet ip range for pods
  ip_range_pods            = var.ip_range_pods
  # A list of additional secondary subnet ip ranges for pods
  additional_ip_range_pods = var.additional_ip_range_pods
  # The name of a secondary subnet ip range for services
  ip_range_services        = var.ip_range_services

  #####################################
  ############ Optional ###############
  #####################################

  kubernetes_version = var.kubernetes_version # default: latest

  regional = var.regional # default: true
  region   = var.region
  # Deploy to all zones within a region for maximum availability
  zones    = data.google_compute_zones.available.names

  deletion_protection = var.deletion_protection

  enable_vertical_pod_autoscaling = var.enable_vertical_pod_autoscaling # default: false
  horizontal_pod_autoscaling      = var.horizontal_pod_autoscaling # default: true

  http_load_balancing = var.http_load_balancing # default: true

  authenticator_security_group = var.authenticator_security_group

  # default: DATAPATH_PROVIDER_UNSPECIFIED
  # which enables the IPTables-based kube-proxy implementation
  # Consider ADVANCED_DATAPATH (eBPF implementation) for larger clusters
  datapath_provider = var.datapath_provider

  # default: 05:00
  # RFC3339 format includes an offset from UTC
  maintenance_start_time = var.maintenance_start_time
  maintenance_end_time   = var.maintenance_end_time
  # default: ""
  # RFC5545 format, i.e. 'FREQ=WEEKLY;INTERVAL=2;BYDAY=SA'
  maintenance_recurrence = var.maintenance_recurrence
  maintenance_exclusions = var.maintenance_exclusions

  # kernel parameters that can be used to control various aspects of the Linux
  # operating system, such as network settings, memory management, and process
  # scheduling.
  node_pools_linux_node_configs_sysctls = var.node_pools_linux_node_configs_sysctls
  
  node_pools_oauth_scopes = var.node_pools_oauth_scopes

  # default: false
  enable_cost_allocation = var.enable_cost_allocation
  

  
  network_policy             = var.network_policy
  
  filestore_csi_driver       = var.filestore_csi_driver

  node_pools = var.node_pools
  
  node_pools_labels   = var.node_pools_labels
  node_pools_metadata = var.node_pools_metadata
  node_pools_taints   = var.node_pools_taints
  node_pools_tags     = var.node_pools_tags
}