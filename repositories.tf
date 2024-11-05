locals {
  PAT             = "a288b2ae-a336-4425-9b07-b1f100cd05ec"
  DISCORD_WEBHOOK = "953077e4-dbec-4595-a0d7-b1d400d8adc6"
  PG_CONN_STR     = "b7d22a8b-8185-4d62-8bf6-b1d400b87552"
  CODECOV_TOKEN   = "03cefaa4-0e36-4406-a85b-b203012f7332"
}

module "org_mgmt" {
  source      = "./modules/repository"
  name        = "org-mgmt"
  description = "Management of org via OpenTofu and GitHub Actions"
  archived    = false
  is_public   = true
  topics      = ["opentofu", "registry-operator"]

  labels = [
    { name = "area/dependency", color = "0052cc", description = "Issues or PRs related to dependency changes." },
    { name = "do-not-merge", color = "e11d21", description = "Indicates that a PR should not merge." },
    { name = "kind/membership", color = "c7def8", description = "Categorizes issue or PR as related to a new feature." },
    { name = "kind/security", color = "e11d21", description = "Categorizes issue or PR as related to a security." },
    { name = "kind/support", color = "c7def8", description = "Categorizes issue or PR as support-related." },
  ]

  required_status_checks = [
    "DCO",
    "pr-title",
    "tofu-fmt",
    "tflint",
    "shell-linter",
  ]

  secrets = [
    { name = "PAT", secret_id = local.PAT },
    { name = "PG_CONN_STR", secret_id = local.PG_CONN_STR },
    { name = "DISCORD_WEBHOOK", secret_id = local.DISCORD_WEBHOOK },
  ]
}

module "registry_operator" {
  source       = "./modules/repository"
  name         = "registry-operator"
  description  = "Operator for CNCF Distribution Registry 📦"
  archived     = false
  is_public    = true
  homepage_url = "registry-operator.dev"
  enable_pages = true

  required_status_checks = [
    "DCO",
    "pr-title",
    "generators",
    "unit",
    "e2e",
    "lint",
    "kube-linter",
    "hadolint",
  ]

  milestones = [
    { name = "v0.1.0", closed = true },
    { name = "v0.2.0", },
  ]

  secrets = [
    { name = "PAT", secret_id = local.PAT },
    { name = "CODECOV_TOKEN", secret_id = local.CODECOV_TOKEN },
  ]
}
