variable "project_name" {
  description = "Name of the CodeBuild project"
  type        = string
}

variable "ecr_repository_url" {
  description = "ECR repository URL"
  type        = string
}

variable "ecr_repository_arn" {
  description = "ECR repository arn"
  type        = string
}

variable "image_repo_name" {
  description = "Docker image repository name"
  type        = string
}

variable "image_tag" {
  description = "Docker image tag"
  type        = string
  default     = "latest"
}

variable "container_name" {
  description = "Container name for ECS task definition"
  type        = string
}

variable "artifact_bucket_arn" {
  description = "S3 bucket ARN for artifacts"
  type        = string
}

variable "compute_type" {
  description = "CodeBuild compute type"
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}

variable "build_image" {
  description = "Docker image for build environment"
  type        = string
  default     = "aws/codebuild/standard:7.0"
}

variable "buildspec_path" {
  description = "Path to buildspec file"
  type        = string
  default     = "buildspec.yml"
}
