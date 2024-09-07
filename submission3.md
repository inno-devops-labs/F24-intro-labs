# Git Object Inspection

## Commit Object
```
tree ac3739c940c79edb6bf7d682d99cf3c4994fc0dc
parent 4091cb4814de5fba2f9e36cc2be763b0635ab50b
author Nursultan <nuuti.talant@gmail.com> 1725729074 +0300
committer Nursultan <nuuti.talant@gmail.com> 1725729074 +0300
gpgsig -----BEGIN SSH SIGNATURE-----
 U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgpKm0Bxerjbn4m0+EFioy1AOJHM
 9KAUoxi/XG7/IFIM8AAAADZ2l0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5
 AAAAQEplfxUWtdEOkazUimFnDhhyi1exTTnbynjcn2r0VllxtiukzxLeKyP5Cd12VTaYsd
 UM+jweEQZUhvoqX6zEdA8=
 -----END SSH SIGNATURE-----

Updated file1.txt
```

## Tree Object
```
100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc	README.md
100644 blob 9251baa8f12b2904a2c585af68be707586e95be4	file1.txt
100644 blob 4ab7e6dbb9b1dd73a3e0292ef1d1b2909d107309	file2.txt
100644 blob 5738bc15a0416ad2624df13badfb235052777e79	index.html
100644 blob 7a94f7af59b8968be392288ea03179a24ffc9d9e	lab1.md
100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a	lab2.md
100644 blob 2f8463cc188ec6ca69ae7a0f98d38e132280becb	lab3.md
100644 blob d66a6867f90e48f6f44d9d80821aa1d866a24882	lab4.md
```

## Blob Object
```
This is file 2
```

## Task 2: Practice with Git Reset Command

### Steps Taken:

1. Created a new branch:
   ```
   git checkout -b git-reset-practice
   ```

2. Created a series of commits:
   ```
   echo "First commit" > file.txt
   git add file.txt
   git commit -m "First commit"

   echo "Second commit" >> file.txt
   git add file.txt
   git commit -m "Second commit"

   echo "Third commit" >> file.txt
   git add file.txt
   git commit -m "Third commit"
   ```

3. Used git reset --soft:
   ```
   git reset --soft HEAD~1
   ```
   This moved the HEAD pointer back one commit, but kept the changes in the staging area.

4. Used git reset --hard:
   ```
   git reset --hard HEAD~1
   ```
   This moved the HEAD pointer back one commit and discarded all changes.

5. Used git reflog to recover commits:
   ```
   git reflog
   git reset --hard 3cc89e3
   ```

### Explanation of Reset and Reflog Process:



- `git reset --soft` moves the HEAD pointer to a specified commit, but keeps the changes in the staging area. This is useful when you want to undo commits but keep the changes to recommit them differently.

- `git reset --hard` moves the HEAD pointer to a specified commit and discards all changes. This is useful when you want to completely undo commits and start fresh from a previous state.

- `git reflog` shows a log of all recent actions in the repository. It's extremely useful for recovering lost commits or branches, especially after a hard reset.

By using these commands, we can navigate through our commit history, undo changes, and even recover seemingly lost commits. This demonstrates the power and flexibility of Git in managing project history.
