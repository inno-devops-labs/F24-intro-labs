# Task 1: SSH Commit Signature Verification

**Signing commits is a security practice in Git.**

The most common commit signing techniques include ***SSH, GPG, and S/MIME.***
They are primarily used for authorship verification, allowing contributors to verify the authorship of commits (prove that the commit were indeed made by them).  

Sign tags or commits that are marked as verified assure others that the changes come from a trusted source. 


This practice is especially beneficial since it enforces: 

1. **Trustable integrity assurance**

A signed commit guarantess that since you made a commit, no one can modify it (if someone tries to alter a signed commit, the signature will become invalid).  


2. **Compliance with security policies**
   
This is important in industrial and commercial projects with strict security standards.

3. **Improved collaboration**
   
This is crucial, for example, in open-source and collaborative projects.

# Task 2: Merge Strategies in Git

- **Merge happens when combining several branches.**

- Merge commit is a regular commit which just happens to have several parent commits.

## Merge strategies 

### Standard Merge

The commits of branch A are added to the branch B. A new commit is created. A new **merge commit** is created. The commit history of A becomes a part of B's commit history. 


**Pros:**
- Commit history of A is preserved and remains unchanged.
- The merge commit clearly shows where branches were combined.

**Cons:**
- History might become messy, especially when many feature branches are merged frequently. 

### Squash and Merge

This technique squashes all the commits from the feature branch before merging (commit history of this branch is combined into a single commit).

**Pros:**
- The commit history in the base branch remains linear and clear since only a single commit is added for each feature/fix.


**Cons:**
- The detailed history of individual commits in the feature branch is lost after squashing. 


### Rebase and Merge

Rewrites the commit history of the feature branch, placing it on the top of the main branch, making its commit history linear. Reapplies comits from a feature branch onto the base branch. 

**Pros:**
- Creates a clean, linear history without merge commits, which is easier to follow.
  
**Cons:**
- Rebase alters the commit hashes, which can lead to confusion and conflicts if not managed carefully.

While Squash and Merge and Rebase and Merge are better suited for specific use cases when a clean history is more important than preserving every detail of the development process, the **Standard Merge strategy** is often preferred in collaborative environments. Standard Merge strategy has a significant advantage of maintaining unaltered, transparent history of all commits. These advantages make it easier for contributors to debug, fix features effectively. It is a safer and more straightforward approach. 