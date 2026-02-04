resource "aws_codecommit_repository" "main" {
  repository_name = var.repository_name
  description     = var.repository_discription
  default_branch = var.default_branch

  tags = var.tags
}
