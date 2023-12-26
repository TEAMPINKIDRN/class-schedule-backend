resource "google_compute_instance" "postgres" {
  name         = "postgres"
  machine_type = var.postgres_machine_type
  zone         =  var.zone

  boot_disk {
    initialize_params {
      image = var.postgres_image
      size  =  var.postgres_boot_disk_size_gb
    }
  }

  network_interface {
    network = "default"

  }
  tags = [var.env]
}