variable "aws_region" {
  description = "AWS region"
  type = string
  default = "ap-northeast-1"
}

variable "aws_assume_role_arn" {
  description = "AWS IAM role to assume"
  type = string
}

variable "project" {
  description = "Project name"
  type = string
}
