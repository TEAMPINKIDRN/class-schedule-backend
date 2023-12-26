terraform {
  backend "gcs" {
    project  = "schedule-405513"
    location = "us-east1"
    bucket   = "pink-team-gcs-bucket"
    prefix   = "prod/instances/terraform.tfstate"
  }
}