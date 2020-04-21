resource "google_compute_project_metadata_item" "ssh-keys" {
  count   = var.os_login ? 0 : 1 # only set this if os_login = false
  key     = "ssh-keys"
  value   = var.ssh_keys
  project = var.project_id
}
