# Input variable definitions

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "example-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "sandbox"
  }
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "slack_channel_email_address" {
  type    = string
}

variable "ecr_repo_name" {
  type    = string
}

variable "ecs_cluster_name" {
  type    = string
}

variable "task_name" {
    type    = string
}

variable "cloudwatch_schedule_expression" {
    type    = string
}

variable "image_tag" {
    type    = string
}

variable "push_script" {
  description = "Path to script to build and push Docker image"
  type        = string
  default     = ""
}

variable "profile" {
    type    = string
    default = "personal"
}