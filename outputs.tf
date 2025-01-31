output "folder_id" {
  description = "The ID of the created folder"
  value       = google_folder.main.name
}

output "project1_id" {
  description = "The ID of the first project"
  value       = google_project.project1.project_id
}

output "project2_id" {
  description = "The ID of the second project"
  value       = google_project.project2.project_id
} 