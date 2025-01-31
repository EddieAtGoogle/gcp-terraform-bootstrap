variable "org_id" {
  description = "The organization ID"
  type        = string
}

variable "billing_account" {
  description = "The ID of the billing account to associate projects with"
  type        = string
}

variable "folder_name" {
  description = "The name of the folder to create"
  type        = string
}

variable "project_names" {
  description = "Names for the two projects"
  type = object({
    project1 = string
    project2 = string
  })
}

variable "region" {
  description = "Default region for resources"
  type        = string
  default     = "us-central1"
}

variable "app_dev_group" {
  description = "Email address of the Google Group containing application developers"
  type        = string
}

variable "data_science_group" {
  description = "Email address of the Google Group containing data scientists"
  type        = string
} 