resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "icmp"
  }
  
  deny {
   protocol = "ssh"
   ports    = ["22"]
  }

  deny {
    protocol = "tcp"
    ports    = ["3389","80","8080"]
  }

  source_tags = ["web"]
}

resource "google_compute_network" "default" {
  name = "test-network"
}
