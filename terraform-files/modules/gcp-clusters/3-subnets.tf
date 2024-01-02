# modules/kubernetes_cluster/subnets.tf

resource "google_compute_subnetwork" "private2" {
  name                     = "private2"
  ip_cidr_range            = var.subnet_ip_cidr_range
  region                   = var.region
  network                  = google_compute_network.main2.id
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "k8s-pod-range"
    ip_cidr_range = var.k8s_pod_range_cidr
  }

  secondary_ip_range {
    range_name    = "k8s-service-range"
    ip_cidr_range = var.k8s_service_range_cidr
  }
}
