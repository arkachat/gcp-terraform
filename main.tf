module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "3.3.0"

  project_id   = var.project_id
  network_name = var.network_name

  subnets = var.subnets
  secondary_ranges = var.secondary_ranges
}

output "snet_sec" {
  value = module.vpc.subnets_secondary_ranges
}

# Create Serverless VPC access connection
resource "google_vpc_access_connector" "main" {
  count         = var.create_serverless_vpc_conn ? 1 : 0
  name          = var.serverless_vpc_conn_name
  region        = var.region
  ip_cidr_range = var.serverless_vpc_conn_cidr
  network       = module.vpc.network_name
}

output "vpc_access_connector_main" {
  value = length(google_vpc_access_connector.main) > 0 ? google_vpc_access_connector.main[0].id : "" 

}

