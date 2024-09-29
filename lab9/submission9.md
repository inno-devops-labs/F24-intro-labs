
# Lab 9: GitHub Actions

# Task 1.
## Introduction

GitHub Actions is a CI/CD platform that automates your build, test, and deployment pipelines. You can create workflows that run tests whenever you push code to your repository or deploy merged pull requests to production. In this document, we will guide you through setting up a basic GitHub Actions workflow and observe its execution.

## Key Concepts and Steps

### 1. **Understanding GitHub Actions**

- **Workflows**: Define automation processes.
- **Jobs**: Workflows contain one or more jobs.
- **Actions**: Each job consists of individual steps known as actions.
- **Runners**: GitHub-hosted virtual machines that execute workflows.

### 2. **Using Preconfigured Workflow Templates**

- GitHub provides preconfigured templates for different purposes like CI (Continuous Integration), deployment, automation, etc. You can use these templates as-is or customize them to suit your repository's needs.

### 3. **Prerequisites**

To create and run a GitHub Actions workflow, you must:
- Have a basic understanding of GitHub (repositories, branches, pull requests).
- Have a repository on GitHub.
- Ensure GitHub Actions is enabled for your repository.

### 4. **Creating the First Workflow**

#### Steps:
1. **Navigate to your repository**:
   - Go to the repository where you want to create the workflow.
   
2. **Create the `.github/workflows` directory**:
   - If the `.github/workflows` directory does not exist, create it.
   - In the directory, create a new `.yml` file.
   

3. **Add the workflow YAML**:
   - Copy the following YAML configuration into the `.yml` file:
   
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
           uses: actions/checkout@v4
         - run: echo "💡 The ${{ github.repository }} repository has been cloned to the runner."
         - run: echo "🖥️ The workflow is now ready to test your code on the runner."
         - name: List files in the repository
           run: |
             ls ${{ github.workspace }}
         - run: echo "🍏 This job's status is ${{ job.status }}."
   ```

   **Explanation**:
   - **`name`**: Sets the name of the workflow.
   - **`on`**: Specifies that the workflow should trigger on `push` events.
   - **`jobs`**: Defines a job `Explore-GitHub-Actions` that runs on the latest Ubuntu server.
   - Each **step** runs a command, from printing event details to listing files in the repository.

4. **Commit the changes**:
   - Choose whether to commit directly to the `main` branch or create a new branch and start a pull request.

### 5. **Viewing Workflow Results**

1. **Navigate to the Actions tab**:
   - Go to the repository's main page and click on the "Actions" tab.

2. **Check Workflow Details**:
   - Under the "Actions" tab, you will see the workflow listed.
     ![image](https://github.com/user-attachments/assets/a11a6168-0a91-44af-8dde-d430cd0f0e11)

3. **Click on the workflow to see a list of runs.**

    ![image](https://github.com/user-attachments/assets/4e503697-cd67-4ffc-9d89-b7060dbb8b77)

  
     

### 6. **Key Observations**

- **Event-driven Execution**: Workflows are triggered by events such as a `push`, making GitHub Actions highly customizable.
- **Ubuntu Runner**: The workflow ran on the latest Ubuntu environment hosted by GitHub, demonstrating the ability to run steps in different operating systems.
- **Contextual Information**: You can access contextual information, like the repository, branch name, and event name, using GitHub's provided contexts (e.g., `${{ github.actor }}`).
- **Actions Repositories**: Reusable actions like `actions/checkout@v4` make it easy to manage your code during the workflow.


# Task 2.

To add a manual trigger to the existing workflow, we need to use the workflow_dispatch event. This allows users to trigger the workflow manually from the GitHub interface.
I added the following block to include manual triggering:
```yaml
on: [push, workflow_dispatch]
```

After that, the workflow may be executed manually from Actions page on GitHub

![image](https://github.com/user-attachments/assets/bf83ea59-f10d-48fb-b95a-654fd8a03a6a)

#### Gathering System Information

- **Added a new step to gather system information**:
   - **`uname -a`**: Displays kernel and OS information.
   - **`df -h`**: Shows the available disk space in human-readable format.
   - **`free -h`**: Displays memory information including total, used, and available memory.


```yaml
 - run: |
          echo "📊 Collecting system information..."
          uname -a  
          df -h     
          free -h   
```
![image](https://github.com/user-attachments/assets/e9a0a5d7-58a4-4aab-9262-3ce51f126d6a)

## Conclusion

Setting up a basic GitHub Actions workflow is straightforward and provides valuable automation features. With event-driven triggers and a wide range of customization options, GitHub Actions can greatly enhance your CI/CD pipelines.






