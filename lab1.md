# Lab 1: Introduction to DevOps with Git

## Overview

This lab assignment introduces you to Git and its essential operations. You will complete two tasks focusing on commit signing and understanding merge strategies. Follow the tasks below to complete the lab assignment.

## Task 1: SSH Commit Signature Verification

**Objective**: Understand the importance of commit signing using SSH keys and set up commit signature verification.

1. **Explore the Importance of Signed Commits**:
   - **Research**: Learn why commit signing is crucial for verifying the integrity and authenticity of commits.
     - Resources:
       - [GitHub Docs on SSH Commit Verification](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification)
       - [Atlassian's Guide to SSH and Git](https://confluence.atlassian.com/bitbucketserver/sign-commits-and-tags-with-ssh-keys-1305971205.html)
   - **Summary**: Create a submission1.md file. Write a brief summary explaining the benefits of signing commits.

2. **Set Up SSH Commit Signing**:
   - **Option 1: Use an Existing SSH Key**:
     - Ensure you have an existing SSH key pair.
     - Add the public key to your GitHub account.
       - [GitHub Guide to Adding SSH Key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

   - **Option 2: Generate a New SSH Key (Recommended: ed25519 Format)**:
     - Generate a new SSH key pair using the ed25519 format.

       ```sh
       ssh-keygen -t ed25519 -C "your_email@example.com"
       ```

     - Add the public key to your GitHub account.
       - [GitHub Guide to Adding SSH Key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

   - Configure Git to use your new SSH key for signing commits.

     ```sh
     git config --global user.signingkey <YOUR_SSH_KEY>
     git config --global commit.gpgSign true
     git config --global gpg.format ssh
     ```

3. **Make a Signed Commit**:
   - Create and sign a commit.

     ```sh
     git commit -S -m "Your signed commit message"
     ```

   - Push the commit with your submission1.md file.

## Task 2: Merge Strategies in Git

**Objective**: Research the differences between merge strategies in Git and modify repository settings to allow only the standard merge strategy.

1. **Research Merge Strategies**:
   - **Standard Merge**: Combines two branches by creating a merge commit.
   - **Squash and Merge**: Combines all commits from a feature branch into a single commit before merging.
   - **Rebase and Merge**: Reapplies commits from a feature branch onto the base branch.
   - **Summary**: Write a brief summary comparing these merge strategies in the submission1.md file, including their pros and cons. Highlight why the standard merge strategy is often preferred in collaborative environments.

     Resources:
     - [GitHub Docs on Merging](https://docs.github.com/en/pull-requests/collaborating-with-issues-and-pull-requests/about-pull-request-merge-squash-and-rebase)
     - [Atlassian Git Tutorials](https://www.atlassian.com/git/tutorials/using-branches/merge-strategy)

2. **Modify Repository Settings**:
   - **Disable Squash and Rebase Merge**:
     - Go to the Settings page of your forked repository on GitHub.
     - Navigate to the "Options" section.

## Additional Resources

- [Git Documentation](https://git-scm.com/doc)
- [GitHub Guides](https://guides.github.com/)

### Guidelines

- Use proper Markdown formatting for documentation files.
- Organize files with appropriate naming conventions.
- Create a PR from your fork to the master branch of this repository with your completed lab assignment.

> Note: Please check the links and thoroughly read the documentation to gain new knowledge and enhance your Git skills.

## Summary of comparing merge strategies

1. **Standard Merge**
Creates a new merge commit that combines changes from both branches while preserving their individual histories.
Pros: Maintains a complete history of changes which facilitates tracking the changing of the project's content.
Cons: Can result in numerous additional commits making the project's history larger and potentially more challenging to understand.

2. **Squash and Merge**
Combines all commits from a feature branch into a single commit and adds it to the target branch.
Pros: Simplifies the commit history by consolidating multiple commits into a single, cohesive commi, which can make the history cleaner and more readable.
Cons: Loses detailed history of individual commits making it more difficult to track specific changes and understand the context in which they were made.

3. **Rebase and Merge**
Reapplies commits from a feature branch into the latest version of the base branch creating a linear commit history.
Pros: Maintains a clean and linear history of changes that simplifies the understanding of changes and their context.
Cons: The commit history is rewritten so may complicate the analysis of changes

4. **The standard merge strategy is often preferred in collaborative environments**
Preserves the complete history of changes, facilitates conflict resolution and enhances clarity in the collaborative workflow.