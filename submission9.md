# Task 1: Create GitHub Actions Pipeline

1) I have created `.github/workflows/github-actions-demo.yml` file in the root directory of the repository.
2) Filled in the config provided in the tutorial
```
name: GitHub Actions Demo
run-name: ${{ github.actor }} is testing out GitHub Actions 🚀
on: [push]
jobs:
  Explore-GitHub-Actions:
    runs-on: ubuntu-latest
    steps:
      - run: echo "🎉 The job was automatically triggered by a ${{ github.event_name }} event."
      - run: echo "🐧 This job is now running on a ${{ runner.os }} server hosted by GitHub!"
      - run: echo "🔎 The name of your branch is ${{ github.ref }} and your repository is ${{ github.repository }}."
      - name: Check out repository code
        uses: actions/checkout@v4
      - run: echo "💡 The ${{ github.repository }} repository has been cloned to the runner."
      - run: echo "🖥️ The workflow is now ready to test your code on the runner."
      - name: List files in the repository
        run: |
          ls ${{ github.workspace }}
      - run: echo "🍏 This job's status is ${{ job.status }}."
```

This GitHub Actions workflow triggers on a push event and runs on an Ubuntu server. It checks out the repository code, 
displays information about the event, runner, branch, and repository, lists the repository files, and reports the job's status.

3) Commited and pushed the changes
4) Test has been performed in 21 seconds and passed. In each cell I could see the output
![img.png](img.png)

# Task 2: Gathering System Information and Manual Triggering

1) Configuring manual triggering

I have added a workflow_dispatch event, which allows the workflow to be triggered manually in addition to the push event.

In order to be able to manually run the workflow, I need to put github-actions yaml file in the root branch of the repository. 
```
...
on:
  push:
  workflow_dispatch:  # Added to allow manual triggering
...
```
Now I can trigger the workflow manually in the Actions tab.

2) Gather System Information
```
...
- name: Gather system information
run: |
  echo "Collecting system information..."
  echo "OS and Kernel Version:"
  uname -a
  echo "Disk Space Information:"
  df -h
  echo "CPU Information:"
  lscpu
...
```

The output is as follows:
```
Collecting system information...

OS and Kernel Version:
Linux fv-az975-457 6.8.0-1014-azure #16~22.04.1-Ubuntu SMP Thu Aug 15 21:31:41 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux

Disk Space Information:
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        73G   52G   21G  72% /
tmpfs           7.9G  172K  7.9G   1% /dev/shm
tmpfs           3.2G  1.1M  3.2G   1% /run
tmpfs           5.0M     0  5.0M   0% /run/lock
/dev/sdb15      105M  6.1M   99M   6% /boot/efi
/dev/sda1        74G  4.1G   66G   6% /mnt
tmpfs           1.6G   12K  1.6G   1% /run/user/1001

CPU Information:
Architecture:                         x86_64
CPU op-mode(s):                       32-bit, 64-bit
Address sizes:                        48 bits physical, 48 bits virtual
Byte Order:                           Little Endian
CPU(s):                               4
...
```