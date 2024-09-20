resource "github_repository" "repo" {
  name         = var.name
  description  = var.description
  visibility   = var.visibility
  archived     = var.archived
  topics       = var.topics
  homepage_url = var.homepage_url

  archive_on_destroy = true
  has_discussions    = false
  has_issues         = true
  has_wiki           = false
  has_projects       = true

  allow_auto_merge            = true
  allow_squash_merge          = true
  allow_merge_commit          = false
  allow_rebase_merge          = false
  delete_branch_on_merge      = true
  web_commit_signoff_required = true

  squash_merge_commit_title   = "PR_TITLE"
  squash_merge_commit_message = "PR_BODY"

  dynamic "pages" {
    for_each = var.enable_pages ? [1] : []
    content {
      cname = var.homepage_url
      source {
        branch = "gh-pages"
        path   = "/"
      }
    }
  }
}

resource "github_issue_label" "labels" {
  for_each    = var.archived ? {} : { for label in var.labels : label.name => label }
  repository  = github_repository.repo.name
  name        = each.value.name
  description = each.value.description
  color       = each.value.color
}
