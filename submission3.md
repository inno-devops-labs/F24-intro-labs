# Introduction to DevOps Lab 1
## Ruslan Izmailov B22-DS-01 

### Task 1: Understanding Version Control Systems
1) Done a commit
```sh
> echo "some text" > temp.txt
> git add temp.txt
> git commit -S -m "task: 3rd task commit creation"
```

2) Inspected the commit history via git log
```sh
> git log

commit 7dc36359e3965cf9950c0c3130c592efd428570d (HEAD -> lab03)
Author: Ruslan Izmailov <r.izmajlov2018@yandex.ru>
Date:   Wed Sep 11 15:22:36 2024 +0300

    task: 3rd task commit creation
```

3)  Inspected the data of the last commit 
```sh
> git cat-file -p 7dc36359e3965cf9950c0c3130c592efd428570d

tree 91c65694a46c142250576b49bd26b3379babfd2f
parent f5a9e93d0941ef3452cdc396a13b66c47e569ac0
author Ruslan Izmailov <r.izmajlov2018@yandex.ru> 1726057356 +0300
committer Ruslan Izmailov <r.izmajlov2018@yandex.ru> 1726057356 +0300
gpgsig -----BEGIN SSH SIGNATURE-----
<here was some ssh key>
     -----END SSH SIGNATURE-----

task: 3rd task commit creation
```

4) Inspcected the commit tree
```sh 
> git cat-file -p 91c65694a46c142250576b49bd26b3379babfd2f

100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc    README.md
100644 blob 5738bc15a0416ad2624df13badfb235052777e79    index.html
100644 blob 7a94f7af59b8968be392288ea03179a24ffc9d9e    lab1.md
100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a    lab2.md
100644 blob 2f8463cc188ec6ca69ae7a0f98d38e132280becb    lab3.md
100644 blob d66a6867f90e48f6f44d9d80821aa1d866a24882    lab4.md
100644 blob 7b57bd29ea8afbdeb9bac64cf7074f4b531492a8    temp.txt
``` 

5) Inspected the blob of _temp.txt_ 
```sh
> git cat-file -p 7b57bd29ea8afbdeb9bac64cf7074f4b531492a8
some text
```

### Task 2: Practice with Git Reset Command

1) Done required steps 
```sh
> git checkout -b git-reset-practice

> echo "First commit" > file.txt
> git add file.txt
> git commit -m "First commit"

> echo "Second commit" >> file.txt
> git add file.txt
> git commit -m "Second commit"

> echo "Third commit" >> file.txt
> git add file.txt
> git commit -m "Third commit"
```

2) Tried soft reset: 
```sh
> git reset --soft HEAD~1
```

Shifted the HEAD pointer one commit back and saved all changes. 

```sh
> git reflog
> git  reset --hard 91d787f   
```

Shifted the HEAD pointer back to last commit. 

3) Tried hard reset: 
```sh
> git reset --hard HEAD~1
```

Shifted the HEAD pointer one commit back and discarded the changes of the last commit. 

```sh
> git reflog
> git  reset --hard 91d787f   
```

Shifted the HEAD pointer back to last commit.

#### Summary: 
1) ___git reset --soft___ would be useful if it is required to undo some commits, but keep the changes. 
2) ___git reset --hard___ would be useful to remove commits and back project to some previous state.  
