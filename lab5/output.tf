# outputs.tf
output "container_id" {
  description = "ID of the running Docker container"
  value       = docker_container.nginx.id
}

output "container_name" {
  description = "Name of the Docker container"
  value       = docker_container.nginx.name
}

output "image_id" {
  description = "ID of the NGINX Docker image"
  value       = docker_image.nginx.image_id
}

output "nginx_ports" {
  description = "The internal and external ports for NGINX"
  value = {
    internal = var.internal_port
    external = var.external_port
  }
}
