variable "project" {
    description = "Please choose gcp project to deploy"
    type = string
    default = "schedule-405513"
}

variable "region" {
    description = "Please enter gcp region to deploy"
    type = string
    default = "us-central1"
}

variable "zone" {
    description = "Please enter gcp zone to deploy"
    type = string
    default = "us-central1-b"
}

variable "mongo_boot_disk_size_gb" {
  description = "Boot disk size for instance"
  type        = number
}

variable "postgres_boot_disk_size_gb" {
  description = "Boot disk size for instance"
  type        = number
}

variable "mongo_machine_type" {
  description = "Type of the instance"
  type        = string
}

variable "postgres_machine_type" {
  description = "Type of the instance"
  type        = string
}

variable "mongo_image" {
  description = "Image for instance"
  type        = string
}

variable "postgres_image" {
  description = "Image for instance"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}