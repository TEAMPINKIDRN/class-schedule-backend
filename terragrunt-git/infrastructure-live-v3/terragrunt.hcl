remote_state {
  backend = "gcs"

  config = {
    project  = "schedule-405513"
    location = "us-east1"
    bucket   = "pink-team-gcs-bucket"
    prefix   = "${path_relative_to_include()}/terraform.tfstate"

    gcs_bucket_labels = {
      owner = "pinkteam"
      name  = "terraform_state_storage"
    }
  }
}
