## Task 1

1. First of all, I created `submission3.md` file and made a commit with message `"test commit 1"`. After that, I created `test_commit2.txt` file and made another commit with message `"test commit 2"`.

2. With `git log` command I found the hash of my commits.

**Output**

```
commit c4bee9c032ce3dc5d127d135e76de34131d3840d (HEAD -> lab3)
Author: Arina Goncharova <a.goncharova@innopolis.university>
Date:   Wed Sep 11 22:54:33 2024 +0300

    test commit 2

commit f4670e8f37945f7d4c149f5a58fbabcf9306fc84
Author: Arina Goncharova <a.goncharova@innopolis.university>
Date:   Wed Sep 11 22:52:49 2024 +0300

    test commit 1

commit 6ade7fdfa1fe2192c8f3e247ed8b24d5d7ff6b30
Author: Dmitriy Creed <creed@soramitsu.co.jp>
Date:   Thu Aug 29 16:34:32 2024 +0300

Upload lab1 Git Intro & lab2 IPFS, fleek

    Signed-off-by: Dmitriy Creed <creed@soramitsu.co.jp>
```

3. Check the commit object of the first commit to see its content.

```
git cat-file commit f4670e8f37945f7d4c149f5a58fbabcf9306fc84
```

**Output**

```
tree 1315b25e4ef536af9c235b6cedcbc01ccd747968
parent 6ade7fdfa1fe2192c8f3e247ed8b24d5d7ff6b30
author Arina Goncharova <a.goncharova@innopolis.university> 1726084369 +0300
committer Arina Goncharova <a.goncharova@innopolis.university> 1726084369 +0300
gpgsig -----BEGIN SSH SIGNATURE-----
 U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAg1rT3SLSPLJy9cINsoGs+ValQbA
 nIm7dMQvVnC0IbaeQAAAADZ2l0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5
 AAAAQLInQYIDd0kFdSfDvcbNmhQh1gNslefrT3YddvQDhCejxHkA4v0B3Vd82s4lnEaIEL
 CKZRiNyqfLjyqAegpgFg8=
 -----END SSH SIGNATURE-----

test commit 1
```

4. Check the tree object that the first commit is pointing to.

```
git cat-file -p 1315b25e4ef536af9c235b6cedcbc01ccd747968
```

**Output**

```
100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc    README.md
100644 blob 5738bc15a0416ad2624df13badfb235052777e79    index.html
100644 blob 1dba99957c3bb59d40913294b83e40d5c38b6c0b    lab1.md
100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a    lab2.md
100644 blob cfb56c4a68996f029aa1316475a9c74978b7cf3c    submission3.md
```

4. The content of the blob object (content of file index.html):

```
git cat-file -p 5738bc15a0416ad2624df13badfb235052777e79
```

**Output**

```
<!DOCTYPE html>
<!-- You can modify it as you wish -->
<html>
<head>
    <title>My Simple Website</title>
</head>
<body>
    <h1>Welcome to My Simple Website</h1>
    <p>This is the content of the folder.</p>
    <ul>
        <li>File 1</li>
        <li>File 2</li>
        <li>File 3</li>
    </ul>
</body>
</html>%
```

## Task2

1. I created a new branch.

```
git checkout -b git-reset-practice
```

2. Added line «First commit» to the file file.txt and committed this change.

```
echo "First commit" > file.txt
git add file.txt
git commit -m "First commit"
```

3. Added line «Second commit» to the file file.txt and committed this change.

```
echo "Second commit" >> file.txt
git add file.txt
git commit -m "Second commit"
```

4. Added line «Third commit» to the file file.txt and committed this change.

```
echo "Third commit" >> file.txt
git add file.txt
git commit -m "Third commit"
```

5. Check the status.

```
git status
```

**Output**

```
On branch git-reset-practice
nothing to commit, working tree clean
```

### Soft reset

6. Lets try soft reset:

```
git reset --soft HEAD~1
```

The content of file.txt didn’t changed, but the changes became uncommited.

7. Check the status

```
git status
```

**Output**

```
On branch git-reset-practice
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   file.txt
```

8. Check the location of the HEAD.

```
git show head
```

**Output**

```
commit 2808840bcd81ac1c49279b2f4415bc9c2c067d3c (HEAD -> git-reset-practice)
Author: Arina Goncharova <a.goncharova@innopolis.university>
Date:   Sat Sep 7 15:06:37 2024 +0300

    Second commit

diff --git a/file.txt b/file.txt
index 6eaf244..6a3adff 100644
--- a/file.txt
+++ b/file.txt
@@ -1 +1,2 @@
 First commit
+Second commit

```

