## Task 2

I followed the guid provided in the lab5.md.

I... :
1) **Updated the system and downloaded the terraform:**``sudo pacman -Syu`` and ``sudo pacman -S terraform``. The provided guide doesn't give instruction for terraform installing on Arch-based systems, so I used [this guide for installation](https://ipv6.rs/tutorial/Arch_Linux/Terraform/)
2) **Verified a successful download and version:** ``terraform -help`` and ``terraform version``: 
```
terraform -help

Usage: terraform [global options] <subcommand> [args]

The available commands for execution are listed below.
The primary workflow commands are given first, followed by
less common or more advanced commands.
...
```
```
terraform version

Terraform v1.9.5
on linux_amd64
```
3) **Checked the Docker version:** ``docker -v``: Docker version 27.0.3, build 7d4bcd863a. I have ran ``sudo systemctl enable docker`` after docker download far away, so that docker runs every time I turn on my laptop. To be sure that it is running: ``sudo systemctl start docker``.
4) **Created lab5 folder and main.tf file inside:**
```
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
  name         = "nginx"
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
5) **``terraform init``** inside the folder lab5 to initialize the project which downloads a plugin called a provider that lets terraform interact with docker.

I have tried to complete the task, however I got an error on 2 OSs (Manjaro and Windows 11): Invalid provider registry host. The host "registry.terraform.io"given in provider source address "registry.terraform.io/kreuzwerker/docker" does not offer a Terraform provider registry. I resolved it through OpenVPN enabled.

```
Initializing the backend...
Initializing provider plugins...
- Reusing previous version of kreuzwerker/docker from the dependency lock file
- Using previously-installed kreuzwerker/docker v3.0.2

╷
│ Warning: Version constraints inside provider configuration blocks are deprecated
│ 
│   on main.tf line 11, in provider "docker":
│   11:   version = "~> 3.0.1"
│ 
│ Terraform 0.13 and earlier allowed provider version constraints inside the provider configuration block, but that is now deprecated and
│ will be removed in a future version of Terraform. To silence this warning, move the provider version constraint into the
│ required_providers block.
│ 
│ (and one more similar warning elsewhere)
╵
Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

6) **``terraform apply``:** Infrastructure creation, to provide a NGINX server container.
```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.nginx will be created
  + resource "docker_container" "nginx" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = (known after apply)
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "tutorial"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck (known after apply)

      + labels (known after apply)

      + ports {
          + external = 8000
          + internal = 80
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_image.nginx will be created
  + resource "docker_image" "nginx" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + name         = "nginx"
      + repo_digest  = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.
╷
│ Warning: Version constraints inside provider configuration blocks are deprecated
│ 
│   on main.tf line 11, in provider "docker":
│   11:   version = "~> 3.0.1"
│ 
│ Terraform 0.13 and earlier allowed provider version constraints inside the provider configuration block, but that is now deprecated and
│ will be removed in a future version of Terraform. To silence this warning, move the provider version constraint into the
│ required_providers block.
╵

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_image.nginx: Creating...
docker_image.nginx: Still creating... [10s elapsed]
docker_image.nginx: Creation complete after 13s [id=sha256:39286ab8a5e14aeaf5fdd6e2fac76e0c8d31a0c07224f0ee5e6be502f12e93f3nginx]
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 1s [id=0f1035d4943ec0b77a83cec62a45031bf44e0158bfe4b7c3f2a77e5a5be27edd]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```
7) **Confirmation.** NGINX container existance verifying via localhost:8080 and ``docker ps``. Here I got:
<img src="https://raw.githubusercontent.com/caxapb/New/main/data/localhost.png" alt="Local Host" width="800"/>

``docker ps``:
```
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
0f1035d4943e   39286ab8a5e1   "/docker-entrypoint.…"   2 minutes ago   Up 2 minutes   0.0.0.0:8000->80/tcp   tutorial
```

``ls -a``:
```
./  ../  .terraform/  .terraform.lock.hcl  main.tf  terraform.tfstate
```
- .terraform/ - folder with local metadata and provider plugins necessary for a terraform project which occur after ``terraform init`` required for main.tf configuration.
- .terraform.lock.hcl - file for locking provider versions for consistent runs across different machines or teams, contains checksums and the exact versions of each provider.
- terraform.tfstate - stores the current state of the infrastructure. Terraform stores the IDs and properties of the resources it manages here, so that it can update or destroy those resources going forward.


8) **Configuration formatting and validation.**
  - ``terraform fmt`` - none filenames are returned - none of files were modified. Command to check changed files.
  - ``terraform validate`` - Command to validate the configuration: '*Warning about version constraints.* Success! The configuration is valid, but there were some validation warnings as shown above.' 

During infrastructire creation (terraform apply) terraform prints out the **execution plan** which describes the actions terraform will take in order to change infrastructure to match the configuration. In case the plan is acceptable, type yes at the confirmation prompt to proceed (check the output of ``terraform apply``)

 - ``terraform show`` - to inspect the current state

