terraform {
  source = "../../../infrastructure-modules/gcp-clusters"
}
include "root" {
  path = find_in_parent_folders()
}

inputs = {
  env                           = "stage"
  region                        = "us-west-1"
  #kubernetes
  cluster_name                  = "pink-team-prod4"
  zone                          = "us-west1-a"
  networking_mode               = "VPC_NATIVE"



  #node-pools 
  kubernetes_cluster_id         = "google_container_cluster.pink-team-prod1.id"
  node_pool_node_count          = 2
  node_config_disk_size_gb      = 20 
}