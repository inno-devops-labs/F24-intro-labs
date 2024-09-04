# Task 1
1. To give other people confidence about the origin of a change you have made. So they can trust this commit.
2. To give ability to a repository administrators to enforce required commit signing on a branch to block all commits that are not signed and verified. So if everybody in the team use signed commits, there is no problem to block commits without sign or verification. And this gives some kind of protection to the repository.
# Task 2
### Standard Merge
**Pros:**
- Maintains full commit history

**Cons:**
- Creates merge commit and makes commit history less readable

### Squash and Merge
**Pros:**
- Makes the commit history clean by "squashing" multiple commits into one

**Cons:**
- You lose information about when specific changes were originally made and who authored the squashed commits
- If you continue working on the same branch, squashed commits may reappear in new pull requests
- The SHA IDs of the original commits are lost, making some git operations harder

### Rebase and Merge
**Pros:**
- Linear history, easier to follow

**Cons:**
- Rewriting history can lead to conflicts, and force-pushing may overwrite other contributors' work
- GitHub cannot sign the rebased commits

### Why the standard merge strategy is often preferred in collaborative environments?
It provides full visibility of changes, so it's much easier to understand contribution of collaborators, to review and to troubleshoot.