resource "google_project" "project" {
  name            = var.name
  project_id      = var.project_id
  org_id          = var.org_id
  billing_account = var.billing_account
  provider        = google-beta
  labels          = var.labels
}

