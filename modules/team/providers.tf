terraform {
  required_providers {
    github = {}
  }
}

provider "github" {
  owner = "registry-operator"
}
