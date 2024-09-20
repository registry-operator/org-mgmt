terraform {
  backend "pg" {
    schema_name = "tofu_remote_state_registry_operator"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.2.1"
    }
  }
}

provider "github" {
  owner = "registry-operator"
}
