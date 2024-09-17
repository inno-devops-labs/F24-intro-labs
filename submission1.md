# Merge strategies
1. **Standatd Merge**:
- Summary: just a regular merge.
- Pros:
    - Preserves the full commit history. 
    - Is easy to revert.
- Cons:
    - Too many commits create a lot of clutter, which is undesireable in complex projects.
2. **Squash and merge**:
- Summary: you combine some consecutive commits into a single commit.
- Pros:
    - Clean history.
    - Developmental "steps" feel more distinct.
- Cons:
    - Loss of all squashed commits' messages.
    - Therefore, it's harder to track the changes.
3. **Rebase and Merge**:
- Summary: Reapplies commits from the feature branch onto the base barnch in the same order, without actually merging.
- Pros:
    - No merge commits, somewhat cleaning up the tree.
- Cons: 
    - Prone to conflicts between collaborators, therefore requiring more care.

Standatd Merge is often preferred because it maintains a complete history, which is important for debugging.