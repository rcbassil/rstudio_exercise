resource "aws_sns_topic_subscription" "task_failure" {

  topic_arn = module.cron_job.sns_topic_arn
  protocol	= "email"
  endpoint 	= var.slack_channel_email_address

}