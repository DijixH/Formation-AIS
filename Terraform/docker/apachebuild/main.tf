terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {
}

resource "docker_image" "httpd" {
  name         = var.image_name
  keep_locally = true
}

resource "docker_container" "forty" {
  name  = var.container_name
  image = var.image_name

  ports {
    external = 80
    internal = 80
  }
}

variable "container_name" {
  description = "Le nom du conteneur"
  type        = string
  default     = "forty1"
}

variable "image_name" {
  description = "Le nom de l'image"
  type        = string
  default     = "fortywebapp:v1"
}
