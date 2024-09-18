1. Terraform v1.9.5
on linux_amd64
+ provider registry.terraform.io/kreuzwerker/docker v3.0.2
2.
- `sudo apt-get install -y gnupg software-properties-common`
- Installed the HashiCorp GPG key.
- Verified the key's fingerprint.
- `echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list`
- `sudo apt update`
- `sudo apt-get install terraform`
3.
- `terraform init`
- `terraform apply`
