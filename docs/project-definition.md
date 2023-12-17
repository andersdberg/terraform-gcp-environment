# Take-Home Assessment for Senior Platform Engineer

## Objective:

Showcase your proficiency in Terraform and Google Cloud Platform (GCP) by developing a
Terraform module for provisioning a GCP environment, including a Virtual Private Cloud (VPC)
and a Google Kubernetes Engine (GKE) cluster, along with all necessary prerequisites.

## Tasks:

- **Comprehensive Terraform Module Creation for GCP Environment:**
  - Develop a Terraform module that can provision a minimum viable GCP
  environment, including a VPC, subnets, service accounts, and a GKE cluster.
  (Assume the project and the organization level resources are already fulfilled.)
  - Ensure the module allows configurable parameters for the VPC (like CIDR
  blocks), subnets, service accounts, and GKE cluster settings (such as node pool
  configurations and autoscaling).
  - Follow GCP best practices for security and network configurations.
  - Include a README file with detailed instructions on how to use the module,
  covering aspects of VPC, subnets, service accounts, and GKE cluster
  configurations.
- **Module Usage Demonstration:**
  - Use your module to set up a fully functional environment, demonstrating the
  creation of a VPC, subnets, service accounts, and a GKE cluster.
  - Show how the module can be configured for different requirements, such as
  different CIDR blocks for subnets or various node pool configurations for the GKE
  cluster.
  - Document the process, focusing on the flexibility and integration of the module's
  features.
- **Documentation:**
  - Document the steps for using the Terraform module to provision the VPC,
  subnets, service accounts, and GKE cluster.
  - Include any prerequisites and instructions for executing the Terraform scripts.

**Submission Guidelines:**

- Provide your code in a public Git repository.
- All scripts should be well-commented and organized.
- Include a [README.md](http://readme.md/) with comprehensive setup and execution instructions.

**Evaluation Criteria:**

- Code quality and organization.
- Adherence to best practices in Terraform and GCP.
- Clarity and comprehensiveness of documentation.

## Deliverable:
  - Terraform module that provisions an MVP GCP environment
    - VPC
    - Subnets
    - Service Accounts
    - GKE Cluster