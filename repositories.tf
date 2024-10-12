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

  name      = "org-mgmt"
  archived  = false
  is_public = true
  topics = [
    "opentofu",
    "registry-operator",
  ]

  labels = [
    { name = "area/dependency", color = "0052cc", description = "Issues or PRs related to dependency changes." },
    { name = "do-not-merge", color = "e11d21", description = "Indicates that a PR should not merge." },
    { name = "kind/security", color = "e11d21", description = "Categorizes issue or PR as related to a security." },
    { name = "kind/membership", color = "c7def8", description = "Categorizes issue or PR as related to a new feature." },
  ]

  required_status_checks = [
    "DCO",
    "pr-title",
    "tofu-fmt",
    "tflint",
    "shell-linter",
  ]
}
