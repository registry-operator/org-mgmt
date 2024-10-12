module "registry_operator" {
  source = "./modules/repository"

  name         = "registry-operator"
  archived     = false
  is_public    = true
  homepage_url = "registry-operator.dev"
  enable_pages = true

  required_status_checks = [
    "DCO",
    "pr-title",
    "generators",
    "unit",
  ]

  milestones = [
    "v0.1.0",
  ]
}

module "org_mgmt" {
  source = "./modules/repository"

  name     = "org-mgmt"
  archived = false
  topics   = []
}
