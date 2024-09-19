## Task 2: Terraform Installation and Nginx Deployment

1. **Research and Installation**:

   - Install Terraform on your system by following the [official instructions](https://developer.hashicorp.com/terraform/tutorials/docker-get-started).
       I installed terraform zip archieve using VPN, added directory to `PATH` and executed test command:
       ```sh
       > terraform -help
       Usage: terraform [global options] <subcommand> [args]
       The available commands for execution are listed below.
       The primary workflow commands are given first, followed by less common or more advanced commands.
       Main commands:
       init          Prepare your working directory for other commands
       validate      Check whether the configuration is valid
       plan          Show changes required by the current configuration
       apply         Create or update infrastructure
       destroy       Destroy previously-created infrastructure
       
       All other commands:
       {Some commands}
       
       Global options (use these before the subcommand, if any):
       -chdir=DIR    Switch to a different working directory before executing the given subcommand.
       -help         Show this help output, or the help for a specified subcommand.
       -version      An alias for the "version" subcommand.
       ```

       ```sh
       terraform -version
       Terraform v1.9.6
       ```

2. **Nginx Deployment**:
   - Follow the tutorial steps to build, change, and destroy infrastructure.
      
      I decided to use VPN because I did not succeed with provider installation.

      ```sh
      > terraform init
      Initializing the backend...
      Initializing provider plugins...
      - Finding kreuzwerker/docker versions matching "~> 3.0.1"...
      - Installing kreuzwerker/docker v3.0.2...
      - Installed kreuzwerker/docker v3.0.2 (self-signed, key ID BD080C4571C6104C)
      Partner and community providers are signed by their developers.
      If you'd like to know more about provider signing, you can read about it here:
      https://www.terraform.io/docs/cli/plugins/signing.html
      Terraform has created a lock file .terraform.lock.hcl to record the provider  
      selections it made above. Include this file in your version control repository
      you run "terraform init" in the future.

      Terraform has been successfully initialized!

      You may now begin working with Terraform. Try running "terraform plan" to see
      any changes that are required for your infrastructure. All Terraform commands
      should now work.

      If you ever set or change modules or backend configuration for Terraform,
      rerun this command to reinitialize your working directory. If you forget, other
      commands will detect it and remind you to do so if necessary.
      ```

      Then, I executed `terraform apply` and checked if I have Nginx container:

      ```sh
      > docker ps
      CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS                    PORTS                                                                                        NAMES   
      34c7771352d5   39286ab8a5e1   "/docker-entrypoint.…"   2 minutes ago   Up 2 minutes              0.0.0.0:8000->80/tcp                                                                         tutorial
      ```
   - Define variables and query data with outputs.
      
      I edited my container name using `variables.tf`:
      ```tf
      variable "container_name" {
      description = "Docker container for Lab5"
      type        = string
      default     = "Lab5NginxContainer"
      }
      ```
      And changing `main.tf`:
      ```tf
      resource "docker_container" "nginx" {
         image = docker_image.nginx.image_id
         name  = var.container_name

         ports {
            internal = 80
            external = 8000
         }
      }
      ```

      ```sh
      > docker ps      
      CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS                    PORTS                                                                                        NAMES
      d107c1bd8332   39286ab8a5e1   "/docker-entrypoint.…"   2 minutes ago   Up 2 minutes              0.0.0.0:8000->80/tcp                                                                         Lab5NginxContainer
      ```

      Now, query data with outputs. I added a file `outputs.tf`:
      ```tf
      output "container_id" {
         description = "ID of the Docker container"
         value       = docker_container.nginx.id
      }

      output "image_id" {
         description = "ID of the Docker image"
         value       = docker_image.nginx.id
      }
      ```

      So, now I can get ids of container and image:
      ```sh
      > terraform output
      container_id = "502c5a2837078c63456a979b866ec810ce1a8eb5539f27dc6c5044d4bb0c423c"
      image_id = "sha256:39286ab8a5e14aeaf5fdd6e2fac76e0c8d31a0c07224f0ee5e6be502f12e93f3nginx"
      ```
      Then, `terraform destroy`.