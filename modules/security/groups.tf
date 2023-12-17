resource "google_service_account" "terraform_account" {
  account_id   = "terraform-account"
  display_name = "Terraform Account"
}

# Example of assigning a role to the service account (adjust the role as necessary)
resource "google_project_iam_member" "terraform_iam" {
  project = var.project_id
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.terraform_account.email}"
}

# Output the email of the created service account
output "service_account_email" {
  value = google_service_account.terraform_account.email
}
