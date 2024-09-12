
# Git Object Exploration

## Git Log Output

Here are the commits in the repository:

```
e2df152 (HEAD -> master) Second commit
4d4bb99 Initial commit
6ca27ee (origin/master, origin/HEAD) Added IPFS setup and Fleek deployment details
8b033a6 Added merge strategies summary for Task 2
dcfb416 Added merge strategies summary for Task 2
cb15e8d Delete submission1.md
55d380f Added benefits of signing commits and merge strategies comparison
61404c0 Update lab1.md
6ade7fd Upload lab1 Git Intro & lab2 IPFS, fleek
```

## Inspecting Commit Object

We inspected the commit with hash `6ade7fd` using the command:

```bash
git cat-file -p 6ade7fd
```

The output was:

```
tree 62a2cb5303f1e34879627cbb4ed9bf63b6701078
author Dmitriy Creed <creed@soramitsu.co.jp> 1724938472 +0300
committer Dmitriy Creed <creed@soramitsu.co.jp> 1724938472 +0300

Upload lab1 Git Intro & lab2 IPFS, fleek

Signed-off-by: Dmitriy Creed <creed@soramitsu.co.jp>
```

## Inspecting Tree Object

Next, we inspected the tree object `62a2cb5303f1e34879627cbb4ed9bf63b6701078` using the command:

```bash
git cat-file -p 62a2cb5303f1e34879627cbb4ed9bf63b6701078
```

The output was:

```
100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc  README.md
100644 blob 5738bc15a0416ad2624df13badfb235052777e79  index.html
100644 blob 1dba99957c3bb59d40913294b83e40d5c38b6c0b  lab1.md
100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a  lab2.md
```

## Inspecting Blob Object

Finally, we inspected the blob object `1b99cc0044f93f556a0f6a599c7edf2f33f4944a` using the command:

```bash
git cat-file -p 1b99cc0044f93f556a0f6a599c7edf2f33f4944a
```

The output was:

```
# DevOps Tool Exploration

In this lab, you will explore essential DevOps tools and set up a project on the Fleek service. Follow the tasks below to complete the lab assignment.

## Task 1: Set Up an IPFS Gateway Using Docker

**Objective**: Understand and implement an IPFS gateway using Docker, upload a file, and verify it via an IPFS cluster.

1. **Set Up IPFS Gateway**:
   - Install Docker on your machine if it's not already installed.
     - [Docker Installation Guide](https://docs.docker.com/get-docker/)

   - Pull the IPFS Docker image and run an IPFS container:

     ```sh
     docker pull ipfs/go-ipfs
     docker run -d --name ipfs_host -v /path/to/folder/with/file:/export -v ipfs_data:/data/ipfs -p 8080:8080 -p 4001:4001 -p 5001:5001 ipfs/go-ipfs
     ```

   - Verify the IPFS container is running:

     ```sh
     docker ps
     ```

2. **Upload a File to IPFS**:
   - Open a browser and access the IPFS web UI:

     ```sh
     http://127.0.0.1:5001/webui/
     ```

   - Explore the web UI and wait for 5 minutes to sync up with the network.
   - Upload any file via the web UI.
   - Use the obtained hash to access the file via any public IPFS gateway. Here are a few options:
     - [IPFS.io Gateway](https://ipfs.io/ipfs/)
     - [Cloudflare IPFS Gateway](https://cloudflare-ipfs.com/ipfs/)
     - [Infura IPFS Gateway](https://ipfs.infura.io/ipfs/)

   - Append your file hash to any of the gateway URLs to verify your file is accessible. Note that it may fail due to network overload, so don't worry if you can't reach it.

3. **Documentation**:
   - Create a `submission2.md` file.
   - Share information about connected peers and bandwidth in your report.
   - Provide the hash and the URLs used to verify the file on the IPFS gateways.

## Task 2: Set Up Project on Fleek.co

**Objective**: Set up a project on the Fleek service and share the IPFS link.

1. **Research**:
   - Understand what IPFS is and its purpose.
   - Explore Fleek's features.

2. **Set Up**:
   - Sign up for a Fleek account if you haven't already.
   - Use your fork of the Labs repository as your project source. Optionally, set up your own website (notify us in advance).
   - Configure the project settings on Fleek.
   - Deploy the Labs repository to Fleek, ensuring it is uploaded to IPFS.

3. **Documentation**:
   - Share the IPFS link and domain of the deployed project in the `submission2.md` file.

## Additional Resources

- [IPFS Documentation](https://docs.ipfs.io/)
- [Fleek Documentation](https://docs.fleek.co/)

### Guidelines

- Use proper Markdown formatting for documentation files.
- Organize files with appropriate naming conventions.
- Create a Pull Request to the main branch of the repository with your completed lab assignment.

> Note: Actively explore and document your findings to gain hands-on experience with IPFS and Fleek.

