
## Task 1

### Monitor System Resources

``htop`` - interactive process viewer

```
from memory bar:  7,24G/15.0G
from swap bar: 0K/0K
```

#### Top 3 the most consuming applications for CPU:

CPU usage (depending on the percentage of the processor time used by the process): 
- Firefox (3.8%), 
- htop(3.2%), 
- Firefox(2.6%)

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/cpu.png" alt="CPU" width="1000"/>

#### Top 3 the most consuming applications for memory:

Physical RAM usage: 
- Telegram Desktop (4,4% - 678M), 
- plasmashell (2,9% - 441M), 
- Firefox (2.9% - 440M)

Since the processes' statistics are updated frequently, the information might be slightly defferent on the screens:

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/ram_perc.png" alt="RAM" width="1000"/>


<img src="https://raw.githubusercontent.com/caxapb/New/main/data/ram.png" alt="RAM" width="1000"/>

Shared memory usage:
- Telegram Desktop (254M), 
- Google Chrome(249M), 
- Firefox(217M)

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/shared_mem.png" alt="Shared memoty" width="1000"/>

Virtual memory usage:
- All three top processes belong to Google Chrome: 1134G (but 2,8% of RAM)

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/virt.png" alt="Virtual memoty" width="1000"/>


#### I/O usage

``iostat -k``

This command captures the statistics in kilobytes. By default, iostat measure the I/O system with the bytes unit. To make it easier to read, I made the iostat show the reports in kilobytes unit:

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/iostat.jpg" alt="I/O usage" width="800"/>

- There are 16 devices: 15 of them are virtual (loop devices) - the majority of the loop devices have little or no read/write activity; **nvme0n1** is a physical device (Non-Volatile Memory Express), connects directly to the system's Peripheral Component Interconnect Express bus. This device is responsible for the most of I/O operations (as it can be seen on the screen). 
- CPU activity: 96.01% is per idle time, so the most of the CPU resources are available.
- tps: 3.57 - The number of transfers per second that were issued to the device. 
- kB_read/s, kB_wrtn/s, and kB_dscd/s : 33,72, 38,47, and 0.00 -  amount of data read from / written to / discarded for the device.
- kB_read, kB_wrtn, and kB_dscd: 4617650, 4127342,and 0 - same meaning but in total.

``iostat -k 2 3`` - for getting the statistics 3 times with delays. **nvme0n1** is still the most used but loop4 and loop9 are the most used in reading after the nvme0n1. The first report from the iostat command contains information accumulated from the moment the system boots until the iostat command is called. In each subsequent set, information collected over the previous time interval is displayed (in this case, 2 seconds). 

Collected stats for nvme0n1:

|Report number | tps |  kB_read/s | kB_wrtn/s | kB_dscd/s | kB_read | kB_wrtn | kB_dscd |
| ------------ | --- | ---------- | --------- | --------- | ------- | ------- | --------|
|1 | 15,18 | 582,55 | 90,56| 0,00 | 14074730 | 2188018 | 0 |
|2 | 28,36 |  250,75    |   129,35 |         0,00 |        504 |        260 |          0|
|3 |  1,50  |     192,00 |         0,00 |         0,00 |        384 |          0 |          0 |

``sudo pidstat -d 2`` - provides detailed I/O statistics for processes over time:
<img src="https://raw.githubusercontent.com/caxapb/New/main/data/pidstat.png" alt="I/O usage" width="800"/>


### Disk Space Management


``sudo find /var -type f -exec du -h {} + | sort -rh | head -n 3``: find /var -type f - find all files (not directories) within the /var directory, -exec du -h {} + - execute 'du -h {} +' on each found file, sort -rh - reverse sorting of human-readable values, head -n 3 - top 3 the largest files.

```
1.3G	/var/lib/snapd/snaps/clion_275.snap
1.3G	/var/lib/snapd/snaps/clion_274.snap
903M	/var/lib/snapd/cache/266bf83fc3d0cebadef1a197074c922b88c071b83014b0947f23f7dc62228dc47dd59ec6dc094f7e73d26d35bae862c4
```

``df -h``: check available disk space:
```
Filesystem      Size  Used Avail Use% Mounted on
dev             7.6G     0  7.6G   0% /dev
run             7.6G  1.7M  7.6G   1% /run
/dev/nvme0n1p4  246G  139G   95G  60% /
tmpfs           7.6G  158M  7.4G   3% /dev/shm
tmpfs           7.6G   25M  7.5G   1% /tmp
/dev/loop0      128K  128K     0 100% /var/lib/snapd/snap/bare/5
/dev/loop2      1.3G  1.3G     0 100% /var/lib/snapd/snap/clion/275
/dev/loop1      1.3G  1.3G     0 100% /var/lib/snapd/snap/clion/274
/dev/loop3      314M  314M     0 100% /var/lib/snapd/snap/code/168
/dev/loop9       75M   75M     0 100% /var/lib/snapd/snap/core22/1586
/dev/loop4      314M  314M     0 100% /var/lib/snapd/snap/code/169
/dev/loop7       64M   64M     0 100% /var/lib/snapd/snap/core20/2318
/dev/loop5       56M   56M     0 100% /var/lib/snapd/snap/core18/2823
/dev/loop8       64M   64M     0 100% /var/lib/snapd/snap/core20/2264
/dev/loop6       56M   56M     0 100% /var/lib/snapd/snap/core18/2829
/dev/loop11      92M   92M     0 100% /var/lib/snapd/snap/gtk-common-themes/1535
/dev/loop10      75M   75M     0 100% /var/lib/snapd/snap/core22/1612
/dev/loop12      39M   39M     0 100% /var/lib/snapd/snap/snapd/21465
/dev/loop13      39M   39M     0 100% /var/lib/snapd/snap/snapd/21759
/dev/nvme0n1p1  256M   33M  224M  13% /boot/efi
tmpfs           1.6G   92K  1.6G   1% /run/user/1000
```
### Summary

