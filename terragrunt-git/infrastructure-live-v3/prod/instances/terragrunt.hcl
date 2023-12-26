terraform {
  source = "git@github.com:IaKoval/terraform-modules.git//modules/instances"
}
include "root" {
  path = find_in_parent_folders()
}

inputs = {
  env                                 = "prod"
  region                              = "us-east4"
  zone                                = "us-east4-a"
  mongo_machine_type                  = "n2-standard-2"
  mongo_image                         = "debian-cloud/debian-11"
  mongo_boot_disk_size_gb             =  15

  postgres_machine_type               = "n2-standard-2"
  postgres_image                      = "debian-cloud/debian-11"
  postgres_boot_disk_size_gb          =  20 
}