ip_cidr_range              = "10.1.2.0/24"
  10.1.2.0 - 10.1.2.255

ip_cidr_range              = "10.1.3.0/24"
  10.1.3.0 - 10.1.3.255

ip_cidr_range              = "10.1.0.0/24"
  10.1.0.0 - 10.1.0.255

ip_cidr_range              = "10.1.1.0/24"
  10.1.1.0 - 10.1.1.255	


cidrsubnet(prefix, newbits, netnum)

prefix must be given in CIDR notation, as defined in RFC 4632 section 3.1.

newbits is the number of additional bits with which to extend the prefix. For
example, if given a prefix ending in /16 and a newbits value of 4, the resulting
subnet address will have length /20.


netnum is a whole number that can be represented as a binary integer with no
more than newbits binary digits, which will be used to populate the additional
bits added to the prefix.

## Subnets
Subnets are created using the `subnets` variable. The following parameters are
available for each subnet:

Reference: [terraform-google-network/subnets](https://github.com/terraform-google-modules/terraform-google-network/blob/master/modules/subnets/README.md#subnet-inputs)

```hcl
# Short example (required inputs)
subnets = [
  {
    # REQUIRED
    # The name of the subnet being created
    subnet_name = ""

    # REQUIRED
    # The IP and CIDR range of the subnet being created
    subnet_ip   = ""

    # REQUIRED
    # The region where the subnet will be created
    subnet_region = var.region
  },
  {
    subnet_name = "public-lb-"
    subnet_ip   = "10.0.0.0/24"
    subnet_region = var.region
  },
  ...
]

# Full example (required & optional inputs)
subnets = [
  {
    # REQUIRED
    # The name of the subnet being created
    subnet_name = ""

    # REQUIRED
    # The IP and CIDR range of the subnet being created
    subnet_ip = ""

    # REQUIRED
    # The region (availability zone) where the subnet will be created
    subnet_region = var.region

    # Akin to VPC endpoints in AWS VPC
    # Whether this subnet will have private Google access enabled
    # Grants the ability for VMs within a subnet to access Google APIs and
    # services without routing through the public internet
    subnet_private_access = "false"

    # The private IPv6 google access type for the VMs in this subnet
    subnet_private_ipv6_access = ""

    # Whether the subnet will record and send flow log data to logging
    subnet_flow_logs= "false"

    # If subnet_flow_logs is true, sets the aggregation interval for collecting
    # flow logs
    subnet_flow_logs_interval = "INTERVAL_5_SEC"

    # If subnet_flow_logs is true, set the sampling rate of VPC flow logs within
    # the subnetwork
    subnet_flow_logs_sampling = "0.5"

    # If subnet_flow_logs is true, configures whether metadata fields should be
    # added to the reported VPC flow logs
    subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"

    # Export filter defining which VPC flow logs should be logged, see 
    # https://cloud.google.com/vpc/docs/flow-logs#filtering for formatting
    # details
    subnet_flow_logs_filter = "true"

    # List of metadata fields that should be added to reported logs. Can only be
    # specified if VPC flow logs for this subnetwork is enabled and "metadata"
    # is set to CUSTOM_METADATA.
    subnet_flow_logs_metadata_fields = ""

    # An optional description of this resource. Provide this property when you
    # create the resource. This field can be set only at resource creation time
    description = ""

    # The purpose of the subnet usage. Whether it is to be used as a regular
    # subnet or for proxy or loadbalacing purposes, see
    # https://cloud.google.com/vpc/docs/subnets#purpose for more details
    purpose = "PRIVATE"

    # The role of the subnet when using it as a proxy or loadbalancer network.
    # Whether it is to be used as the active or as a backup subnet, see
    # https://cloud.google.com/load-balancing/docs/proxy-only-subnets#proxy_only_subnet_create
    # for more details
    role = ""

    # IPV4_ONLY or IPV4_IPV6 for dual-stack networking
    stack_type = ""

    # INTERNAL or EXTERNAL. INTERNAL requires ULA be enabled on the VPC
    ipv6_access_type = ""
  }
]
```