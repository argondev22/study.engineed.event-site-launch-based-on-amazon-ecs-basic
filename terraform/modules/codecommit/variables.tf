variable "repository_name" {
  description = "Name of the CodeCommit repository"
  type        = string
}

variable "repository_description" {
  description = "Description of the CodeCommit repository"
  type        = string
  default     = ""
}

variable "default_branch" {
  description = "Default branch name"
  type        = string
  default     = "main"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
