#!/bin/bash
# 
# Builds a Docker image and pushes to an AWS ECR repository
#
# Invoked by the terraform-aws-ecr-docker-image Terraform module.
#
# Usage:
#
# # Acquire an AWS session token
# $ ./push.sh . 123456789012.dkr.ecr.us-west-1.amazonaws.com/hello-world latest
#

set -e

repository_url="$1"
tag="${2:-latest}"
profile="$3"

region="$(echo "$repository_url" | cut -d. -f4)"
image_name="$(echo "$repository_url" | cut -d/ -f2)"

docker build --platform=linux/amd64 -t "$image_name" .


aws ecr get-login-password --region "$region" --profile "$profile" | docker login --username AWS --password-stdin "$repository_url"

docker tag "$image_name" "$repository_url":"$tag"
docker push "$repository_url":"$tag"
