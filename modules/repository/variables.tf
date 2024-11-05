variable "name" {
  description = "Name of the repository"
  type        = string
}

variable "description" {
  description = "Description of the repository"
  type        = string
  default     = ""
}

variable "homepage_url" {
  description = "URL of the repository's homepage, if any"
  type        = string
  default     = ""
}

variable "archived" {
  description = "Whether the repository should be archived (true) or active (false)"
  type        = bool
}

variable "is_public" {
  description = "Whether the repository is public (true) or private (false)"
  type        = bool
  default     = false
}

variable "enable_pages" {
  description = "Enable GitHub Pages for the repository (true to enable, false to disable)"
  type        = bool
  default     = false
}

variable "required_status_checks" {
  description = "List of required status checks for pull request merges"
  type        = list(string)
  default = [
    "DCO",
    "pr-title",
  ]
}

variable "topics" {
  description = "Topics associated with the repository for discoverability"
  type        = list(string)
  default = [
    "kubernetes",
    "hacktoberfest",
    "oci-registry",
    "distribution",
    "cncf",
  ]
}

variable "milestones" {
  description = ""
  type = list(object({
    name   = string
    closed = optional(bool, false)
  }))
  default = []
}

variable "labels" {
  description = "List of labels that are assigned to the repository for categorizing issues and pull requests"
  type = list(object({
    name        = string
    color       = string
    description = string
  }))
  default = [
    { name = "area/dependency", color = "0052cc", description = "Issues or PRs related to dependency changes." },
    { name = "do-not-merge", color = "e11d21", description = "Indicates that a PR should not merge." },
    { name = "kind/bug", color = "e11d21", description = "Categorizes issue or PR as related to a bug." },
    { name = "kind/security", color = "e11d21", description = "Categorizes issue or PR as related to a security." },
    { name = "kind/documentation", color = "c7def8", description = "Categorizes issue or PR as related to documentation." },
    { name = "kind/feature", color = "c7def8", description = "Categorizes issue or PR as related to a new feature." },
    { name = "kind/support", color = "c7def8", description = "Categorizes issue or PR as support-related." },
    { name = "good first issue", color = "7057ff", description = "Denotes an issue ready for a new contributor, according to the \"help wanted\" guidelines." },
    { name = "help wanted", color = "006b75", description = "Denotes an issue that needs help from a contributor. Must meet \"help wanted\" guidelines." },
  ]
}

variable "secrets" {
  description = "List of secrets with Bitwarden secret IDs and names for GitHub Actions secrets"
  type = list(object({
    secret_id = string
    name      = string
  }))
  default = []
}
