resource "aws_ecs_cluster" "rstudio_cluster" {
  name = var.ecs_cluster_name
}
