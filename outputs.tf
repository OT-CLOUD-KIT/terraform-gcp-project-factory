
output "project_id" {
  description = "ID of the created GCP project."
  value       = module.project_factory.project_id
}

output "project_name" {
  description = "Display name of the created GCP project."
  value       = module.project_factory.project_name
}

output "project_number" {
  description = "Numeric identifier of the created GCP project."
  value       = module.project_factory.project_number
}

output "enabled_apis" {
  description = "APIs enabled by the project factory."
  value       = module.project_factory.enabled_apis
}
