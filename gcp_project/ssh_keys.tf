resource "google_compute_project_metadata_item" "ssh-keys" {
  key     = "ssh-keys"
  value   = "${var.ssh_keys}"
  project = "${google_project.project.id}"
}
