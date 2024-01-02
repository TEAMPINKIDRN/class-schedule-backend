resource "google_compute_instance" "mongo" {
  name         = "mongo"
  machine_type = var.mongo_machine_type
  zone         =  var.zone

  boot_disk {
    initialize_params {
      image = var.mongo_image
      size  =  var.mongo_boot_disk_size_gb
    }
  }

  network_interface {
    network = "default"

  }
  tags =  [var.env]
}