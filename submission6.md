# Task 1

1. ```sh
   systemd-analyze
   ```
   

   Output:
   
      ![изображение](https://github.com/user-attachments/assets/b5b01527-b824-45b9-b32b-d0b8cd0886da)


2. ```sh
   systemd-analyze blame
   ```


   Part of output:

   ```
   2.496s plymouth-quit-wait.service
   23.735s snapd.seeded.service
   52.496s plymouth-quit-wait.service
   23.735s snapd.seeded.service
   21.748s snapd.service
   12.500s networkd-dispatcher.service
   10.169s dev-sda3.device
   9.320s NetworkManager-wait-online.service
   8.759s udisks2.service
   8.149s accounts-daemon.service
   7.399s dev-loop9.device
   7.185s dev-loop13.device
   7.164s dev-loop11.device
   7.138s dev-loop14.device
   7.090s dev-loop15.device
   6.995s dev-loop12.device
   6.874s dev-loop8.device
   6.811s dev-loop10.device
   6.741s ModemManager.service
   5.936s dev-loop3.device
   ```


3. ```sh
   uptime
   ```


   Output:

   ![изображение](https://github.com/user-attachments/assets/8be35b12-ca7e-4ac5-bdb5-73067b3f2980)


4. ```sh
   w
   ```


   Output:

   ![изображение](https://github.com/user-attachments/assets/b270439c-4216-4b11-a1e5-ebcceafabc62)


## Observations:     
- The userspace boot time (1 min 17.254 s) is significantly longer than the kernel boot time (15.418s). This could be due to several services taking longer to initialize.
- The system has been running for 16 minutes with a single user logged in.
- The load averages over 1, 5, and 15 minutes are: 3.01, 3.27, 2.24.
- The load is high enough for one user session with just 16 minutes of uptime. This could mean either heavy processes running or some services consuming significant resources in the background.


# Task 2

1. ```sh
   traceroute youtube.com
   ```


   Output:

   ![изображение](https://github.com/user-attachments/assets/b1a4e318-426f-4097-9161-9b1c0c4f24b7)


2. ```sh
   dig youtube.com
   ```


   Output:

   ![изображение](https://github.com/user-attachments/assets/9ceb3b04-0963-4f35-b6c8-07ae9fb6ac1b)


## Observations:
- The traceroute to YouTube's IP address (173.194.222.91) shows that the first hop reaches the default gateway (10.0.2.2) with a very low latency (1.325 ms, 1.217 ms, 1.788 ms).
- Beyond the first hop, all subsequent hops show '*', indicating that no further responses were received from intermediate routers or network devices.
- The DNS resolution is functioning correctly, with fast query times and multiple IPs returned, indicating that traffic to YouTube can be load-balanced efficiently.
