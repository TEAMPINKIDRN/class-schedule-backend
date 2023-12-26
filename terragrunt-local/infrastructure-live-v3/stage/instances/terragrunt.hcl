terraform {
  source = "../../../infrastructure-modules/instances"
}
include "root" {
  path = find_in_parent_folders()
}

inputs = {
  env                                 = "stage"
  region                              = "us-west-1"
  zone                                = "us-west1-a"
  mongo_machine_type                  = "n2-standard-2"
  mongo_image                         = "debian-cloud/debian-11"
  mongo_boot_disk_size_gb             =  10

  postgres_machine_type               = "n2-standard-2"
  postgres_image                      = "debian-cloud/debian-11"
  postgres_boot_disk_size_gb          =  15    
}