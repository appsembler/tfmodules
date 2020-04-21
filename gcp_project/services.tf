resource "google_project_service" "service" {
  count   = "${length(var.services)}"
  project = "${var.project_id}"
  service = "${element(var.services, count.index)}"

  disable_dependent_services = false
  disable_on_destroy         = false
}
