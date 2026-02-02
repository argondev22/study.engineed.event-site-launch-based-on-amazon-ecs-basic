provider "aws" {
  region = "ap-northeast-1"

  assume_role {
    role_arn = ""
  }

  default_tags {
    tags = {}
  }
}
