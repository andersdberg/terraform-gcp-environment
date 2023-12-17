# GCP Notes

## [Landing Zone Security](https://cloud.google.com/architecture/landing-zones/decide-security)

### Use Short-Lived Service Account Credentials

[Create short-lived credentials for a service-account](https://cloud.google.com/iam/docs/create-short-lived-credentials-direct)

### Mitigate Data Exfiltration Through Google APIs

[Enable VPC Service Controls](https://cloud.google.com/architecture/landing-zones/decide-security#option-2-configure-vpc-service-controls-for-a-subset-of-your-environment)

### Monitor for Insecure Configurations and Threats
### Centrally Aggregate Necessary Logs
### Meet Compliance Requirements for Encryption at Rest
### Meet Compliance Requirements for Encryption in Transit

## [Private Clusters in GKE](https://cloud.google.com/kubernetes-engine/docs/concepts/private-cluster-concept)

A private cluster is a type of VPC-native cluster that only depends on internal
IP addresses. Nodes, Pods, and Services in a private cluster require unique
subnet IP address ranges.

You can create and configure private clusters in Standard or Autopilot.

If you want to provide outbound internet access for certain private nodes, you can use Cloud NAT.

Private clusters use nodes that do not have external IP addresses.

Unlike a public cluster, a private cluster has both a control plane private
endpoint and a control plane public endpoint. You must specify a unique /28 IP
address range for the control plane's private endpoint, and you can choose to
disable the control plane's public endpoint.

Even though the nodes use internal IP addresses, external clients can connect to
Services in your cluster.

An external client with a source IP address on the internet can connect to an
external Service of type LoadBalancer if you omit spec.loadBalancerSourceRanges
from the Service manifest. 

You can create a Service of type NodePort or ClusterIP and expose the Service to
external clients using an external Ingress. 



## Terraform Provider

### Credentials

#### Running Terraform on Local Machine
Authenticate using User [Application Default Credentials
("ADCs")](https://cloud.google.com/sdk/gcloud/reference/auth/application-default)
as a primary authentication method. The gcloud auth application-default command
group allows you to manage active credentials on your machine that are used for
local application development. These credentials are only used by Google client
libraries in your own application and will be used by any library that requests
Application Default Credentials (ADC) automatically.


```shell
# Saves credentials to ~/.config/gcloud/application_default_credentials.json
gcloud auth application-default login
```

```shell
SA_NAME="terraform"
PROJECT_ID="my-project"
gcloud iam service-accounts keys create "~/.config/gcloud/${SA_NAME}.json" \
    --iam-account="${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com"
```

## GCP VPCs and Subnets

- VPCs do not have CIDRs, unlike AWS VPCs. Instead, VPCs are a collection of
  subnets which have CIDRs that do not need to be contiguous.

## GCP Regions

Review [GCP regions and resource
availability](https://cloud.google.com/about/locations) per region to determine
which regions are best suited for ones needs.