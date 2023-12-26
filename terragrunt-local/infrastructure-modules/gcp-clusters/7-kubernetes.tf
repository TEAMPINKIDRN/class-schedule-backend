resource "google_container_cluster" "pink-team-prod1" {
  name                     = var.cluster_name
  location                 = var.zone
  remove_default_node_pool = true
  initial_node_count       = 1
  networking_mode          = var.networking_mode
  
}




