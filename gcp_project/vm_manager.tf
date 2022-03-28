# these services are required for VM Manager, which we want to
# enable on all projects.

resource "google_project_service" "compute_service" {
  project                    = var.project_id
  service                    = "compute.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_project_service" "containeranalysis_service" {
  project                    = var.project_id
  service                    = "containeranalysis.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_project_service" "osconfig_service" {
  project                    = var.project_id
  service                    = "osconfig.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_project_service" "oslogin_service" {
  project                    = var.project_id
  service                    = "oslogin.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

# and we need to set some project metadata to actually enable it

resource "google_compute_project_metadata_item" "guestattributes" {
  project = var.project_id
  key     = "enable-guest-attributes"
  value   = "TRUE"
}

resource "google_compute_project_metadata_item" "osconfig" {
  project = var.project_id
  key     = "enable-osconfig"
  value   = "TRUE"
}
