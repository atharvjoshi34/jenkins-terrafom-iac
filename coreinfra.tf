#creating a vpc network
resource "google_compute_network" "vpc_network" {
  name  = "jenkins-cicd"
  auto_create_subnetworks = true
}


#creating a firewall rule
resource "google_compute_firewall" "firewall" {
  name    = "jenkins-firewall"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "8080", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  source_tags   = ["jenkins-cicd"]
}


#VM creation
resource "google_compute_instance" "instance" {
  name         = "jenkins-iac-server"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {}
  }

  tags = ["jenkins-cicd", "http-server", "https-server"]

  metadata_startup_script = file("install-jenkins.sh")
}