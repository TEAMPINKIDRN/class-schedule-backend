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

variable "env" {
    default = "dev"
}

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
}

variable "k8s_pod_range_cidr" {
  description = "CIDR range for k8s pod secondary IP range"
  type        = string
}

variable "k8s_service_range_cidr" {
  description = "CIDR range for k8s service secondary IP range"
  type        = string
}

variable "network_name" {
  description = "Name of the main network"
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

variable "cluster_secondary_range_name" {
  description = "Name for the cluster's secondary range"
  type        = string
}

variable "services_secondary_range_name" {
  description = "Name for the services' secondary range"
  type        = string
}

variable "enable_private_nodes" {
  description = "Enable private nodes in the cluster"
  type        = bool
}

variable "enable_private_endpoint" {
  description = "Enable private endpoint for the cluster"
  type        = bool
}

variable "master_ipv4_cidr_block" {
  description = "CIDR block for the master's private IP"
  type        = string
}

variable "networking_mode" {
  description = "Networking mode for the cluster"
  type        = string
}

variable "subnet_ip_cidr_range" {
  description = "CIDR range for the subnetwork"
  type        = string
}