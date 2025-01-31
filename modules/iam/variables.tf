variable "project1_id" {
  description = "The ID of the first project (serverless development)"
  type        = string
}

variable "project2_id" {
  description = "The ID of the second project (data science)"
  type        = string
}

variable "app_dev_group" {
  description = "The email address of the group containing serverless application developers"
  type        = string
}

variable "data_science_group" {
  description = "The email address of the group containing data scientists"
  type        = string
} 