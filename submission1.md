# Lab 1 Submission 
## Importance of Signed Commits

Signing commits helps verify the authenticity of the author and ensures that the commit has not been tampered with. It adds an additional layer of security, especially in collaborative environments, by enabling traceability and accountability .

## Merge Strategies in Git

### Standard Merge
Standard merge combines two branches by creating a merge commit. It preserves the history of both branches and is ideal for collaborative environments. It makes it easier to track changes over time, but can clutter the commit history with many commits.

### Squash and Merge
Squash and merge compresses all changes from a feature branch into a single commit. This simplifies the commit history but removes the granularity of individual changes.

### Rebase and Merge
Rebase and merge reapplies commits from a feature branch onto the base branch, creating a linear history. However, it can be risky in collaborative work as it rewrites history, making it harder to collaborate effectively.

### Preferred Strategy: Standard Merge
The standard merge strategy is often preferred because it preserves the full commit history and is better suited for collaboration, minimizing the risk of losing context or rewriting history.

