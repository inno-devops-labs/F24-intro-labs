

## Task 1: Understanding Git Data Storage

### Inspecting Contents with `git cat-file`

1. **Blob Inspection**:
   ```bash
   git cat-file -p 5b202ceb9edb9c9532cb9279347a278606b58b76
   ```
   **Output**:
   ```
   100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc    README.md
   100644 blob 5738bc15a0416ad2624df13badfb235052777e79    index.html
   100644 blob 7a94f7af59b8968be392288ea03179a24ffc9d9e    lab1.md
   040000 tree 481dbfcab761979f1dee9e428bf52c2f45d17474    lab1
   100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a    lab2.md
   040000 tree 1ae0368fdf59a3ad8b6315139ec78cea8d9b4c37    lab2
   100644 blob 2f8463cc188ec6ca69ae7a0f98d38e132280becb    lab3.md
   100644 blob d66a6867f90e48f6f44d9d80821aa1d866a24882    lab4.md
   ```

2. **Tree Inspection**:
   ```bash
   git cat-file -p 481dbfcab761979f1dee9e428bf52c2f45d17474
   ```
   **Output**:
   ```
   100644 blob 5ca21854d12f7fe4e43bebdcf945d9db2d8c68ac    submission1.md
   100644 blob 8b137891791fe96927ad78e64b0aad7bded08bdc    task1
   ```

3. **Commit Inspection**:
   ```bash
   git cat-file -p 2f8463cc188ec6ca69ae7a0f98d38e132280becb
   ```
   **Output**:
   ```
   # Version Control
   In this lab, you will learn about version control systems...
   ```

4. **Detailed Commit Log**:
   ```bash
   git cat-file -p 1eecb8e
   ```
   **Output**:
   ```
   tree 5b202ceb9edb9c9532cb9279347a278606b58b76
   parent 95e35cb6fdbc6b3594c5ba9659f7b564631a80e0
   author test <jovesfun@gmail.com> 1725572855 +0300
   committer test <jovesfun@gmail.com> 1725572855 +0300
   gpgsig -----BEGIN SSH SIGNATURE-----
   ...
   ```

## Task 2: Practicing Git Reset and Reflog

### Creating a New Branch
```bash
git checkout -b git-reset-practice
```

### Series of Commits

1. **First Commit**:
   ```bash
   echo "First commit" > file.txt
   git add file.txt
   git commit -m "First commit"
   ```

2. **Second Commit**:
   ```bash
   echo "Second commit" >> file.txt
   git add file.txt
   git commit -m "Second commit"
   ```

3. **Third Commit**:
   ```bash
   echo "Third commit" >> file.txt
   git add file.txt
   git commit -m "Third commit"
   ```

### Reset Operations

1. **Soft Reset to Previous Commit**:
   ```bash
   git reset --soft HEAD~1
   ```
   This reset moves the `HEAD` back by one commit without changing the working directory or index, keeping the changes staged for commit.

2. **Hard Reset to Previous Commit**:
   ```bash
   git reset --hard HEAD~1
   ```
   This reset moves `HEAD` back by one commit and wipes all changes, updating the working directory to match the commit state.

### Recovering Commits with Reflog

1. **Check Commit History in Reflog**:
   ```bash
   git reflog
   ```
   **Output**:
   ```
   b01e702 (HEAD -> git-reset-practice) HEAD@{0}: reset: moving to HEAD~1
   4e7779e HEAD@{1}: reset: moving to HEAD~1
   c742dc0 HEAD@{2}: commit: Third commit
   4e7779e HEAD@{3}: commit: Second commit
   b01e702 (HEAD -> git-reset-practice) HEAD@{4}: commit: First commit
   ```

2. **Recover Previous State**:
   ```bash
   git reset --hard 4e7779e
   ```
   **Output**:
   ```
   HEAD is now at 4e7779e Second commit
   ```

### Explanation of `git reset` and `git reflog`

- **`git reset`**: The `git reset` command is used to undo changes in the commit history. It moves the `HEAD` pointer and can be done in three modes: 
  - **Soft**: Keeps the changes staged (in the index).
  - **Mixed** (default): Moves changes to the working directory but unstage them.
  - **Hard**: Erases changes from the index and working directory.
  
- **`git reflog`**: This command shows a log of all references made to `HEAD` over time. It tracks changes to the branch pointer, allowing you to recover lost commits even after a hard reset.

---
