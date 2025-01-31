output "app_dev_roles" {
  description = "List of roles granted to application developers"
  value = [
    "roles/viewer",
    "roles/run.developer",
    "roles/cloudfunctions.developer",
    "roles/cloudbuild.builds.editor",
    "roles/aiplatform.user"
  ]
}

output "data_scientist_roles" {
  description = "List of roles granted to data scientists"
  value = [
    "roles/viewer",
    "roles/aiplatform.admin",
    "roles/notebooks.admin",
    "roles/storage.objectViewer",
    "roles/storage.objectCreator",
    "roles/bigquery.dataViewer",
    "roles/bigquery.user"
  ]
} 