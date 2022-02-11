resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "web1" {
  name  = var.container_name
  image = docker_image.nginx.latest

  ports {
    external = 8000
    internal = 80
  }
}