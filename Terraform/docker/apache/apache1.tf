resource "docker_image" "httpd" {
  name         = var.image_name
  keep_locally = true
}

resource "docker_container" "apache1" {
  name  = var.container_name
  image = var.image_name

  mounts {
    type   = "bind"
    source = var.source_path
    target = var.apache_path
  }

  ports {
    external = 8086
    internal = 80
  }
}