# Usage:
# count = length(data.google_compute_zones.by_region.names)
# zone  = data.google_compute_zones.by_region.names[count.index]
data "google_compute_zones" "by_region" {
  region = var.region
}

# Usage:
# count  = length(data.google_compute_regions.region.names)
# region = data.google_compute_regions.region.names[count.index]
data "google_compute_regions" "region" {}