9. Commit staged changes.

```
git commit -m "Third commit v2"
```

10. Check the status

```
git status
```

**Output**

```
On branch git-reset-practice
nothing to commit, working tree clean
```

The content of the file.txt now:

```
First commit
Second commit
Third commit
```

11. Check where is the head

```
git show head
```

**Output**

```
commit 9895729ad67d8002629b52516f064a4349525a2d (HEAD -> git-reset-practice)
Author: Arina Goncharova <a.goncharova@innopolis.university>
Date:   Sat Sep 7 16:20:38 2024 +0300

    Third commit v2

diff --git a/file.txt b/file.txt
index 6a3adff..5b3c010 100644
--- a/file.txt
+++ b/file.txt
@@ -1,2 +1,3 @@
 First commit
 Second commit
+Third commit
```

### Reset hard

12. Lets try reset hard:

```
git reset --hard HEAD~1
```

**Output**

```
HEAD is now at 2808840 Second commit
```

The content of file.txt:

```
First commit
Second commit
```

13. Check the status

```
git status
```

**Output**

```
On branch git-reset-practice
nothing to commit, working tree clean
```

### Reflog

14. Show the changes of HEAD

```
git reflog
```

**Output**

```
2808840 (HEAD -> git-reset-practice) HEAD@{0}: reset: moving to HEAD~1
9895729 HEAD@{1}: commit: Third commit v2
2808840 (HEAD -> git-reset-practice) HEAD@{2}: reset: moving to HEAD~1
7c6f07a HEAD@{3}: commit: Third commit
2808840 (HEAD -> git-reset-practice) HEAD@{4}: commit: Second commit
b84f00d HEAD@{5}: commit: First commit
bf1e711 (origin/master, origin/HEAD, master) HEAD@{6}: checkout: moving from master to git-reset-practice
bf1e711 (origin/master, origin/HEAD, master) HEAD@{7}: pull: Fast-forward
6ade7fd (lab3) HEAD@{8}: checkout: moving from lab3 to master
6ade7fd (lab3) HEAD@{9}: checkout: moving from master to lab3
6ade7fd (lab3) HEAD@{10}: checkout: moving from lab1 to master
f820c52 (origin/lab1, lab1) HEAD@{11}: commit: lab1 done
110f53e HEAD@{12}: checkout: moving from lab2 to lab1
2254119 (origin/lab2, lab2) HEAD@{13}: commit: lab2 done
6ade7fd (lab3) HEAD@{14}: checkout: moving from master to lab2
6ade7fd (lab3) HEAD@{15}: checkout: moving from lab1 to master
110f53e HEAD@{16}: commit: lab1 done
8fd9cbb HEAD@{17}: commit: My signed commit
f9351d2 HEAD@{18}: commit: Your signed commit message
68371bb HEAD@{19}: commit: My signed commit message
e62a829 HEAD@{20}: commit: My first signed commit
211c2e3 HEAD@{21}: commit: My first signed commit
6ade7fd (lab3) HEAD@{22}: checkout: moving from master to lab1
6ade7fd (lab3) HEAD@{23}: clone: from https://github.com/arinagoncharova2005/F24-intro-labs.git
```

15. Go back to Third commit

```
git reset --hard 7c6f07a
```

**Output**

```
HEAD is now at 7c6f07a Third commit
```

16. Check the status

```
git status
```

**Output**

```
On branch git-reset-practice
nothing to commit, working tree clean
```

17. I decided to experiment more

Go back to Second commit

```
git reset --hard 2808840
```

```
HEAD is now at 2808840 Second commit
```

Go back to First commit

```
git reset --hard b84f00d
```

```
HEAD is now at b84f00d First commit
```

Go back to Third commit

```
git reset --hard 7c6f07a
```

```
HEAD is now at 7c6f07a Third commit
```

18. Push the final state to GitHub

```
git push origin git-reset-practice
```

### Reset explanation

The `git reset --hard` command returns repository to the specified commit without preserving the changes you have made after making specified commit and before running reset command.

But `git reset --soft` returns repository to the state corresponding to the given commit with all modifications being staged but uncommitted.

### Reflog explanation

`reflog` command is used to see the changes of HEAD. Using this info and `reset` we can recover to the needed state.
