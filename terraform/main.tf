terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "app" {
  name = "app_image:latest"
}

resource "docker_container" "app" {
  name  = "app_container"
  image = docker_image.app.image_id

  ports {
    internal = 5000
    external = 5000
  }
}