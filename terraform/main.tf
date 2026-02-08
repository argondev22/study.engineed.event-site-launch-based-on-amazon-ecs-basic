module "vpc" {
  source = "./modules/vpc"

  vpc_name             = "${var.project}-vpc"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.10.0/24", "10.0.11.0/24"]
  private_subnet_cidrs = ["10.0.20.0/24", "10.0.21.0/24"]
  availability_zones   = ["${var.aws_region}a", "${var.aws_region}c"]
}

module "s3_assets" {
  source = "./modules/s3"

  bucket_name = "${var.project}-bucket-for-assets"
}

module "s3_artifacts" {
  source = "./modules/s3"

  bucket_name             = "${var.project}-bucket-for-artifacts"
  enable_lifecycle_policy = true
}

module "codecommit" {
  source = "./modules/codecommit"

  repository_name        = "${var.project}-repo"
  repository_description = "CodeCommit repository for ${var.project}"
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

module "ecr" {
  source = "./modules/ecr"

  repository_name = "${var.project}-ecr-repo"
}

module "codebuild" {
  source = "./modules/codebuild"

  project_name        = "${var.project}-build"
  ecr_repository_url  = module.ecr.repository_url
  ecr_repository_arn  = module.ecr.repository_arn
  image_repo_name     = "${var.project}-app"
  container_name      = "${var.project}-cluster"
  artifact_bucket_arn = module.s3_artifacts.bucket_arn
}

module "codepipeline" {
  source = "./modules/codepipeline"

  pipeline_name = "${var.project}-pipeline"

  # S3 Artifacts
  artifact_bucket_name = module.s3_artifacts.bucket_name
  artifact_bucket_arn  = module.s3_artifacts.bucket_arn

  # CodeCommit
  codecommit_repository_name = module.codecommit.repository_name
  codecommit_repository_arn  = module.codecommit.repository_arn

  # CodeBuild
  codebuild_project_name = module.codebuild.project_name
  codebuild_project_arn  = module.codebuild.project_arn

  # ECS
  ecs_cluster_name            = module.ecs.cluster_name
  ecs_cluster_arn             = module.ecs.cluster_arn
  ecs_service_name            = module.ecs.service_name
  ecs_service_arn             = module.ecs.service_arn
  ecs_task_execution_role_arn = module.ecs.task_execution_role_arn
}
