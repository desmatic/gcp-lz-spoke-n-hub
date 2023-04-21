resource "google_project_service" "project-sandbox-vpc-service-dns" {
  project = module.project-sandbox-vpc.project_id
  service = "dns.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }
}

resource "google_dns_managed_zone" "sandbox-vpc" {
  project     = module.project-sandbox-vpc.project_id
  name        = "sandbox-vpc"
  dns_name    = "snd.gcp.${var.org_id}."
  description = "Sandbox private DNS zone"
  labels = {
    foo = "bar"
  }

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = module.sandbox-vpc.network_id
    }
  }

  depends_on = [
    google_project_service.project-sandbox-vpc-service-dns
  ]
}
