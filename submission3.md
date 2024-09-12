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