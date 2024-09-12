# How VCS store data

### Git concepts:
- Blob: A blob is a Git object that represents a file's contents, storing the file's data in a binary format, but not its name or any other metadata.
- Tree: A tree is a Git object that represents a directory's structure, containing references to blobs (files) and other trees (subdirectories), allowing Git to reconstruct the file system hierarchy.
- Commit: A commit is a Git object that represents a snapshot of the entire repository at a particular point in time, containing metadata such as the author, timestamp, and commit message, as well as references to the tree objects that make up the snapshot.

### Git Tree

```markdown
git cat-file -p 'Lab-3^{tree}'
```
```markdown
100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc    README.md
100644 blob 5738bc15a0416ad2624df13badfb235052777e79    index.html
100644 blob 7a94f7af59b8968be392288ea03179a24ffc9d9e    lab1.md
100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a    lab2.md
100644 blob 2f8463cc188ec6ca69ae7a0f98d38e132280becb    lab3.md
100644 blob d66a6867f90e48f6f44d9d80821aa1d866a24882    lab4.md
```

Let's commit this file and check it once again

```markdown
git commit -S -m "added submission 3 (test commit)
git cat-file -p 'Lab-3^{tree}'
```
```markdown
100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc    README.md
100644 blob 5738bc15a0416ad2624df13badfb235052777e79    index.html
100644 blob 7a94f7af59b8968be392288ea03179a24ffc9d9e    lab1.md
100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a    lab2.md
100644 blob 2f8463cc188ec6ca69ae7a0f98d38e132280becb    lab3.md
100644 blob d66a6867f90e48f6f44d9d80821aa1d866a24882    lab4.md
100644 blob ecd5c5be9e626e90d7688cc716ca863b47017836    submission3.md
```
Great, now let's inspect the actual blob

### Blob

```markdown
git cat-file -p c5be9e626e90d7688cc716ca863b47017836
```
```markdown
# How VCS store data

### Git concepts:
...
```
### Commit
Let's get the latest commit's hash:

```markdown
git rev-parse --verify HEAD
```
```markdown
dc7d0acc39ab433bb5358588545eef1f3229dcee
```
Inspecting the commit further:
```markdown
git cat-file -p HEAD
```
```markdown
tree 1a40fb3ac5acf79c15d2da8d167f4d812d642362
parent bf1e711eae46b961296dea9db101013aaaf1ced7
author outrun32 <jakovsap@gmail.com> 1726140381 +0300
committer outrun32 <jakovsap@gmail.com> 1726140381 +0300
gpgsig -----BEGIN SSH SIGNATURE-----
 U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAg4DHlGxMCZyeB8mVmoElp9My0aQ
 TYkTK28B0rU6iwOaUAAAADZ2l0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5
 AAAAQI0gGLP27wAu1tcBveFGPLOQsBKAlj03nlFnlouLY8GeSOw7HzGa4vqbobMdL6YZe3
 SqTYuOfX5a4L/XVelkMAc=
 -----END SSH SIGNATURE-----

added submission 3 (test commit)
```

# Practice with git reset
Let's commit the submission3.md in its current state to save the progress.

```markdown
git add submission3.md
git commit -S -m "Saved submission3.md"
```