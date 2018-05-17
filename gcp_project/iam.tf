resource "google_project_iam_member" "owners" {
  project = "${google_project.project.project_id}"
	role = "roles/owner"
	count = "${length(var.owners)}"
	member = "user:${element(var.owners, count.index)}"
}

resource "google_project_iam_member" "editors" {
  project = "${google_project.project.project_id}"
	role = "roles/editor"
	count = "${length(var.editors)}"
	member = "user:${element(var.editors, count.index)}"
}

resource "google_project_iam_member" "viewers" {
  project = "${google_project.project.project_id}"
	role = "roles/viewer"
	member = "domain:noderabbit.com"
}
