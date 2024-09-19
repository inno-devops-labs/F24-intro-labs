# Terraform and Nginx

### Terraform version
```sh
terraform version
```
```sh
Terraform v1.9.5
on linux_amd64
```
### Steps to install
```sh
nano ~/.terraformrc #add yandex provider

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget https://hashicorp-releases.yandexcloud.net/terraform/1.9.5/terraform_1.9.5_linux_amd64.zip
unzip terraform_1.9.5_linux_amd64.zip
export PATH=$PATH:$(pwd)
```

## Nginx deployment

Let's first create main.tf in lab5 directory

```sh
touch lab5/main.tf
```

In main.tf I added the following configuration:

```hcl 
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
```
After saving, init the terraform:

```sh
terraform init
```

After initialization, apply the configuration

```sh
terraform apply
```

```markdown
Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_image.nginx: Creating...
docker_image.nginx: Still creating... [10s elapsed]
docker_image.nginx: Creation complete after 15s [id=sha256:39286ab8a5e14aeaf5fdd6e2fac76e0c8d31a0c07224f0ee5e6be502f12e93f3nginx:latest]
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 0s [id=582a8d4f68e7d6c2f48d4de9bcb3a9ed75392c586fb014310b22ded1f209b82a]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

```sh
terraform destroy
```
```markdown
docker_container.nginx: Destroying... [id=582a8d4f68e7d6c2f48d4de9bcb3a9ed75392c586fb014310b22ded1f209b82a]
docker_container.nginx: Still destroying... [id=582a8d4f68e7d6c2f48d4de9bcb3a9ed75392c586fb014310b22ded1f209b82a, 10s elapsed]
docker_container.nginx: Destruction complete after 12s
docker_image.nginx: Destroying... [id=sha256:39286ab8a5e14aeaf5fdd6e2fac76e0c8d31a0c07224f0ee5e6be502f12e93f3nginx:latest]
docker_image.nginx: Destruction complete after 1s
```

## Challenges installing Terraform

- Needed to use Yandex's Mirror
- Hard to setup