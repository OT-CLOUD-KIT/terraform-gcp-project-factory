
module "project_factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "18.4.0"

  name              = var.name
  project_id        = var.project_id
  random_project_id = var.random_project_id

  org_id    = var.org_id
  folder_id = var.folder_id

  billing_account = var.billing_account

  activate_apis       = var.activate_apis
  auto_create_network = var.auto_create_network
  labels              = var.labels
  lien                = var.lien
  deletion_policy     = var.deletion_policy
}
