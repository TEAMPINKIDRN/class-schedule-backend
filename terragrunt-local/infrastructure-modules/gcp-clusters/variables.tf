variable "project" {
    description = "Please choose gcp project to deploy"
    type = string
    default = "schedule-405513"
}

variable "region" {
    description = "Please enter gcp region to deploy"
    type = string
}

variable "zone" {
    description = "Please enter gcp zone to deploy"
    type = string
}

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
}

variable "node_pool_node_count" {
  description = "Number of nodes in the Kubernetes node pool"
  type        = number
}

variable "node_config_disk_size_gb" {
  description = "Disk size for each node in the Kubernetes node pool"
  type        = number
}

variable "kubernetes_cluster_id" {
  description = "ID of the Kubernetes cluster"
  type        = string
}

variable "networking_mode" {
  description = "Networking mode for the cluster"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}
