# DevOps Tool Exploration

## Task 1: Set Up an IPFS Gateway Using Docker

1. **Set Up IPFS Gateway**:
   - Pull the IPFS Docker image and run an IPFS container:

     ```sh
     docker pull ipfs/go-ipfs
     docker run -d --name ipfs_host -v /path/to/folder/with/file:/export -v ipfs_data:/data/ipfs -p 8080:8080 -p 4001:4001 -p 5001:5001 ipfs/go-ipfs
     ```

   - Verify the IPFS container is running:

     ```sh
     docker ps
     ```
    
   - Done
     ```sh
     > docker ps

     CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS                    PORTS                                                                                        NAMES

     4de8e2ea4754   ipfs/go-ipfs   "/sbin/tini -- /usr/…"   21 seconds ago   Up 20 seconds (healthy)   0.0.0.0:4001->4001/tcp, 0.0.0.0:5001->5001/tcp, 4001/udp, 0.0.0.0:8080->8080/tcp, 8081/tcp   ipfs_host
     ```


2. **Upload a File to IPFS**:
   - Open a browser and access the IPFS web UI:

     ```sh
     http://127.0.0.1:5001/webui/
     ```

   - Explore the web UI and wait for 5 minutes to sync up with the network.

      So, the number of connected peers change a little bit over time. I tried to do this task several times, and that number was ranging from 6 to 15.

      Bandwith is ranging from a little bit more than zero up to 30-50 KiB/s.

   - Upload any file via the web UI.

      I uploaded a file and got the following CiD: ```QmeR8UBM6KchFfuwVTvBggu54VMMU37YCR69xztaHhnNbB```.

   - Use the obtained hash to access the file via any public IPFS gateway. Here are a few options:
     - [IPFS.io Gateway](https://ipfs.io/ipfs/)
     - [Cloudflare IPFS Gateway](https://cloudflare-ipfs.com/ipfs/)
     - [Infura IPFS Gateway](https://ipfs.infura.io/ipfs/)

   - Append your file hash to any of the gateway URLs to verify your file is accessible. Note that it may fail due to network overload, so don't worry if you can't reach it.

   So, everything is done, but I can not reach my file. I keep getting ```504 Gateway timeout: The gateway is taking too long to fetch your content.``` with first gateway (```https://ipfs.io/ipfs/QmeR8UBM6KchFfuwVTvBggu54VMMU37YCR69xztaHhnNbB```) and can not even reach the second gateway (```https://cloudflare-ipfs.com/ipfs/QmeR8UBM6KchFfuwVTvBggu54VMMU37YCR69xztaHhnNbB```): ```Access denied: Error code 1020```

## Task 2: Set Up Project on Fleek.co

1. **Research**:
   - Understand what IPFS is and its purpose.

     IPFS (InterPlanetary File System) is a peer-to-peer file system designed to create a permanent web. It aims to replace the traditional HTTP protocol and address some of its limitations, such as the reliance on centralized servers and the inefficiency of fetching content from distant locations.

   - Explore Fleek's features.
     Done (a little bit :) )

2. **Set Up**:
   - Sign up for a Fleek account if you haven't already.
   - Use your fork of the Labs repository as your project source. Optionally, set up your own website (notify us in advance).
   - Configure the project settings on Fleek.
   - Deploy the Labs repository to Fleek, ensuring it is uploaded to IPFS.

   Everything is done:
   - Hash is ```bafybeigamxrzyo2z2gsvzrsyvzvk2jnzgevuhoksfubhe7hkc77pukrvpm```
   - The domain is ```round-application-straight```
   - And the [link to the website](https://round-application-straight.on-fleek.app)