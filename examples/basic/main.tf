
module "project" {
  source = "../../"

  name              = "example-development"
  project_id        = "example-development-12345"
  random_project_id = false

  org_id          = var.org_id
  billing_account = var.billing_account

  activate_apis = [
    "compute.googleapis.com",
    "iam.googleapis.com"
  ]

  auto_create_network = false

  labels = {
    environment = "development"
    managed_by  = "terraform"
  }

  lien            = true
  deletion_policy = "PREVENT"
}
