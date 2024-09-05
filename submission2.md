The SSH key allows you to sign a commit, thereby separating commits not only from different accounts, but also from different devices, separating authors. This allows not only to more accurately determine the personal contribution of each, but also provides additional opportunities to track compromised commits, protecting the project from malicious changes.

Merge strategies

Standart Merge:
pros - shows the history of both branches
cons - creates a new commit even if the changes can be merged automatically without conflicts

Squash and Merge:
pros - keep the commit history on the current branch clean
cons - no separate commits

Rebase and Merge:
pros - does not create merge commit
cons - works only if it can be done as a fast-forward merge

