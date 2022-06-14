terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}


resource "docker_image" "rstudio_image" {
  name = "rstudio_repo:latest"
  keep_locally = false

  build {
    path = "."
    dockerfile = "Dockerfile"
  }
}


resource "docker_container" "rstudio_container" {
  image = docker_image.rstudio_image.name
  name  = "test"
}