To sum up, I can conclude that web-browsers and application are the main consumers of CPU and memory powers. Firefox, Chrome, and Telegram Desktop use CPU resources the most and they need RAM the most. 
- ``htop`` as a process viewer provides system monitoring and process management, is used for checking CPU and memory usage information, info about load average and uptime, and real-time data of processes with stats like priority, CPU and memory consumption, etc. 
- ``iostat`` provides overall disk I/O statistics for a system, info about CPU usage (%user, %nice, %system %iowait, %steal %idle) and I/O info (read and written bytes).
- ``pidstat`` shows the I/O statistics for processes. Chrome and Firefox are performing some disk write activity (cache data, manage temporary files, etc.). Mongodb, Telegram Desktop, systemd-journal and plasmashell have much less 'write' activity. Baloo_file_extr is part of the Baloo file indexing system for KDE Plasma and reads the most (probably adjusting of Baloo's behaviour would bring some impact to decrease the system load). jbd2/nvme0n1p4-8 is related to the journaling of filesystem (one of the most among writers).
- ``du`` (Disk Usage) estimates and displays the amount of disk space used by files, directories, or entire filesystems. For example ``du -h ~/StudyCourses/DevOps`` will compute the size of each file and folders inside a given folder, and -sh option returns a size of a given folder. 
```
du -h ~/StudyCourses/DevOps
12K	/home/anastasia/StudyCourses/DevOps/F24-DevOps/.git/objects/26
8.0K	/home/anastasia/StudyCourses/DevOps/F24-DevOps/.git/objects/14
... etc ...
120K	/home/anastasia/StudyCourses/DevOps/.git
952K	/home/anastasia/StudyCourses/DevOps
```
```
du -sh ~/StudyCourses/DevOps
952K	/home/anastasia/StudyCourses/DevOps
```
- ``df`` (Disk Free) displays information about file system disk space usage. Displays a list with features: Filesystem, 1K(M)-blocks, Used, Available, Used%/Capacity, Mounted On 
```
df -m /boot
Filesystem     1M-blocks   Used Available Use% Mounted on
/dev/nvme0n1p4    250898 141365     96717  60% /
```

>**du** traverses the directory tree, measuring how much space each file takes up, and gives you the total space. **df** simply queries the file system for remaining space. It looks the same, however a file that has no directory entries will affect df but not du.


In my case, the CPU is mostly idle and has a lot of free capacity, disk is mostly reading data and there's no significant write activity. CPU cores seem free and no major disk I/O bottlenecks (there's plenty of idle CPU time and very low I/O wait time). I have multiple versions of snap packages taking up significant space (CLion, core, and code), and I have 2 versions of Clion, thus I should conduct a cleaning for my files to free memory. Also I have running processes with MongoDB, while I don't absolutely use it, thus it seems logical to get rid of it untill I need it again. 

## Task 2

I followed the guid provided in the lab5.md.

I...:
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

``ls``:
```
./  ../  .terraform/  .terraform.lock.hcl  main.tf  terraform.tfstate
```
- .terraform/ - folder with local metadata and provider plugins necessary for a terraform project which occur after ``terraform init`` required for main.tf configuration.
- .terraform.lock.hcl - file for locking provider versions for consistent runs across different machines or teams, contains checksums and the exact versions of each provider.
- terraform.tfstate - stores the current state of the infrastructure. Terraform stores the IDs and properties of the resources it manages here, so that it can update or destroy those resources going forward.


8) **Configuration formatting and validation.**
  - ``terraform fmt`` - none filenames are returned - none of files were modified. Command to check changed files.
  - ``terraform validate`` - Command to validate the configuration: '*Warning about version constraints* Success! The configuration is valid, but there were some validation warnings as shown above.' 

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
  - Following the guide I created variables.tf in the lab5 folder and changed the name in the 'resourse "docker_container" "nginx"' cell in the main.tf:
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
  - terraform apply -var "container_name=YetAnotherName". Setting variables via the command-line will not save their values.
``terraform show``:
```
 name                                        = "YetAnotherName"
```

11) **Query data with outputs:**
  - I destroied previous container with old name and did ``apply`` again
  - Then I created outputs.tf with the following content:
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
- Did ``apply`` again and saw: the similar output '1 to add 0 to change 1 to destroy' and message in execution plan:
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

After the tutorial ends I destroyed the terraform.