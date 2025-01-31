# Configure the Google Cloud provider
provider "google" {
  region = var.region
}

provider "google-beta" {
  region = var.region
}

# Create a folder
resource "google_folder" "main" {
  display_name = var.folder_name
  parent       = "organizations/${var.org_id}"
}

# Generate random suffix for project IDs
resource "random_id" "project_suffix" {
  byte_length = 4
}

# Create first project
resource "google_project" "project1" {
  name                = var.project_names.project1
  project_id          = "${var.project_names.project1}-${random_id.project_suffix.hex}"
  folder_id           = google_folder.main.name
  billing_account     = var.billing_account
  auto_create_network = false

  labels = {
    environment = "production"
    managed_by  = "terraform"
  }
}

# Create second project
resource "google_project" "project2" {
  name                = var.project_names.project2
  project_id          = "${var.project_names.project2}-${random_id.project_suffix.hex}"
  folder_id           = google_folder.main.name
  billing_account     = var.billing_account
  auto_create_network = false

  labels = {
    environment = "production"
    managed_by  = "terraform"
  }
}

# Add organizational policies
module "org_policies" {
  source = "./modules/org-policies"

  organization_id = var.org_id

  allowed_shared_vpc_host_projects = [
    "projects/${var.project_names.project1}-${random_id.project_suffix.hex}"
  ]
  allowed_ip_forwarding_projects = [
    "projects/${var.project_names.project1}-${random_id.project_suffix.hex}"
  ]
}

# Configure IAM roles for user groups
module "iam" {
  source = "./modules/iam"

  project1_id         = google_project.project1.project_id
  project2_id         = google_project.project2.project_id
  app_dev_group       = var.app_dev_group
  data_science_group  = var.data_science_group
} 