output "sns_topic_arn" {
  value       = aws_sns_topic.task_failure.arn
  description = "ARN of the SNS Topic where job failure notifications are sent"
}


output "aws_ecr_repository_url" {
  value       = data.aws_ecr_repository.existing.repository_url
}
