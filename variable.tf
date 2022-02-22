variable "project_id" {
  type        = string
  description = "Id of the project all resources go under"
}

variable "region" {
  type        = string
  description = "GCP region for the resources"
  default     = "us-central1"
}
variable "zones" {
  type        = list(string)
  description = "GCP zones for the resources"
  default     = ["us-central1-a", "us-central1-b", "us-central1-c"]
}

// variable "berglas_bucket" {
//   type        = string
//   description = "The name of berglas bucket."
// }
// variable "berglas_fn_region" {
//   type        = string
//   description = "The region to host the berglas bucket in."
// }

variable "gke_cluster_name" {
  type = string
  default = "demo-gke"
}

variable "env" {
type =  string  
default = "dev"
}

variable "network_name" {
  type        = string
  default     = "demo-nw"
  description = "VPC Network Name"
}

variable "subnets" {
  type = any
  default = [
    {
      subnet_name           = "infra-demo-network"
      subnet_ip             = "10.10.0.0/24"
      subnet_region         = "us-central1"
      subnet_private_access = "true"
    },
    {
      subnet_name           = "kube"
      subnet_ip             = "10.20.0.0/24"
      subnet_region         = "us-central1"
      subnet_private_access = "true"
    },

  ]
  description = "VPC subnets for GKE cluster"
}

variable "secondary_ranges" {
  type = any
  default = {
    # v--- This is the subnet name associated to alias ranges
    kube = [
      {
        range_name    = "kube-pods"
        ip_cidr_range = "10.0.0.0/18"
      },
      {
        range_name    = "kube-svcs"
        ip_cidr_range = "10.40.0.0/24"
      },
    ]
  }
  description = "k8s POD and SVC IP Ranges"
}

variable "create_serverless_vpc_conn" {
  description = "To create Serverless VPC Access Connector or not"
  type        = bool
  default     = false
}

variable "serverless_vpc_conn_name" {
  type        = string
  description = "The name for Serverless VPC Access Connector."
  default = ""
}

variable "serverless_vpc_conn_cidr" {
  type        = string
  description = "The CIDR range for Serverless VPC Access Connector. /28 recommended"
  default = "10.1.0.0/28"
}

variable "machine_type" {
  type        = string
  default     = "n1-standard-1"
  description = "VM machine type for GKE nodes"
}
variable "machine_type_ai" {
  type        = string
  default     = "n1-standard-1"
  description = "VM machine type for GKE nodes"
}

variable "k8s_version" {
  type        = string
  default     = "1.19.9-gke.1900"
  description = "GKE version"
}

variable "gke_master_cidr" {
  type        = string
  default     = "192.168.15.224/28"
  description = "IP Range for GKE Master Nodes"
}

variable "disk_size_gb" {
  default = 10
}

variable "autoscaling" {
  type    = bool
  default = true
}
variable "auto_repair" {
  type    = bool
  default = true
}
variable "auto_upgrade" {
  type    = bool
  default = true
}
variable "initial_node_count" {
  type    = string
  default = "1"
}
variable "min_count" {
  type    = string
  default = "1"
}
variable "max_count" {
  type    = string
  default = "1"
}
variable "gcp_sa_name" {
  default = "gke-nodes"
}

#variable "gke_key_ring" {
 # type = string
#  default = "test"
#}
#variable "gke_enc_key" {
 # type = string
 # default = "test"
#}




