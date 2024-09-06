# Task 1: Understanding Version Control Systems

Output from the git `cat-file`:

`my@user:~/.../F24-DevOps-intro-labs$ git cat-file -p 0bc0efa785a64cc840823b0f8194bc23119675e3`

```
Initial commit
Second Commit
```


# Task 2: Practice with Git Reset Command

1) I cerated a new branch git-reset-practice,

`git checkout -b git-reset-practice`

2) Created a series of commits:

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

3) `git reset --soft HEAD~1`

Moves the HEAD pointer but keep the changes staged.

`git reset --hard HEAD~1`

Reset both the HEAD and the working directory to the previous commit.

Now, the content of `file.txt` is as follows:

First commit


I keep track of HEAD with the command `git reflog`.

Also, with this command I can check the blob hash of commit.
I can recover previous commits in the following way:

```
git reflog
git reset --hard <reflog_hash>
```

What I did:
```
my@user:~/.../F24-DevOps-intro-labs/submission3$ git reset --hard bb631fb

HEAD is now at bb631fb Third commit
```

And I have the original content of `file.txt` is:

```
First commit
Second commit
Third commit
```
