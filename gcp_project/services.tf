resource "google_project_service" "service" {
  count   = length(var.services)
  project = var.project_id
  service = element(var.services, count.index)

  disable_dependent_services = false
  disable_on_destroy         = false
}

# vanta requires a bunch of services to be enabled on every project
# we just enable them all here so we don't have to keep specifying
# them in the parameters every time and so they aren't accidently
# omitted.

resource "google_project_service" "bigtableadmin_service" {
  project                    = var.project_id
  service                    = "bigtableadmin.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_project_service" "bigquery_service" {
  project                    = var.project_id
  service                    = "bigquery.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_project_service" "cloudresourcemanager_service" {
  project                    = var.project_id
  service                    = "cloudresourcemanager.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_project_service" "firestore_service" {
  project                    = var.project_id
  service                    = "firestore.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_project_service" "iam_service" {
  project                    = var.project_id
  service                    = "iam.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_project_service" "monitoring_service" {
  project                    = var.project_id
  service                    = "monitoring.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_project_service" "serviceusage_service" {
  project                    = var.project_id
  service                    = "serviceusage.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_project_service" "spanner_service" {
  project                    = var.project_id
  service                    = "spanner.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_project_service" "sqladmin_service" {
  project                    = var.project_id
  service                    = "sqladmin.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}
