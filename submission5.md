# GitOps & SRE Lab

## Task 1: Key Metrics for SRE and SLAs

1. **Monitor System Resources**:
   - Use commands like `htop` and `iostat` to monitor CPU, memory, and I/O usage.
   - Identify and document the top 3 most consuming applications for CPU, memory, and I/O usage.
        
        After ```htop```, I sorted by CPU and MEM usage, remembered PIDs of needed processes and now, I'll get info using command ```ps -fp PID```
        ```sh
        # Top 3 CPU-consuming processes
        # I'm using WSL, so I do not have any 'heavy' processes, so they take only 0.6% CPU each
        > ps -fp 1
        UID          PID    PPID  C STIME TTY          TIME CMD
        root           1       0  1 11:53 ?        00:00:03 /sbin/init
        > ps -fp 506
        UID          PID    PPID  C STIME TTY          TIME CMD
        root         506     360  0 11:53 ?        00:00:02 python3 /snap/ubuntu-desktop-installer/1286/usr/bin/cloud-init
        > ps -fp 360
        UID          PID    PPID  C STIME TTY          TIME CMD
        root         360     221  0 11:53 ?        00:00:03 /snap/ubuntu-desktop-installer/1286/usr/bin/python3.10 -m subiquity.

        # Top 3 MEM-consuming processes
        # they take only 0.7, 0.4 and 0.3% MEM (accordingly)
        > ps -fp 360
        UID          PID    PPID  C STIME TTY          TIME CMD
        root         360     221  0 11:53 ?        00:00:03 /snap/ubuntu-desktop-installer/1286/usr/bin/python3.10 -m subiquity.cmd.server --use-os-prober --storag
        > ps -fp 166
        UID          PID    PPID  C STIME TTY          TIME CMD
        root         166       1  0 11:53 ?        00:00:00 /usr/lib/snapd/snapd
        ps -fp 506
        UID          PID    PPID  C STIME TTY          TIME CMD
        root         506     360  0 11:53 ?        00:00:04 python3 /snap/ubuntu-desktop-installer/1286/usr/bin/cloud-init status --wait
        ```

        Now I'm checking I/O usage:
        ```sh
        > iostat -x
        # Full output looks like this:
        Linux 5.15.153.1-microsoft-standard-WSL2 (DESKTOP-65R3QD9)      09/18/24        _x86_64_        (12 CPU)
        avg-cpu:  %user   %nice %system %iowait  %steal   %idle
                  0.20    0.00    0.14    0.09    0.00   99.58
        Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util
        sda              0.81     53.05     0.31  27.61    0.67    65.79    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.00   0.07
        # I'll clear the data a little bit:
        Device  %util
        sda     0.07
        sdb     0.01
        sdc     0.75
        # So, drives are most I/O-consuming in my system
        ```

2. **Disk Space Management**:
   - Use `du` and `df` to manage disk space.
   - Identify and log the top 3 largest files in the `/var` directory.

        ```sh
        > sudo du /var | sort -n -r | head -n 4
        1124124 /var    # Total size of /var directory
        # 3 largest files in it
        823400  /var/lib
        596912  /var/lib/snapd
        596252  /var/lib/snapd/snaps
        ```

## Task 2: Terraform Installation and Nginx Deployment

1. **Research and Installation**:

   It is stated to document everything in some other file, but I guess there is no need to do it, because the only problem I had was downloading VPN, everything else was done according to the tutorial from [here](https://developer.hashicorp.com/terraform/tutorials/docker-get-started). So, I will copy this part in the file `TerraformAndNginx.md`

   - Read about Terraform.
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
   - Document your process.