# Task 1: Understanding Version Control Systems


Output of git cat-file of commit **28b421a**:

```
tree b7ae4611824b36a60199167d56c6f95b87daefa3
parent a24c19ce12d3e2fdcaad5b62ec9cfeab50ad766c
author Nurislam Zinnatullin <n.zinnatullin@innopolis.university> 1725830568 +0300
committer Nurislam Zinnatullin <n.zinnatullin@innopolis.university> 1725830568 +0300
gpgsig -----BEGIN SSH SIGNATURE-----
 U1NIU0lHAAAAAQAAAZcAAAAHc3NoLXJzYQAAAAMBAAEAAAGBAKXUUc+KaYD4C5tfMMLnsR
 D9zARX7QkSBM9lQk+1U7P99F7oMg+cQaaUcNsnxiNvgQ+TBBzxhuxvnFS/BbyCv+rVPs+E
 0qNiKoCbtD+jG8mD07+0/um2UiQk9V05mZ9vibEXoJTgdn0MSSyflcHqfzLOvgaMRp9qWV
 tiCqIABo7JOqsRxtFyI6N2j3oKWjxAEFTpeyZ8sEv//40U7gmySzTw3C1Cu75ago8FWwmI
 liivkEMqN4Du1LFbfTmcWEWnjzFPQUb3eQSNKK8tBC0zykBlKzZVj9mjKe2MZ+5fUtggT0
 Au2ns7utugJsur50agvnNJYb3D8lNv25iJq/R2N+IcIMgn6BfjVFqL/Hnyh5USk1Jsv31n
 X9lZnSYu5V2lDHX+wlikIsyq7kk0TsnoDlfk1c0aHqs8Z3GP2tP2yDuLnbnndHis1u3tdO
 toYxo7tOYZt7G6xgyT+zcIS7phYYv20/tS24m+FFzpa1AXuTBf7uP5f1tl2WA1vjMf7aZU
 wQAAAANnaXQAAAAAAAAABnNoYTUxMgAAAZQAAAAMcnNhLXNoYTItNTEyAAABgE7/iOuSo2
 USHsuUXqAJoRsPoqpfeQLIVV4jzDG/JYDOo2GsBlvh+WeyTHMrgBG8g6IS51NA8O8R+tm4
 NfTuTCzPEG8Ni8htpC7Vj0uC/4lwuKeVc1LFqKBFb+xZNMd9SqmgXtJ37EEGd3fCTw2Y6E
 cbFDF3ZzNStbtVJLVdG9YvaUBA6J++gNaUNFX23w6VkcpjhcpBGQK+2kjb96dZQbGwo8n2
 hSpmQI6jyxUkCka7/GuTyMvOpyBkWkGUx4WmQyp6FNjxllEfP/6chclOG11ab8bLJnQKc6
 omUCRGJuW9L6XbCiZ2/Wa6fXwfwv8yS/dfe0JPm28Z39M1n+XWMEiJ6vKTii03lzEK7LAT
 t/aW3xKdOnmBdMsTd2Y01LKofrH4RF3Rh4bTx68B+6hjr/sFcNRZQOhPzknhVPMwPjJwdV
 Z3Yizb9fFZshM7DwTdos3pHqbvSOE4c36FTNxdDJ0WPQOtFHmVn424iWuCPJQ8f8bI5nzU
 BKvOSHuTC/EH3Q==
 -----END SSH SIGNATURE-----
 ```

Output of git cat-file of tree **b7ae4611824b36a60199167d56c6f95b87daefa3**:

 ```
040000 tree 08d79ec3e036fa2a685e1ea87caf57afc89a3a49    Lab_1
040000 tree 6115e36954fc97d99bef5c4019602a01bb36d4ce    Lab_2
040000 tree 5dd94a1590de4e4151c9a6674d2c797276a1295d    Lab_3
100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc    README.md
100644 blob 5738bc15a0416ad2624df13badfb235052777e79    index.html
100644 blob 7a94f7af59b8968be392288ea03179a24ffc9d9e    lab1.md
100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a    lab2.md
 ```

Output of git cat-file of blob **b25d9989d27a42472549974b16e2e677c0f2de0b**:
```
# Task 1: Set Up an IPFS Gateway Using Docker
![alt text](image.png)

As you can see, I have 69 peers. 45 kib/s for incoming network traffic and 268 kib/s outgoing traffic.

The CID (or hash) of the file is "QmV7BWXTb2w9tUeuJh5hdyFkzGPfpNKwCazVDGN1oarBxF"

URLS:
- https://ipfs.io/ipfs/QmV7BWXTb2w9tUeuJh5hdyFkzGPfpNKwCazVDGN1oarBxF?filename=index.html
- https://ipfs.io/ipfs/QmV7BWXTb2w9tUeuJh5hdyFkzGPfpNKwCazVDGN1oarBxF
- https://ipfs.infura.io/ipfs/QmV7BWXTb2w9tUeuJh5hdyFkzGPfpNKwCazVDGN1oarBxF

But unfortunatelly it fails to load the links, giving timeout error. As I understand it's because we loaded file at local machine, instead of loading to ipfs servers.

# Task 2: Set Up Project on Fleek.co

IPFS: https://ipfs.io/ipfs/bafybeigbvef7nyfm4okrc4jbvielivmpv2c26fzab3irffw5pofxzjeoaq/

DOMAIN: https://melodic-jelly-swift.on-fleek.app/
```


# Task 2: Practice with Git Reset Command


