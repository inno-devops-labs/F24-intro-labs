# Task 1. GitHub Actions Pipeline

I followed the [oficial GitHub guide](https://docs.github.com/en/actions/quickstart)

1. **Research.**

>GitHub Actions is a continuous integration and continuous delivery (CI/CD) platform that allows you to automate your build, test, and deployment pipeline.

There are preconfigured workflow templates for CI, Deployments, Code scanning, etc., and GitHub provides them when you create a new .yml file in the .github/workflows folder.

2. **Specified folder and configuration file.** I created .github/workflows directory and 'github-actions-demo.yml' file (copied from the tutorial) *in the lab9 branch*:

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
Here we can find the main fields of any pipeline: 
- '**name**' (name of a pipeline which can be found in the 'actions' field), 
- '**on: \[push\]**' (when the pipeline starts running; 'push' means a pipeline runs again when 'push' happens), 
- **jobs: job name, steps** (there might be several jobs with different steps; steps - actions that need to be done one by one; here the OS is ubuntu-latest and almost each step is printing a line, e.g. echo "🐧 This job is now running on a ${{ runner.os }} server hosted by GitHub!").

3. **Commit and check results.** I committed the configuration directly to the lab9 branch. Check the result in the 'Actions' section:

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/actions_page.png" alt="Actions page" width="800"/>

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/explore_page.png" alt="Explore page" width="800"/>

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/list_files.png" alt="List files" width="800"/>

Since the workflow triggers every time I push changes, I tested the workflow again by pushing the test_CICD.txt file into lab9 branch. The workflow has worked good.

4. **Documentation and observations.** I didn't face to any errors during the pipeline setting. I have already dealt with GitHub actions, and the key insight that I got is: it is highly convenient to use such pipelines for testing. Whenever you update your repository (change/add code or data) tests can be run automatically and the result will be fast and useful. You can detect any errors as soon as possible.


# Task 2. Manual Triggering and Gathering System Information

1. **Configure a Manual Trigger**
    - **Research**. The [official documentation](https://docs.github.com/en/actions/managing-workflow-runs-and-deployments/managing-workflow-runs/manually-running-a-workflow) says: "To run a workflow manually, the workflow must be configured to run on the `workflow_dispatch` event. To trigger the workflow_dispatch event, your workflow must be in the `default branch`". So, manual triggerring requires 'on: workflow_dispatch' and default master branch.

    - **Configuration extension.** I added the workflow_dispatch event into the existing .yml file:
    ```
    on: [push, workflow_dispatch]
    ```

        - I decided to try a new configuration file from [this tutorial](https://docs.github.com/en/actions/writing-workflows/choosing-when-your-workflow-runs/events-that-trigger-workflows#workflow_dispatch). But then I noticed that changes are supposed to be in the existing .yml file. So, there are commits with adding a new file and deleting a new file.
        - The workflow file is supposed to be placed in the default branch. So, I decided to complete this task in the lab9 branch and do a PR to the master with the workflow.

    - I did and accepted a PR from lab9 to master branch.

    - I ran the workflow manually:

    <img src="https://raw.githubusercontent.com/caxapb/New/main/data/manual_trig.png" alt="Manual trigger" width="800"/>


2. **Gather System Information:**
    - **Modifying the file.** To collect information about the runner, hardware specifications, and operating system details I added the following lines (from the lab7) into the configuration (jobs section) and did a PR into the master branch again:

    ```
    - name: Information gathering
        run: |
          echo "System information gathering..."
          lsb_release -a
          cat /etc/os-release
          cat /proc/version 
    ```
    - **Running the workflow.**
    
    <img src="https://raw.githubusercontent.com/caxapb/New/main/data/info_gathering.png" alt="Info gathering" width="800"/>

3. **Observations.** 
    - Manual triggering is a great and simple solution for automation. You can build, test, and deploy by pushing 1 button.
    - By default, “workflow_dispatch” works on the default branch. However, as I found out later, we can configure it for other branches as well: 
    ```
    on:
    workflow_dispatch:
        branches:
        - lab9
    ```
