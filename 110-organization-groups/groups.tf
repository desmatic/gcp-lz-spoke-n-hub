resource "google_project_service" "identity-groups-service-cloudidentity" {
  project = var.pipeline_project_id
  service = "cloudidentity.googleapis.com"

  disable_on_destroy = false

  timeouts {
    create = "30m"
    update = "40m"
  }
}

resource "google_project_service" "identity-groups-service-cloudresourcemanager" {
  project = var.pipeline_project_id
  service = "cloudresourcemanager.googleapis.com"

  disable_on_destroy = false

  timeouts {
    create = "30m"
    update = "40m"
  }
}

module "group-sre" {
  source  = "terraform-google-modules/group/google"

  id           = "gcp-sre@${var.org_domain}"
  display_name = "gcp-sre"
  description  = "SRE group for google cloud identity"
  domain       = var.org_domain

  depends_on = [
    google_project_service.identity-groups-service-cloudidentity,
    google_project_service.identity-groups-service-cloudresourcemanager,
  ]
}
