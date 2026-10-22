
variable "name" {
  description = "Human-readable name for the GCP project."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "Project name cannot be empty."
  }
}

variable "project_id" {
  description = "Optional globally unique GCP project ID. Required when random_project_id is false."
  type        = string
  default     = null
  nullable    = true
}

variable "random_project_id" {
  description = "Whether the upstream module should generate a unique project ID."
  type        = bool
  default     = false
}

variable "org_id" {
  description = "GCP organization ID. Use this when creating the project directly under an organization."
  type        = string
  default     = null
  nullable    = true
}

variable "folder_id" {
  description = "Existing GCP folder ID under which to create the project."
  type        = string
  default     = null
  nullable    = true
}

variable "billing_account" {
  description = "Billing account ID to associate with the project."
  type        = string
  sensitive   = true

  validation {
    condition     = can(regex("^[A-Fa-f0-9]{6}-[A-Fa-f0-9]{6}-[A-Fa-f0-9]{6}$", var.billing_account))
    error_message = "Provide a billing account ID in the format XXXXXX-XXXXXX-XXXXXX."
  }
}

variable "activate_apis" {
  description = "Google APIs to enable in the new project."
  type        = list(string)
  default = [
    "compute.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com"
  ]
}

variable "auto_create_network" {
  description = "Whether to create the default VPC network. Disabled by default."
  type        = bool
  default     = false
}

variable "labels" {
  description = "Labels to apply to the project."
  type        = map(string)
  default     = {}
}

variable "lien" {
  description = "Whether to create a project lien to help prevent accidental deletion."
  type        = bool
  default     = true
}

variable "deletion_policy" {
  description = "Upstream project deletion policy. Verify allowed values in the pinned module version."
  type        = string
  default     = "PREVENT"
}
