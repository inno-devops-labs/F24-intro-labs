# Task 1: Create Your First GitHub Actions Pipeline

## Following the Official GitHub Actions Quickstart Guide

1. Created a new repository on GitHub named "github-actions-demo".

2. In the repository, created a new file: `.github/workflows/github-actions-demo.yml`

3. Added the following content to the YAML file:

```yaml
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
        uses: actions/checkout@v3
      - run: echo "💡 The ${{ github.repository }} repository has been cloned to the runner."
      - run: echo "🖥️ The workflow is now ready to test your code on the runner."
      - name: List files in the repository
        run: |
          ls ${{ github.workspace }}
      - run: echo "🍏 This job's status is ${{ job.status }}."

4. Committed the new file to the main branch.

## Observing the Workflow Execution
1. After committing the workflow file, I navigated to the "Actions" tab in the GitHub repository. 
2. Observed that a new workflow run was triggered automatically due to the push event.
3. Clicked on the workflow run to see the details.
4. The workflow executed successfully.

## Task 2: Gathering System Information and Manual Triggering

### Configuring a Manual Trigger

I extended the existing GitHub Actions workflow to include a manual trigger by adding the `workflow_dispatch` event. The updated trigger section in the workflow file now looks like this:

```yaml
on:
  push:
    branches: [ main ]
  workflow_dispatch:
```

This change allows the workflow to be triggered manually from the GitHub Actions tab, in addition to the automatic trigger on push to the main branch.
Gathering System Information

I modified the workflow to include an additional step for gathering system information. The new step uses shell commands to collect information about the runner, hardware specifications, and operating system details. Here's the added step:
```yaml
- name: Gather system information
  run: |
    echo "🖥️ Runner Information:"
    echo "OS: ${{ runner.os }}"
    echo "Architecture: ${{ runner.arch }}"
    echo "🧰 Installed Software:"
    echo "Node version: $(node --version)"
    echo "npm version: $(npm --version)"
    echo "Python version: $(python --version)"
    echo "💾 Disk Space:"
    df -h
    echo "💻 CPU Info:"
    lscpu
    echo "🧠 Memory Info:"
    free -h
```

## Observations

After pushing these changes and manually triggering the workflow, I observed the following system information output:
```
🖥️ Runner Information:
OS: Linux
Architecture: X64
🧰 Installed Software:
Node version: v18.20.4
npm version: 10.7.0
Python version: Python 3.10.12
💾 Disk Space:
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        73G   52G   21G  72% /
tmpfs           7.9G  172K  7.9G   1% /dev/shm
tmpfs           3.2G  1.1M  3.2G   1% /run
tmpfs           5.0M     0  5.0M   0% /run/lock
/dev/sda15      105M  6.1M   99M   6% /boot/efi
/dev/sdb1        74G  4.1G   66G   6% /mnt
tmpfs           1.6G   12K  1.6G   1% /run/user/1001
💻 CPU Info:
Architecture:                         x86_64
CPU op-mode(s):                       32-bit, 64-bit
```

## Conclusion

Extending the workflow to include manual triggering and system information gathering has provided valuable insights into the GitHub Actions environment. This exercise has deepened my understanding of GitHub Actions' capabilities and the flexibility it offers in terms of workflow triggering and environment inspection.
