terraform {
  source = "../../../infrastructure-modules/gcp-clusters"
}
include "root" {
  path = find_in_parent_folders()
}

inputs = {
  env                           = "prod"
  region                        = "us-east4"
  #kubernetes
  cluster_name                  = "pink-team-prod4"
  zone                          = "us-east4-a"
  networking_mode               = "VPC_NATIVE"



  #node-pools 
  kubernetes_cluster_id         = "google_container_cluster.pink-team-prod1.id"
  node_pool_node_count          = 3
  node_config_disk_size_gb      = 30 
}