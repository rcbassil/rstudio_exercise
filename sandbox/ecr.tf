resource "aws_ecr_repository" "rstudio_repo" {
  name = var.ecr_repo_name
}