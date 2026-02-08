variable "bucket_name" {
  description = "Name of the S3 bucket (must be globally unique)"
  type        = string
}

variable "enable_lifecycle_policy" {
  description = "Enable lifecycle policy for automatic cleanup"
  type        = bool
  default     = false
}

variable "lifecycle_expiration_days" {
  description = "Number of days before objects expire"
  type        = number
  default     = 30
}

