# Task 1

1. Created folder `.github/workflows` and file `github-actions-demo.yml`
2. Copy this code from the guid to yml file
    ```sh
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
3. Create a test commit and push it to check the action workflow result

    - Set up job
        ```sh
        Current runner version: '2.319.1'
        Operating System
        Runner Image
        Runner Image Provisioner
        GITHUB_TOKEN Permissions
        Secret source: Actions
        Prepare workflow directory
        Prepare all required actions
        Getting action download info
        Download action repository 'actions/checkout@v4' (SHA:692973e3d937129bcbf40652eb9f2f61becf3332)
        Complete job name: Explore-GitHub-Actions
        ```

    - Run echo

        ```sh
        Run echo "🎉 The job was automatically triggered by a push event."
        🎉 The job was automatically triggered by a push event.

        Run echo "🐧 This job is now running on a Linux server hosted by GitHub!"
        🐧 This job is now running on a Linux server hosted by GitHub!

        Run echo "🔎 The name of your branch is refs/heads/lab09 and your repository is Reelap13/F24-intro-labs."
        🔎 The name of your branch is refs/heads/lab09 and your repository is Reelap13/F24-intro-labs.
        ```

    - Check out repository code

        ```sh
        Run actions/checkout@v4

        Syncing repository: Reelap13/F24-intro-labs
        Getting Git version info
        Temporarily overriding HOME='/home/runner/work/_temp/5105e426-986f-40e4-b4f4-999082763bb4' before making global git config changes
        Adding repository directory to the temporary git global config as a safe directory
        /usr/bin/git config --global --add safe.directory /home/runner/work/F24-intro-labs/F24-intro-labs
        Deleting the contents of '/home/runner/work/F24-intro-labs/F24-intro-labs'
        Initializing the repository
        Disabling automatic garbage collection
        Setting up auth
        Fetching the repository
        Determining the checkout info
        /usr/bin/git sparse-checkout disable
        /usr/bin/git config --local --unset-all extensions.worktreeConfig
        Checking out the ref
        /usr/bin/git log -1 --format='%H'
        'cfbcca52fa252f2338777a435229ae2b5a757e68'
        ```

    - Run echo

        ```sh
        Run echo "💡 The Reelap13/F24-intro-labs repository has been cloned to the runner."
        💡 The Reelap13/F24-intro-labs repository has been cloned to the runner.
        
        Run echo "🖥️ The workflow is now ready to test your code on the runner."
        🖥️ The workflow is now ready to test your code on the runner.
        ```

    - List files in the repository

        ```sh
        Run ls /home/runner/work/F24-intro-labs/F24-intro-labs
        README.md
        index.html
        lab1.md
        lab10.md
        lab2.md
        lab3.md
        lab4.md
        lab5.md
        lab6.md
        lab7.md
        lab8.md
        lab9.md
        test.txt
        ```

    - Rub echo

        ``` sh
        Run echo "🍏 This job's status is success."
        🍏 This job's status is success.
        ```

    - Post Check out repository code

        ```sh
        Post job cleanup.
        /usr/bin/git version
        git version 2.46.1
        Temporarily overriding HOME='/home/runner/work/_temp/95aee08d-9987-4feb-8ac5-4dfbf134b9eb' before making global git config changes
        Adding repository directory to the temporary git global config as a safe directory
        /usr/bin/git config --global --add safe.directory /home/runner/work/F24-intro-labs/F24-intro-labs
        /usr/bin/git config --local --name-only --get-regexp core\.sshCommand
        /usr/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
        /usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
        http.https://github.com/.extraheader
        /usr/bin/git config --local --unset-all http.https://github.com/.extraheader
        /usr/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
        ```

    - Complete job

        ```sh
        Cleaning up orphan processes
        ```

### Observations

The workflow ran successfully when pushing changes without errors during the process
The workflow's code work correctly and display the expected outputs

# Task 2

1. Studied manual triggers
2. Modify my workflow to include the additional step for gathering system information

    I used a 'workflow_dispatched' to triggered from Github Action UI

    ```sh
    name: GitHub Actions Demo
    run-name: ${{ github.actor }} is testing out GitHub Actions 🚀
    on:  
        workflow_dispatch:
    jobs:
        Explore-GitHub-Actions:
            runs-on: ubuntu-latest
            steps:
            - name: Check out repository code
                uses: actions/checkout@v4

            - name: Display system information
                run: |
                echo "Displaying system information..."
                echo "Operating System Details:" > system_info.txt
                uname -a >> system_info.txt
                echo "CPU Details:" >> system_info.txt
                lscpu >> system_info.txt
                echo "Memory Details:" >> system_info.txt
                free -h >> system_info.txt
                echo "Disk Details:" >> system_info.txt
                df -h >> system_info.txt

            - name: Upload system info
                uses: actions/upload-artifact@v3
                with:
                name: system-info
                path: system_info.txt
    ```
3. Made the pull request from branch lab09 to master for using 'workflow_dispatched'

    ![alt text](image.png)

4. Ran the workflow yourself from Github Action UI

    I get the `system-info` artifacts file with system information

    ![alt text](image-1.png)

### Observation

Check the outputs in the `system-info` file

1. Operating System
    - Distribution: Ubuntu 22.04.1
    - Architecture: x86_64
2. CPU
    - Model: AMD EPYC 7763 64-core processor
    - Cores: 4
    - Virtualization Support: AMD-V
3. Memory
    - Total RAM: 15 GB with 663 MB used and 13 GB free
    - Swap Space: 4 GB allocated(but not used)
4. Disk
    - Root Filesystem: /dev/root is 73 GB with 52 GB used
    - Additional Filesystems: has additional filesystem `/mnt` with 74 GB