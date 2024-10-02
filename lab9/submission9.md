# Lab 9: CI/CD Lab - GitHub Actions

## Task 1: Create Your First GitHub Actions Pipeline

1. GitHub Actions is a powerful workflow automation tool that allows you to automate your development and deployment processes.

    * A workflow is a `.yml` file that defines the steps to be executed by GitHub Actions.

    * The workflow file is stored in the `.github/workflows` directory of the repository.

    * The `on` keyword is used to specify the trigger for the workflow, such as push or pull requests.

    * The `jobs` keyword is used to define a job, which is a set of steps that are executed on a runner.

    * The `steps` keyword is used to define individual steps within a job.

2. Creating workflow

```yml
name: Task1 Workflow

on:
  push:
    branches:
      - lab9

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
      - name: Run a command
        run: echo "Hello World!"
```

The workflow was triggered automatically when I pushed the changes to the repository.

The workflow executed successfully, and I saw the output "Hello World!" in the workflow logs.

The workflow was executed on an Ubuntu runner, and the actions/checkout@v2 action was used to checkout the code.

## Task 2: Gathering System Information and Manual Triggering

1. Modifying `first-task-workflow.yml`

```yml
name: Task2 Workflow

on:
  workflow_dispatch:
    inputs:
      manualTrigger:
        description: 'Trigger the workflow manually'
        required: true
        default: 'true'    

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
      - name: Run a command
        run: echo "Hello World!"
```
