variable "nginx_image" {
  type    = string
  default = "nginx:latest"
}

variable "nginx_container_name" {
  type    = string
  default = "tutorial"
}

variable "external_port" {
  type    = number
  default = 8080
}

variable "internal_port" {
  type    = number
  default = 80
}

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = var.nginx_image
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.nginx_container_name
  ports {
    internal = var.internal_port
    external = var.external_port
  }
}

output "nginx_container_id" {
  value = docker_container.nginx.id
}

output "nginx_container_ip" {
  value = docker_container.nginx.ip_address
}
