
# Git Reset Practice

## Steps Taken

1. **Created a new branch**:

```bash
git checkout -b git-reset-practice
```

2. **Created a series of commits**:

- First commit:

```bash
echo "First commit" > file.txt
git add file.txt
git commit -m "First commit"
```

- Second commit:

```bash
echo "Second commit" >> file.txt
git add file.txt
git commit -m "Second commit"
```

- Third commit:

```bash
echo "Third commit" >> file.txt
git add file.txt
git commit -m "Third commit"
```

The logs showed the following commit history:

```bash
080466c (HEAD -> git-reset-practice) Third commit
3f315e3 Second commit
357ad06 First commit
```

3. **Used `git reset --soft`** to undo the last commit while keeping the changes staged:

```bash
git reset --soft HEAD~1
```

4. **Used `git reset --hard`** to undo the last commit and discard the changes:

```bash
git reset --hard HEAD~1
```

The commit history after `git reset --hard` was:

```bash
357ad06 (HEAD -> git-reset-practice) First commit
```

5. **Used `git reflog` to recover commits**:

The reflog command output was:

```bash
357ad06 (HEAD -> git-reset-practice) HEAD@{0}: reset: moving to HEAD~1
3f315e3 HEAD@{1}: reset: moving to HEAD~1
080466c HEAD@{2}: commit: Third commit
3f315e3 HEAD@{3}: commit: Second commit
357ad06 (HEAD -> git-reset-practice) HEAD@{4}: commit: First commit
```

6. **Recovered the commit using reflog**:

```bash
git reset --hard 6ca27ee
```

This recovered the commit `6ca27ee`.

## Explanation of `reset` and `reflog`

- `git reset --soft HEAD~1` moves the HEAD back one commit but keeps changes staged.
- `git reset --hard HEAD~1` moves the HEAD back one commit and discards any changes in the working directory.
- `git reflog` allows you to recover commits by showing a history of HEAD movements. You can reset to a specific point using the reflog hash.
