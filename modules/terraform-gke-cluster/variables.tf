variable "entity" {
  type = string
}

variable "project_id" {
  description = "The ID of the project where this VPC will be created"
  type        = string
}

variable "region" {
  type    = string
  default = "us-west1"
}

variable "network_name" {
  description = "The name of the network being created"
  type        = string
  default     = ""
}

variable "description" {
  description = "An optional description of this resource. The resource must be recreated to modify this field."
  type        = string
  default     = ""
}

variable "subnets" {
  description = "The list of subnets being created"
  type        = list(object({
    subnet_name                      = string
    subnet_ip                        = string
    subnet_region                    = string
    subnet_private_access            = optional(string)
    subnet_private_ipv6_access       = optional(string)
    subnet_flow_logs                 = optional(string)
    subnet_flow_logs_interval        = optional(string)
    subnet_flow_logs_sampling        = optional(string)
    subnet_flow_logs_metadata        = optional(string)
    subnet_flow_logs_filter          = optional(string)
    subnet_flow_logs_metadata_fields = optional(list(string))
    description                      = optional(string)
    purpose                          = optional(string)
    role                             = optional(string)
    stack_type                       = optional(string)
    ipv6_access_type                 = optional(string)
  }))
  default = []
}

# Akin to security group ingress rules in AWS
variable "ingress_rules" {
  description = "List of ingress rules. This will be ignored if variable 'rules' is non-empty"
  type        = list(object({
    name                    = string
    description             = optional(string, null)
    disabled                = optional(bool, null)
    priority                = optional(number, null)
    destination_ranges      = optional(list(string), [])
    source_ranges           = optional(list(string), [])
    source_tags             = optional(list(string))
    source_service_accounts = optional(list(string))
    target_tags             = optional(list(string))
    target_service_accounts = optional(list(string))

    allow = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    deny = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    log_config = optional(object({
      metadata = string
    }))
  }))
  default     = []
}

# Akin to security group egress rules in AWS
variable "egress_rules" {
  description = "List of egress rules. This will be ignored if variable 'rules' is non-empty"
  type        = list(object({
    name                    = string
    description             = optional(string, null)
    disabled                = optional(bool, null)
    priority                = optional(number, null)
    destination_ranges      = optional(list(string), [])
    source_ranges           = optional(list(string), [])
    source_tags             = optional(list(string))
    source_service_accounts = optional(list(string))
    target_tags             = optional(list(string))
    target_service_accounts = optional(list(string))

    allow = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    deny = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    log_config = optional(object({
      metadata = string
    }))
  }))
  default     = []
}

# Akin to route tables in AWS
variable "routes" {
  description = "List of routes being created in this VPC"
  type        = list(map(string))
  default     = []
}

variable "secondary_ranges" {
  description = "secondary_ranges"
  type        = map(list(object({ range_name = string, ip_cidr_range = string })))
  default     = {}
}

variable "routing_mode" {
  type        = string
  default     = "GLOBAL"
  description = "The network routing mode (default 'GLOBAL')"
}

# Akin to AWS Transit Gateway
variable "shared_vpc_host" {
  type        = bool
  description = "Makes this project a Shared VPC host if 'true' (default 'false')"
  default     = false
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  default     = false
}

# Remove default internet gateway routes within the VPC
variable "delete_default_internet_gateway_routes" {
  type        = bool
  description = "If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted"
  default     = false
}

# Maximum Transmission Unit (MTU) for the VPC, which determines the largest
# packet size allowed
variable "mtu" {
  type        = number
  description = "The network MTU (If set to 0, meaning MTU is unset - defaults to '1460'). Recommended values: 1460 (default for historic reasons), 1500 (Internet default), or 8896 (for Jumbo packets). Allowed are all values in the range 1300 to 8896, inclusively."
  default     = 0
}

variable "enable_ipv6_ula" {
  type        = bool
  description = "Enabled IPv6 ULA, this is a permenant change and cannot be undone! (default 'false')"
  default     = false
}

variable "internal_ipv6_range" {
  type        = string
  default     = null
  description = "When enabling IPv6 ULA, optionally, specify a /48 from fd20::/20 (default null)"
}

variable "network_firewall_policy_enforcement_order" {
  type        = string
  default     = "AFTER_CLASSIC_FIREWALL"
  description = "Set the order that Firewall Rules and Firewall Policies are evaluated. Valid values are `BEFORE_CLASSIC_FIREWALL` and `AFTER_CLASSIC_FIREWALL`. (default null or equivalent to `AFTER_CLASSIC_FIREWALL`)"
}

variable "gke_node_pools" {
  type    = list(map(any))
}

variable "gke_subnetwork" {
  type = string
  default = ""
}

variable "gke_ip_range_pods" {
  type        = string
  description = "The _name_ of the secondary subnet ip range to use for pods"
  default = ""
}

variable "gke_ip_range_services" {
  type        = string
  description = "The _name_ of the secondary subnet range to use for services"
  default = ""
}

variable "gke_node_pools_labels" {
  type        = map(map(string))
  description = "Map of maps containing node labels by node-pool name"
  default = {}
}

variable "gke_node_pools_resource_labels" {
  type        = map(map(string))
  description = "Map of maps containing resource labels by node-pool name"
  default = {}
}

variable "gke_node_pools_metadata" {
  type        = map(map(string))
  description = "Map of maps containing node metadata by node-pool name"
  default = {}
}

variable "gke_node_pools_taints" {
  type        = map(list(object({ key = string, value = string, effect = string })))
  description = "Map of lists containing node taints by node-pool name"
  default = {}
}

variable "gke_deletion_protection" {
  type        = bool
  description = "Whether or not to allow Terraform to destroy the cluster."
  default     = true
}
