module "vpc" {
  source = "./modules/vpc"

  vpc_name           = "${var.project}-vpc"
  availability_zones = ["${var.aws_region}a", "${var.aws_region}c"]
}
