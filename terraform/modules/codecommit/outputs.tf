output "repository_name" {
  description = "CodeCommit repository name"
  value       = aws_codecommit_repository.main.repository_name
}

output "repository_arn" {
  description = "CodeCommit repository ARN"
  value       = aws_codecommit_repository.main.arn
}
