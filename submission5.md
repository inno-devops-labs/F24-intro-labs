# System Resource Monitoring

## Top 3 Applications by CPU Usage:
1. firefox-bin: 31.0% CPU
2. Isolated Web Co: 15.8% CPU
3. cinnamon: 9.9% CPU

## Top 3 Applications by Memory Usage:
1. firefox-bin: 4.9% Memory
2. Telegram: 3.8% Memory
3. Isolated Web Co: 3.6% Memory

## Top 3 Applications by I/O Usage:
1. PID: 2218 - firefox-bin: Read 120.35 kB/s, Write 60.25 kB/s
2. PID: 2510 - Isolated Web Co: Read 80.21 kB/s, Write 90.15 kB/s
3. PID: 1959 - cinnamon: Read 50.10 kB/s, Write 40.12 kB/s

## Disk Space Management

### Largest Files in the /var Directory:
1. 752M	/var
2. 528M	/var/lib
3. 260M	/var/lib/apt/lists

# Terraform and Nginx Deployment Documentation

## Terraform Version
- **Version Installed:** Terraform v1.9.6 (linux_amd64)

## Steps Followed to Install Terraform

1. **Download Terraform:**
### Command:
```bash
wget https://releases.hashicorp.com/terraform/1.9.6/terraform_1.9.6_linux_amd64.zip
```

2. **Unzip the Downloaded File:**
 - Unzip the downloaded Terraform binary:
 ```bash
 unzip terraform_1.9.6_linux_amd64.zip
 ```
4. **Verify Installation:**
### Command:
```bash
terraform --version
```
### output:
 ```bash
 Terraform v1.9.6
 ```

1. **Initialize Terraform:**
### Command:
```bash
terraform init
```
### Output:
```bash
 Initializing the backend...
 Initializing provider plugins...
 - Finding docker/docker versions matching "~> 2.0"...
 ╷
 │ Error: Invalid provider registry host
 │ 
 │ The host "registry.terraform.io" given in provider source address
 │ "registry.terraform.io/docker/docker" does not offer a Terraform provider
 │ registry.
```


3. **Apply Terraform Configuration:**
- Due to the initialization failure, the `terraform apply` command was not executed.
- Also the I couldn't continue with further steps.
     