```
# docker_container.nginx:
resource "docker_container" "nginx" {
    attach                                      = false
    bridge                                      = null
    command                                     = [
        "nginx",
        "-g",
        "daemon off;",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_set                                     = null
    cpu_shares                                  = 0
    domainname                                  = null
    entrypoint                                  = [
        "/docker-entrypoint.sh",
    ]
    env                                         = []
    hostname                                    = "0f1035d4943e"
    id                                          = "0f1035d4943ec0b77a83cec62a45031bf44e0158bfe4b7c3f2a77e5a5be27edd"
    image                                       = "sha256:39286ab8a5e14aeaf5fdd6e2fac76e0c8d31a0c07224f0ee5e6be502f12e93f3"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "tutorial"
    network_data                                = [
        {
            gateway                   = "172.17.0.1"
            global_ipv6_address       = null
            global_ipv6_prefix_length = 0
            ip_address                = "172.17.0.2"
            ip_prefix_length          = 16
            ipv6_gateway              = null
            mac_address               = "02:42:ac:11:00:02"
            network_name              = "bridge"
        },
    ]
    network_mode                                = "bridge"
    pid_mode                                    = null
    privileged                                  = false
    publish_all_ports                           = false
    read_only                                   = false
    remove_volumes                              = true
    restart                                     = "no"
    rm                                          = false
    runtime                                     = "runc"
    security_opts                               = []
    shm_size                                    = 64
    start                                       = true
    stdin_open                                  = false
    stop_signal                                 = "SIGQUIT"
    stop_timeout                                = 0
    tty                                         = false
    user                                        = null
    userns_mode                                 = null
    wait                                        = false
    wait_timeout                                = 60
    working_dir                                 = null

    ports {
        external = 8000
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.nginx:
resource "docker_image" "nginx" {
    id           = "sha256:39286ab8a5e14aeaf5fdd6e2fac76e0c8d31a0c07224f0ee5e6be502f12e93f3nginx"
    image_id     = "sha256:39286ab8a5e14aeaf5fdd6e2fac76e0c8d31a0c07224f0ee5e6be502f12e93f3"
    keep_locally = false
    name         = "nginx"
    repo_digest  = "nginx@sha256:04ba374043ccd2fc5c593885c0eacddebabd5ca375f9323666f28dfd5a9710e3"
}
```

 - ``terraform state list`` - list of the resources in project's state:
```
docker_container.nginx
docker_image.nginx
```

- Update configuration: change the ports.external value from 8000 to 8080 and apply changes via ``terraform apply``. Changes during 'apply' are reflected as:
```
Terraform will perform the following actions:

  # docker_container.nginx must be replaced
-/+ resource "docker_container" "nginx" {

  ... etc ...

      ~ ports {
          ~ external = 8000 -> 8080 # forces replacement
            # (3 unchanged attributes hidden)
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.

... etc ...

docker_container.nginx: Destroying... [id=0f1035d4943ec0b77a83cec62a45031bf44e0158bfe4b7c3f2a77e5a5be27edd]
docker_container.nginx: Destruction complete after 0s
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 1s [id=8f92be3d9438527d915a5043fbe3ba7babe5388906b1be8ec817dbf1d6979057]
```

Docker provider knows that it cannot change the port of a container after it has been created, so terraform will destroy the old container and create a new one. Additionally, the execution plan shows that the port change is what forces terraform to replace the container. ``terraform show`` will tell us that external port is 8080 now.

9) **Destroy** - terminate resources managed by terraform project. ``terraform destroy``:
```
# docker_container.nginx will be destroyed
... etc ...
# docker_image.nginx will be destroyed
... etc ...
Plan: 0 to add, 0 to change, 2 to destroy.
```
10) **Variables**. 
  - Following the guide I created 'variables.tf' in the lab5 folder and changed the name in the 'resourse "docker_container" "nginx"' cell in the main.tf:
```
# variables.tf
variable "container_name" {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "ExampleNginxContainer"
}

#main.tf
name = var.container_name
```

  - applied:
```
  # docker_container.nginx must be replaced
  ~ name                                        = "tutorial" -> "ExampleNginxContainer" # forces replacement
  Plan: 1 to add, 0 to change, 1 to destroy.
```
``terraform show``:
```
 name                                        = "ExampleNginxContainer"
```
  - ``terraform apply -var "container_name=YetAnotherName"``. Setting variables via the command-line will not save their values.
``terraform show``:
```
 name                                        = "YetAnotherName"
```

11) **Query data with outputs:**
  - I destroied previous container with old name and did ``apply`` again
  - Then I created 'outputs.tf' with the following content:
```
output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.nginx.id
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.nginx.id
}
```
- Did ``apply`` again and saw: the similar output '1 to add 0 to change 1 to destroy' and this message in execution plan:
```
Changes to Outputs:
  + container_id = (known after apply)
  + image_id     = "sha256:39286ab8a5e14aeaf5fdd6e2fac76e0c8d31a0c07224f0ee5e6be502f12e93f3nginx"
```
  - Terraform prints output values to the screen when you apply your configuration. Query the outputs with the ``terraform output`` command:
```
container_id = "a648f3dfcb21b36245fb8c1ead989ff8ab2eddad2859cb573cbad65518346515"
image_id = "sha256:39286ab8a5e14aeaf5fdd6e2fac76e0c8d31a0c07224f0ee5e6be502f12e93f3nginx"
```

After the tutorial ends I destroyed the terraform infrastructure.