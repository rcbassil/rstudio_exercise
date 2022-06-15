# rstudio_exercise

In this exercise I use ECS, CloudWatch, IAM, and SNS resources. The module cron-job accepts a set of variables including the ECR repository name (where our Docker image is stored), Docker image tag, execution schedule (in the form of a cron expression), and runtime cpu/memory limitations.

By default, the module spins up a new ECS cluster with the same name as your scheduled job. It also uses ECS with Fargate. 
Cloudwatch is used to trigger a job and also to send a message to a SNS topic in case the job fails.

Dockerfile is used to create a sample application/image which will be pushed to the ECR repository using push.sh. 
