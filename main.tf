provider "google" {
  credentials = "devops-key.json"
  project = var.project
  region = var.region
}

resource "google_compute_network" "vpc-devops" {
  name = var.network
  auto_create_subnetworks = "true"
  routing_mode = "REGIONAL"
}
resource "google_compute_instance" "vm" {
  name = var.instance_name
  machine_type = var.machine_type
  zone = var.zone
  
   boot_disk {
     initialize_params {
	   image = "debian-cloud/debian-9"
	 }
	}
   network_interface {
     network = google_compute_network.vpc-devops.name
     access_config {
	 }
	}	
}