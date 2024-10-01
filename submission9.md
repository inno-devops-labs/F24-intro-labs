# CI/CD Lab with GitHub Actions

## Task 1: Observations
- Set up GitHub Actions and observed the workflow execution.
- Key concepts: workflows, jobs, steps, and triggers.
- Observed that `npm install` and `npm test` ran successfully.

## Task 2: Manual Triggering and System Information
- Enabled `workflow_dispatch` for manual triggering.
- Verified that the manual trigger works.

### Gathered System Information
- **Operating System:** Ubuntu 22.04.1
- **CPU:** AMD EPYC 7763 64-Core Processor (4 vCPUs)
- **Memory:** 15 GiB total, 14 GiB available
- **Disk Space:** 73G total, 21G available

### Changes Made
- Added `workflow_dispatch` to the workflow.
- Added system information gathering commands: `uname -a`, `lscpu`, `free -h`, and `df -h`.
