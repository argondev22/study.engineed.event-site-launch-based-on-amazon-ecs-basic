module "vpc" {
  source = "./modules/vpc"

  vpc_name             = "${var.project}-vpc"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.10.0/24", "10.0.11.0/24"]
  private_subnet_cidrs = ["10.0.20.0/24", "10.0.21.0/24"]
  availability_zones   = ["${var.aws_region}a", "${var.aws_region}c"]
}

module "s3" {
  source = "./modules/s3"

  bucket_name = "${var.project}-bucket"
}

module "codecommit" {
  source = "./modules/codecommit"

  repository_name        = "${var.project}-repo"
  repository_discription = "CodeCommit repository for ${var.project}"
}

module "ecs" {
  source = "./modules/ecs"

  cluster_name       = "${var.project}-cluster"
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  container_image    = "nginx:latest"
  container_port     = 80
  desired_count      = 2
}
