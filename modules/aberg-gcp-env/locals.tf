locals {

  #####################################
  ###### Global Configuraiton #########
  #####################################
  entity        = "aberg"
  entity_domain = "initprise.com"

  project_id = "abridge-407504"
  region     = "us-west1"

  #####################################
  ###### Network Configuration ########
  #####################################

  subnet_cidrs = {
    "${local.entity}-${local.region}-gke"      = ["172.16.0.0/20"],
    "${local.entity}-${local.region}-pods"     = ["10.0.0.0/16"],
    "${local.entity}-${local.region}-services" = ["192.168.255.0/24"],
  }

  subnets = flatten([
    for subnet_name, cidrs in local.subnet_cidrs : [
      for i, cidr in cidrs : {
        subnet_name           = subnet_name
        subnet_ip             = cidr
        subnet_region         = local.region
        subnet_private_access = "true"
        subnet_flow_logs      = "false"
        purpose               = "PRIVATE"
      }
    ]
  ])

  #####################################
  #### Kubnernetes Configuration ######
  #####################################

  # Node pools can be created based on:
  # - machine types and sizes
  # - isolating workloads
  # - security
  # - scaling behavior
  # - spot/preemptible nodes
  # - etc.
  gke_node_pools = [
    {
      name            = "${local.entity}-${local.region}-general"
      min_count       = 1
      max_count       = 3
      machine_type    = "e2-medium"
      disk_size_gb    = 10
      auto_upgrade    = true
      strategy        = "BLUE_GREEN"
      max_unavailable = 0
      node_locations  = join(",", data.google_compute_zones.available.names)
      location_policy = "BALANCED"
    },
  ]

  gke_ip_range_pods     = ""
  gke_ip_range_services = ""

  # Common uses include:
  # - scheduling, i.e. pod affinity
  # - monitoring and logging
  gke_node_pools_labels = {
    all = {}

    "${local.entity}-${local.region}-general" = {
      "core.${local.entity_domain}/node-role" = "general"
    }
  }

  # Only schedule pods to nodes that tolerate the taints
  # Note: taints can be 
  gke_node_pools_taints = {
    all = []

    "${local.entity}-${local.region}-general" = []
  }

  gke_node_pools_tags = {
    all = []

    "${local.entity}-${local.region}-general" = [
      "general-node-pool",
    ]
  }
}
