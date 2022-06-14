provider "aws" {
  profile = "personal"
  region  = var.aws_region
}

module "cron_job" {
  source = "../cron-job"


  ecr_repo_name                  = aws_ecr_repository.rstudio_repo.name
  image_tag                      = var.image_tag
  ecs_cluster_name               = aws_ecs_cluster.rstudio_cluster.name
  task_name                      = var.task_name
  subnet_ids                     = module.vpc.private_subnets
  #task_role_arn                  = "${aws_iam_role.admin.arn}"
  cloudwatch_schedule_expression = var.cloudwatch_schedule_expression


  depends_on = [
    aws_ecr_repository.rstudio_repo,
    aws_ecs_cluster.rstudio_cluster
  ]
}


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.21.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway

  tags = var.vpc_tags
}
