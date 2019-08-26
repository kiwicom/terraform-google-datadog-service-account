resource "google_service_account" "dd_integration" {
  account_id   = "datadog"
  display_name = "Datadog Integration"
}

resource "google_service_account_key" "dd_integration" {
  service_account_id = google_service_account.dd_integration.id
}

resource "google_project_iam_member" "dd_integration_compute_viewer" {
  role   = "roles/compute.viewer"
  member = "serviceAccount:${google_service_account.dd_integration.email}"
}

resource "google_project_iam_member" "dd_integration_monitoring_viewer" {
  role   = "roles/monitoring.viewer"
  member = "serviceAccount:${google_service_account.dd_integration.email}"
}
