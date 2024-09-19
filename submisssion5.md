# Task 1

## Top CPU Usage

```sh
16222 root       20   0 11.5G  144M 45520 S  3.3  3.8  0:35.89 /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/node --dns-result-order=ipv4first /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/out/bootstrap-fork --type=extensionHost --transformURIs --useHostProxy=true
    1 root       20   0  163M 12760  8340 S  1.3  0.3  1:45.04 /sbin/init
16229 root       20   0 11.5G  144M 45520 S  0.7  3.8  0:01.91 /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/node --dns-result-order=ipv4first /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/out/bootstrap-fork --type=extensionHost --transformURIs --useHostProxy=true
```

## Top Memory Usage

```sh
16222 root       20   0 11.5G  145M 45520 S  0.0  3.8  0:36.79 /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/node --dns-result-order=ipv4first /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/out/bootstrap-fork --type=extensionHost --transformURIs --useHostProxy=true
16223 root       20   0 11.5G  145M 45520 S  0.0  3.8  0:00.00 /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/node --dns-result-order=ipv4first /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/out/bootstrap-fork --type=extensionHost --transformURIs --useHostProxy=true
16224 root       20   0 11.5G  145M 45520 S  0.0  3.8  0:00.90 /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/node --dns-result-order=ipv4first /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/out/bootstrap-fork --type=extensionHost --transformURIs --useHostProxy=true
```

The processes that use the most resources are connected to VScode because I use extensions to complete this labs in WSL

## Three Largest Files in `/var`

I used a command to list the three biggest files inside /var.

```sh
du -h -a /var/* | sort -n -r | head -n 3
1020K   /var/cache/apt/archives/fonts-dejavu-core_2.37-2build1_all.deb
996K    /var/cache/apt/archives/busybox-static_1%3a1.30.1-7ubuntu3.1_amd64.deb
956K    /var/cache/apt/archives/libubsan1_12.3.0-1ubuntu1~22.04_amd64.deb
```

# Task 2

I mannually installed terraform and made sure to add path of the executable to the PATH varible

```sh
terraform --version
Terraform v1.9.5
on windows_386
```

Then I created `main.tf` configuration file in the lab5 folder and initialized the directory.

```sh
terraform init
Initializing the backend...
Initializing provider plugins...
...
Terraform has been successfully initialized!
```

```sh
terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:

+ create

Terraform will perform the following actions:

# docker_container.nginx will be created

# docker_image.nginx will be created

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_image.nginx: Creating...
docker_image.nginx: Still creating... [10s elapsed]
docker_image.nginx: Still creating... [20s elapsed]
docker_image.nginx: Creation complete after 26s [id=sha256:39286ab8a5e14aeaf5fdd6e2fac76e0c8d31a0c07224f0ee5e6be502f12e93f3nginx]
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 2s [id=4fd4a7682e86c7726cf5061b89cafa34127b0572e93fef8e77e654b72ef76a0c]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

To confirm that it works I visited `localhost:8000`
![1726662280630](image/submisssion5/1726662280630.png)

Next, I changed the configuration file to make name of the container a varible

```bash
terraform apply
~ name = "tutorial" -> "ExampleNginxContainer" # forces replacement
Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```

Then changed the variable value using command

```bash
terraform apply -var "container_name=DifferentName"
 ~ name = "ExampleNginxContainer" -> "DifferentName" # forces replacement
Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```

I also added two output field to show container ID and image ID

```bash
terraform output
container_id = "e13f53aba158e22e1ee7631cae1f710a40ccec591a1821cbd8e599463fb19cd9"
image_id = "sha256:39286ab8a5e14aeaf5fdd6e2fac76e0c8d31a0c07224f0ee5e6be502f12e93f3nginx:latest"
```

Finally, I destroyed the infrastructure

```bash
terraform destroy
docker_container.nginx: Destroying... [id=e13f53aba158e22e1ee7631cae1f710a40ccec591a1821cbd8e599463fb19cd9]
docker_container.nginx: Destruction complete after 1s
docker_image.nginx: Destroying... [id=sha256:39286ab8a5e14aeaf5fdd6e2fac76e0c8d31a0c07224f0ee5e6be502f12e93f3nginx:latest]
docker_image.nginx: Destruction complete after 0sDestroy complete! Resources: 2 destroyed.
```

I ran into some problems while completing this lab, for example Terraform couldn't find the provider:
```sh
│ Error: Invalid provider registry host
│
│ The host "registry.terraform.io" given in provider source address "registry.terraform.io/kreuzwerker/docker" does not offer a Terraform provider registry.
```

This was resolved by turning on the VPN.