resource "google_compute_project_metadata_item" "oslogin" {
  count   = var.os_login ? 1 : 0
  project = var.project_id
  key     = "enable-oslogin"
  value   = "TRUE"
}

