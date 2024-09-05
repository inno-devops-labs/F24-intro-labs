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
