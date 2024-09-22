# variables.tf
variable "container_name" {
  description = "Name of the Docker container"
  type        = string
  default     = "nginx_container"
}

variable "nginx_image_name" {
  description = "Docker image to use for NGINX"
  type        = string
  default     = "nginx"
}

variable "internal_port" {
  description = "Internal port for the NGINX container"
  type        = number
  default     = 80
}

variable "external_port" {
  description = "External port for the NGINX container"
  type        = number
  default     = 8000
}
