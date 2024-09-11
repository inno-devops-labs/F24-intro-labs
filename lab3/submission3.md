# Lab 3: Version Control

## Task 1

Input:

```shell
git cat-file -p a5bdf48f80eeab6a0dd264d0fe62d182812552c0
```

Output:

```shell
100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc    README.md
100644 blob 5738bc15a0416ad2624df13badfb235052777e79    index.html
040000 tree 1d8717fd93828305bf34a3b85ccba012ed8bde9e    lab1
```

Input:

```shell
git cat-file -p 3064dc3efc14f45f49deba51c158562e7f0e4ea4
```

Output:

```shell
tree a5bdf48f80eeab6a0dd264d0fe62d182812552c0
parent 86e63c8aa040bb43de0f84d206854eb90f9696c9
author 1kkiren <1kkiren@mail.ru> 1725486480 +0300
committer 1kkiren <1kkiren@mail.ru> 1725486480 +0300
gpgsig -----BEGIN SSH SIGNATURE-----
 U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgwrsNQFH3Mv81txIb9WGxBxTgux
 Dz03WnB2uoFBTPwvwAAAADZ2l0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5
 AAAAQET60W6Lc4vEYqJ8WlO7tuFuayobpscgIubAtkJjfptoRZtd3LzYnufAJh+1azM1is
 rGfe1oMHOEuaPHtSxqJgE=
 -----END SSH SIGNATURE-----

[Update] week1 task2
```

Input:

```shell
git cat-file -p ede183da8ef201e5f5737eea502edc77fd8a9bdc
```

Output:

```shell
# DevOps Introduction Course: Learn the Fundamentals of DevOps

Welcome to the DevOps Introduction Course, where you will gain a solid foundation in DevOps principles and practical skills. This course is designed to provide you with a comprehensive understanding of DevOps and its key components. Through hands-on labs and lectures, you will learn about various topics such as version control, software distribution, CI/CD, containers, and cloud computing.

## Course Overview

In this course, we will cover the following topics:

1. Introduction to DevOps: Understand the core principles and concepts of DevOps.
2. Tooling: Explore the essential tools used in the DevOps ecosystem.
3. Version Control: Learn about version control systems and their importance in collaborative software development.
4. Software Distribution: Gain insights into software distribution strategies and best practices.
5. GitOps & SRE: Discover the principles of GitOps and Site Reliability Engineering (SRE).
6. Operating Systems & Networking: Get familiar with operating systems and networking fundamentals in a DevOps context.
7. Virtualization: Understand the concepts and benefits of virtualization in modern IT infrastructures.
8. Containers: Dive into containerization technologies like Docker and container orchestration with Kubernetes.
9. CI/CD: Explore continuous integration and continuous deployment practices.
10. Cloud Computing: Learn about cloud platforms and their integration with DevOps workflows.

## Lab Instructions and Grading

To ensure hands-on learning, this course includes practical labs. Each lab has specific tasks that need to be completed for grading purposes. The labs contribute 80% to your final grade, while a final exam accounts for the remaining 20%.

Here are some guidelines and rules for lab submissions:

- You need to submit each lab and achieve a minimum score of 6/10 to pass the course.
- Attending all lectures, practices, and submitting all lab assignments exempts you from the final exam and earns you extra points.
- To create a lab submission, create a new branch in your forked repository specifically for that lab.
- Complete the lab tasks in your branch and submit a pull request (PR) to the main branch of the course repository.
- Only the last commit of your PR before the deadline will be checked and graded.
- The deadline for lab submissions will be discussed and communicated.

## Grading and Grades Distribution

The course grading is as follows:

- Labs: 80% of the final grade.
- Final Exam: 20% of the final grade.

The grade ranges are as follows:

- [90-100] - A
- [75-90) - B
- [60-75) - C
- [0-60) - D

Each lab is marked out of 10 points. Completing the main tasks correctly will earn you the maximum of 10 points. However, if you're short on time or unable to complete all tasks, you can still achieve a minimum of 6 points by completing a subset of tasks.

## Submission Policy

It's essential to submit your lab results on time to maximize your grading. Late submissions will receive a maximum score of 6 points for the corresponding lab. Remember, submitting all labs is a requirement to pass the course successfully.

We look forward to embarking on this DevOps learning journey together and helping you build valuable skills for your career.
```

## Task 2

### Step 1: Create a New Branch

```shell
git checkout -b git-reset-practice
```

### Step 2: Explore Advanced Reset and Reflog Usage

In the separate commits three lines of the text was added:

```text
First commit
Second commit
Third commit
```

Git log:

```shell
commit 0b0e622dbc28818afffbac64efd79a7574d767b7 (HEAD -> git-reset-practice, origin/git-reset-practice)
Author: 1kkiren <1kkiren@mail.ru>
Date:   Thu Sep 12 00:06:37 2024 +0300

    Third commit

commit cb438429cfb7b184a8ac44ccf06b6fcbd96c5bec
Author: 1kkiren <1kkiren@mail.ru>
Date:   Thu Sep 12 00:06:26 2024 +0300

    Second commit

commit 7518fc61ea4ed677ffb86873bb1ff40479e463ec
Author: 1kkiren <1kkiren@mail.ru>
Date:   Thu Sep 12 00:06:12 2024 +0300

    First commit
```

### Using `git reset --soft` and `git reset --hard`

I used `git reset --soft` to move the HEAD to the previous commit (Second commit) while keeping the changes in the staging area:

```shell
git reset --soft HEAD~1
```

The output of `git status` showed that the changes were still staged:

```shell
On branch git-reset-practice
Your branch is behind 'origin/git-reset-practice' by 1 commit, and can be fast-forwarded.
  (use "git pull" to update your local branch)

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   file.txt
```

Next, I used `git reset --hard` to move the HEAD to the previous commit (First commit) and discard all changes:

```shell
git reset --hard HEAD~1
```

The output of `git status` showed that the changes were discarded:

```shell
On branch git-reset-practice
Your branch is behind 'origin/git-reset-practice' by 2 commits, and can be fast-forwarded.
  (use "git pull" to update your local branch)

nothing to commit, working tree clean
```

### Using `git reflog`

I used `git reflog` to view the commit history:

```shell
git reflog
```

The output showed the commit history, including the hashes:

```shell
7518fc6 (HEAD -> git-reset-practice) HEAD@{7}: reset: moving to HEAD~1
cb43842 HEAD@{8}: reset: moving to HEAD~1
0b0e622 (origin/git-reset-practice) HEAD@{9}: commit: Third commit
cb43842 HEAD@{10}: commit: Second commit
7518fc6 (HEAD -> git-reset-practice) HEAD@{11}: commit: First commit
```

I used `git reset --hard` with the hash from the reflog to move the HEAD to the Third commit:

```shell
git reset --hard 0b0e622
```

The output of `git status` showed that the changes were restored:

```shell
On branch git-reset-practice
Your branch is up to date with 'origin/git-reset-practice'.

nothing to commit, working tree clean
```
