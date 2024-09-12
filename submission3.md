# Lab 3 - Understanding Version Control Systems

## Task 1: Git Internal Objects


### 1. Commit Object

#### Command:
```bash

git cat-file -p 9828d00

```

#### Output:
```bash
tree 380502792a46d8ba9aed53a8c762d99319ce5d80
parent 15e7e68cc036cb965d8fe09b4a664e0b199104ab
author Nayalaith <nayallaith@gmail.com> 1725920473 +0300
committer Nayalaith <nayallaith@gmail.com> 1725920473 +0300

```
Added file2.txt

### 2. Tree Object
#### Command:
```bash
git cat-file -p 380502792a46d8ba9aed53a8c762d99319ce5d80
```

#### Output:
```bash
100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc	README.md
100644 blob 5b3c010a011b95052efe998176ef18ca8efd4adf	file.txt
100644 blob 4c5fd919d52e3c1b08f7924cfa05d6de100912fd	file1.txt
100644 blob 20d5b672a347112783818b3fc8cc7cd66ade3008	file2.txt
100644 blob 5738bc15a0416ad2624df13badfb235052777e79	index.html
100644 blob 7a94f7af59b8968be392288ea03179a24ffc9d9e	lab1.md
100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a	lab2.md
```
### 3. Blob

#### Command:
```bash
git cat-file -p 4c5fd919d52e3c1b08f7924cfa05d6de100912fd
```

#### Output:
```bash
First file
```


## Task 2: Practice with Git Reset Command

### 1. Create a New Branch

To start the practice, we created a new branch named `git-reset-practice`:

```bash
git checkout -b git-reset-practice
```
### 2. Create a Series of Commits

```bash
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

### 3. Use git reset

```bash
git reset --soft HEAD~1
```

```bash
git reset --hard HEAD~1
```

#### Hard reset command Output:
```bash
HEAD is now at 6b142f3 Solved Task1
```

### 4. Use git reflog
```bash
git reflog

```
#### Reflog Output:

```bash
4c29ea9 (HEAD -> git-reset-practice) HEAD@{0}: reset: moving to HEAD~1
30e4fce HEAD@{1}: reset: moving to HEAD~1
d3110e9 HEAD@{2}: commit: Third commit
30e4fce HEAD@{3}: commit: Second commit
4c29ea9 (HEAD -> git-reset-practice) HEAD@{4}: commit: First commit
6b142f3 (origin/lab3, lab3) HEAD@{5}: checkout: moving from lab3 to git-reset-practice
6b142f3 (origin/lab3, lab3) HEAD@{6}: commit: Solved Task1
9828d00 HEAD@{7}: commit: Added file2.txt
15e7e68 HEAD@{8}: commit: Added file1.txt
1f456e9 HEAD@{9}: checkout: moving from lab2 to lab3
12dc232 (origin/lab1, lab2, lab1) HEAD@{10}: checkout: moving from lab3 to lab2
1f456e9 HEAD@{11}: checkout: moving from lab3 to lab3
1f456e9 HEAD@{12}: commit: Third commit
015b986 HEAD@{13}: commit: Second commit
87109b5 HEAD@{14}: commit: First commit
b48e6b0 (origin/master, origin/HEAD, master) HEAD@{15}: checkout: moving from master to lab3
b48e6b0 (origin/master, origin/HEAD, master) HEAD@{16}: pull origin master: Fast-forward
82ae08b HEAD@{17}: checkout: moving from lab1 to master
12dc232 (origin/lab1, lab2, lab1) HEAD@{18}: checkout: moving from lab2 to lab1
12dc232 (origin/lab1, lab2, lab1) HEAD@{19}: commit: Lab2 Task1
82ae08b HEAD@{20}: checkout: moving from master to lab2
82ae08b HEAD@{21}: commit: solved task1 and task2
06580a9 HEAD@{22}: commit: Added Summary On Signed Commits
61404c0 HEAD@{23}: clone: from https://github.com/Nayalaith/F24-intro-labs.git
```
#### Recover Commits
```bash
git reset --hard 4c29ea9
```
#### Output:
```bash
HEAD is now at 4c29ea9 First commit
```
