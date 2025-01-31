# Project 1 - Serverless Application Development IAM Roles
#
# This set of roles enables application developers to:
# - Deploy and manage Cloud Run services
# - Use Cloud Functions
# - Work with Cloud Build
# - Access necessary Vertex AI features for app integration

# Basic viewer role - provides read-only access to project resources
# Doc: https://cloud.google.com/iam/docs/understanding-roles#basic
resource "google_project_iam_member" "app_dev_viewer" {
  project = var.project1_id
  role    = "roles/viewer"
  member  = "group:${var.app_dev_group}"
}

# Cloud Run developer - allows deploying and managing Cloud Run services
# Provides access to:
# - Deploy and manage services
# - Configure service settings
# - View logs and metrics
# Doc: https://cloud.google.com/run/docs/reference/iam/roles
resource "google_project_iam_member" "app_dev_cloudrun_developer" {
  project = var.project1_id
  role    = "roles/run.developer"
  member  = "group:${var.app_dev_group}"
}

# Cloud Functions developer - enables serverless function management
# Provides access to:
# - Deploy and manage functions
# - View logs and execution results
# - Manage function configurations
# Doc: https://cloud.google.com/functions/docs/reference/iam/roles
resource "google_project_iam_member" "app_dev_functions_developer" {
  project = var.project1_id
  role    = "roles/cloudfunctions.developer"
  member  = "group:${var.app_dev_group}"
}

# Cloud Build editor - enables CI/CD pipeline management
# Provides access to:
# - Create and manage build triggers
# - View build results and logs
# - Submit new builds
# Doc: https://cloud.google.com/build/docs/iam-roles-permissions
resource "google_project_iam_member" "app_dev_cloudbuild_editor" {
  project = var.project1_id
  role    = "roles/cloudbuild.builds.editor"
  member  = "group:${var.app_dev_group}"
}

# Vertex AI user - enables AI model usage in applications
# Provides access to:
# - Use deployed models
# - Make predictions
# - View model metrics
# Doc: https://cloud.google.com/vertex-ai/docs/general/access-control
resource "google_project_iam_member" "app_dev_vertexai_user" {
  project = var.project1_id
  role    = "roles/aiplatform.user"
  member  = "group:${var.app_dev_group}"
}

# Project 2 - Data Science IAM Roles
#
# This set of roles enables data scientists to:
# - Develop and train ML models using Vertex AI
# - Work with notebooks and datasets
# - Manage model deployments
# - Access necessary storage and compute resources

# Basic viewer role - provides read-only access to project resources
# Doc: https://cloud.google.com/iam/docs/understanding-roles#basic
resource "google_project_iam_member" "data_scientist_viewer" {
  project = var.project2_id
  role    = "roles/viewer"
  member  = "group:${var.data_science_group}"
}

# Vertex AI Admin - provides full access to Vertex AI resources
# Enables:
# - Creating and managing datasets
# - Training models
# - Managing endpoints
# - Deploying models
# Doc: https://cloud.google.com/vertex-ai/docs/general/access-control
resource "google_project_iam_member" "data_scientist_vertexai_admin" {
  project = var.project2_id
  role    = "roles/aiplatform.admin"
  member  = "group:${var.data_science_group}"
}

# Notebooks Admin - enables management of Vertex AI Workbench notebooks
# Provides access to:
# - Create and manage notebook instances
# - Configure notebook environments
# - Manage notebook schedules
# Doc: https://cloud.google.com/vertex-ai/docs/workbench/reference/iam-roles
resource "google_project_iam_member" "data_scientist_notebooks_admin" {
  project = var.project2_id
  role    = "roles/notebooks.admin"
  member  = "group:${var.data_science_group}"
}

# Storage Object Viewer - allows reading from Cloud Storage buckets
# Needed for:
# - Accessing training data
# - Reading saved models
# - Accessing other stored resources
# Doc: https://cloud.google.com/storage/docs/access-control/iam-roles
resource "google_project_iam_member" "data_scientist_storage_viewer" {
  project = var.project2_id
  role    = "roles/storage.objectViewer"
  member  = "group:${var.data_science_group}"
}

# Storage Object Creator - allows writing to Cloud Storage buckets
# Needed for:
# - Saving trained models
# - Uploading datasets
# - Storing notebook outputs
# Doc: https://cloud.google.com/storage/docs/access-control/iam-roles
resource "google_project_iam_member" "data_scientist_storage_creator" {
  project = var.project2_id
  role    = "roles/storage.objectCreator"
  member  = "group:${var.data_science_group}"
}

# Bigquery Data Viewer - enables reading from BigQuery datasets
# Needed for:
# - Accessing training data in BigQuery
# - Running queries for data analysis
# - Viewing dataset metadata
# Doc: https://cloud.google.com/bigquery/docs/access-control
resource "google_project_iam_member" "data_scientist_bigquery_viewer" {
  project = var.project2_id
  role    = "roles/bigquery.dataViewer"
  member  = "group:${var.data_science_group}"
}

# Bigquery User - enables running queries and managing jobs
# Provides access to:
# - Run queries
# - Create and manage jobs
# - Save query results
# Doc: https://cloud.google.com/bigquery/docs/access-control
resource "google_project_iam_member" "data_scientist_bigquery_user" {
  project = var.project2_id
  role    = "roles/bigquery.user"
  member  = "group:${var.data_science_group}"
} 