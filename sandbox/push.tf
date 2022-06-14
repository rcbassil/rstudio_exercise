resource "null_resource" "push" {
     provisioner "local-exec" {
    command     = "${coalesce(var.push_script, "${path.module}/push.sh")} ${module.cron_job.aws_ecr_repository_url} ${var.image_tag} ${var.profile}"
    interpreter = ["bash", "-c"]
  }

  depends_on = [
    aws_ecr_repository.rstudio_repo
  ]
}