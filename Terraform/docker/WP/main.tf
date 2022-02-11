terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}
provider "docker" {

}

resource "docker_image" "wordpress" {
  name         = "wordpress:latest"
  keep_locally = true
}

resource "docker_container" "wp" {
  name         = var.container_name
  image        = docker_image.wordpress.latest
  network_mode = var.network_name
  restart      = "always"

  ports {
    external = 9000
    internal = 80
  }

  env = [
    "WORDPRESS_DB_HOST=db1",
    "WORDPRESS_DB_USER=toto",
    "WORDPRESS_DB_PASSWORD=toto",
    "WORDPRESS_DB_NAME=wordpress"
  ]

  mounts {
    type   = "volume"
    source = var.wp_volume_name
    target = "/var/www/html"
  }
}

resource "docker_image" "mariadb" {
  name         = "mariadb:latest"
  keep_locally = true
}

resource "docker_container" "db" {
  name         = var.container_name_db
  image        = docker_image.mariadb.latest
  network_mode = var.network_name
  restart      = "always"

  env = [
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=toto",
    "MYSQL_PASSWORD=toto",
    "MYSQL_RANDOM_ROOT_PASSWORD='1'"
  ]

  mounts {
    type   = "volume"
    source = var.db_volume_name
    target = "/var/lib/mysql"
  }
}

resource "docker_network" "worpdress_network" {
  name = var.network_name
}

resource "docker_volume" "wordpress_volume" {
  name = var.wp_volume_name
}

resource "docker_volume" "db_volume" {
  name = var.db_volume_name
}


variable "container_name" {
  description = "Le nom du conteneur wordpress"
  type        = string
  default     = "wp1"
}

variable "container_name_db" {
  description = "Le nom du conteneur mariadb"
  type        = string
  default     = "db1"
}

variable "network_name" {
  description = "Le nom du réseau"
  type        = string
  default     = "wordpress_network"
}

variable "wp_volume_name" {
  description = "Le nom du volume wordpress"
  type        = string
  default     = "wordpress_volume"
}

variable "db_volume_name" {
  description = "Le nom du volume mariadb"
  type        = string
  default     = "db_volume"
}