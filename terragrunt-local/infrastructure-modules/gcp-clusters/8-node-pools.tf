
resource "google_container_node_pool" "general" {
  name       = "general"
  location   = google_container_cluster.pink-team-prod1.location
  cluster    = var.cluster_name
  node_count = var.node_pool_node_count

  management {
    auto_repair  = true
    auto_upgrade = true
  

  }

  node_config {
    preemptible  = false
    machine_type = ""
    disk_size_gb = var.node_config_disk_size_gb


    labels = {
      role = "general"
    }


  }
}


