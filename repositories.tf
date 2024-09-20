module "registry_operator" {
  source = "./modules/repository"

  name         = "registry-operator"
  archived     = false
  visibility   = "public"
  homepage_url = "registry-operator.dev"
}

module "org_mgmt" {
  source = "./modules/repository"

  name     = "org-mgmt"
  archived = false
  topics   = []
}
