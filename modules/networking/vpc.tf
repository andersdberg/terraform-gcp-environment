# Each VPC network is a global entity spanning all GCP regions
# This global VPC network allows VM instances and other resources
# to communicate with each other via internal, private IP Addresses.
module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 8.1"

  project_id = var.project_id

  network_name = var.network_name != "" ? var.network_name : local.network_name
  description  = var.description != "" ? var.description : local.description
  routing_mode = var.routing_mode

  auto_create_subnetworks                = var.auto_create_subnetworks
  delete_default_internet_gateway_routes = var.delete_default_internet_gateway_routes

  # CAUTION: 'enable_ipv6_ula' is a permenant change and cannot be undone
  enable_ipv6_ula = var.enable_ipv6_ula
  # When IPv6 ULA enabled, optionally specify a /48 from fd20::/20
  internal_ipv6_range = var.internal_ipv6_range

  # Allowed values are 1300 to 8896; 0 value defaults to 1460
  mtu = var.mtu

  # Options: 'BEFORE_CLASSIC_FIREWALL' or 'AFTER_CLASSIC_FIREWALL'
  network_firewall_policy_enforcement_order = var.network_firewall_policy_enforcement_order

  subnets = var.subnets

  # List of ingress/egress rules.
  # Ignored if 'rules' is non-empty
  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules

  # Secondary ranges that will be used in some of the subnets
  secondary_ranges = var.secondary_ranges

  routes = var.routes

  shared_vpc_host = var.shared_vpc_host
}