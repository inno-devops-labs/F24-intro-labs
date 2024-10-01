# Task 1: SSH Commit Signature Verification
Signed commits help ensure the authenticity and integrity of commits.
They verify that a commit comes from a trusted source and has not been tampered with.
## Benefits of Signing Commits
1. **Author Verification**: Confirms the identity of the commit author.
2. **Data Integrity**: Ensures the commit has not been altered since it was signed.
3. **Trust in Collaboration**: Builds confidence in projects with multiple contributors.
4. **Security**: Prevents unauthorized commits or identity impersonation.
5. **Compliance**: Helps meet audit and regulatory requirements.
# Task 2: Merge Strategies in Git
## Standard Merge
- **Pros**: Retains full commit history and development context.
- **Cons**: Can create a cluttered history in busy repositories.
## Squash and Merge
- **Pros**: Combines all commits into a single commit, simplifying the history.
- **Cons**: Loses detailed history of individual commits.
## Rebase and Merge
- **Pros**: Creates a linear history, making it easier to follow.
- **Cons**: Rewrites commit history, which can cause conflicts in collaborative projects.
## Why Standard Merge is Preferred
- Standard Merge is often preferred because it maintains the full history, making it easier to track changes and collaborate without conflicts.
