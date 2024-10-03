## Task 1: Create Your First GitHub Actions Pipeline
### Steps:
1. I have created .github/workflows/github-actions-demo.yml in separate branch (after that merged to master for the 2 task) with the following content:
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

2. Then I click "Propose changes" button and go to Actions page:
![img.png](images/img.png)![img_1.png](images/img_1.png)![img_2.png](images/img_2.png)

3. Then I pushed 'test.py' file with hello world inside:
![img_3.png](images/img_3.png)![img_4.png](images/img_4.png)
It creates an action with the same jobs:
![img_5.png](images/img_5.png)

### Key concepts:
GitHub Actions is a CI/CD platform for automating build, test, and deployment pipelines. It allows workflows* to run tests on repository changes or deploy merged pull requests.

* **Workflows:** A workflow is an automated, configurable process that runs one or more jobs*. Defined in YAML files within the repository, workflows are triggered based on specific conditions.


* **Jobs:** A job consists of a series of steps within a workflow, executed on the runner.

## Task 2: Gathering System Information and Manual Triggering

1. **Configure a Manual Trigger**:

I decided to add trigger on 'on' list:![img_6.png](images/img_6.png)
Now I have this button!![img_7.png](images/img_7.png)
Which typically triggers the same jobs:![img_8.png](images/img_8.png)

2. **Gather System Information**:

I just added one more job with multiple commands in run for collecting and printing needed information:
![img_9.png](images/img_9.png)

The output:

![img_10.png](images/img_10.png)

...

![img_12.png](images/img_12.png)