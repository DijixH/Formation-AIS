variable "container_name" {
  description = "Le nom du conteneur"
  type        = string
  default     = "apache1"
}

variable "image_name" {
  description = "Le nom de l'image"
  type        = string
  default     = "httpd:latest"
}

variable "source_path" {
  description = "Dossier machine hôte webpage"
  type        = string
  default     = "/home/thomas/terraform/docker/apache/webpage/"
}

variable "apache_path" {
  description = "Dossier Apache container"
  type        = string
  default     = "/usr/local/apache2/htdocs/"
}