provider "google" {
  project = var.project
  region  = var.region
}
resource "google_compute_instance" "default" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = null
  description  = var.description

  
  metadata_startup_script="sudo apt update && sudo apt install apache2"

  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}