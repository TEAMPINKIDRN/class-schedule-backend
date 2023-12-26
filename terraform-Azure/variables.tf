variable "agent_count" {
  default = 2
}

variable "aks_service_principal_app_id" {
  default = ""
}

variable "aks_service_principal_client_secret" {
  default = ""
}

variable "admin_username" {
  default = "test"
}

variable "cluster_name" {
  default = "schedule"
}

variable "dns_prefix" {
  default = "schedule"
}

variable "resource_group_location" {
  default     = "East Asia"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  default     = "schedule-terraform-kubernetes"
  description = "Resource group name that is unique in your Azure subscription."
}


