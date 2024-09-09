# Lab 3 - Understanding Version Control Systems

## Task 1: Git Internal Objects

In this task, we explored how Git stores data in the form of blobs, trees, and commits. Below are the results of using `git cat-file` to inspect these internal objects.

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
gpgsig -----BEGIN SSH SIGNATURE-----
 U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgXvnbBGRgxxfGLcyOPbry98o1f5
 PP/nYinYyGRciYA7AAAAADZ2l0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5
 AAAAQG4IScEbzCeTXIOwd5CFRfF6C3WEsI+JYrFcZfnWAvK0EOEdqTX1r7seBOXrY+v1m4
 HRKg4Mt2H3m8OLJ+SLPg8=
 -----END SSH SIGNATURE-----

Added file2.txt
```

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

