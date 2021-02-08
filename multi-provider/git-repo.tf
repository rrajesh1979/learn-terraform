terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "4.4.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = "bd9e36a318c0b33e7c7d98deef09478b6d82659f"
}


resource "github_repository" "terrafom-repo" {
  name        = "terrafom-repo"
  description = "Created by Terraform"

  visibility  = "public"
}