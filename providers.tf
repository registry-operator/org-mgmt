terraform {
  required_version = ">= 1.8"

  backend "pg" {
    schema_name = "tofu_remote_state_registry_operator"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.3.0"
    }
  }
}

provider "github" {
  owner = "registry-operator"
  token = var.gh_token
}
