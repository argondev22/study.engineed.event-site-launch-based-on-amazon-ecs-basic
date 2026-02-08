variable "pipeline_name" {
  description = "Name of the CodePipeline"
  type        = string
}

variable "codecommit_repository_name" {
  description = "CodeCommit repository name"
  type        = string
}

variable "codecommit_repository_arn" {
  description = "CodeCommit repository ARN"
  type        = string
}

variable "branch_name" {
  description = "Branch name to trigger pipeline"
  type        = string
  default     = "main"
}

variable "codebuild_project_name" {
  description = "CodeBuild project name"
  type        = string
}

variable "codebuild_project_arn" {
  description = "CodeBuild project ARN"
  type        = string
}

variable "ecs_cluster_name" {
  description = "ECS cluster name"
  type        = string
}

variable "ecs_service_name" {
  description = "ECS service name"
  type        = string
}

variable "ecs_task_execution_role_arn" {
  description = "ECS task execution role ARN"
  type        = string
}

variable "artifact_bucket_name" {
  description = "S3 bucket name for artifacts"
  type        = string
}

variable "artifact_bucket_arn" {
  description = "S3 bucket ARN for artifacts"
  type        = string
}

variable "ecs_cluster_arn" {
  description = "ECS cluster ARN"
  type        = string
}

variable "ecs_service_arn" {
  description = "ECS service ARN"
  type        = string
}

