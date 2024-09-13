# Operating Systems & Networking Lab

In this lab, you will explore operating systems and networking fundamentals in a DevOps context. You will gain practical experience in working with operating systems and perform network-related tasks. Follow the tasks below to complete the lab assignment.

## Task 1: Operating System Analysis

**Objective**: Analyze and understand key aspects of the operating system's performance and uptime.

1. **Analyze System Boot Time**:
   - Use `systemd-analyze` to check the overall boot time and identify slow services.

     ```sh
     systemd-analyze
     systemd-analyze blame
     ```

2. **Check System Load and Uptime**:
   - Use `uptime` and `w` to check system load and uptime.

     ```sh
     uptime
     w
     ```

3. **Document the Analysis**:
   - Create a `submission6.md` file.
   - Provide the output of `systemd-analyze`, `uptime`, and `w` commands in the `submission6.md` file.
   - Include any observations or insights regarding system boot time, load, and uptime.

## Task 2: Networking Analysis

**Objective**: Perform network diagnostics and analyze DNS resolution to understand network paths and latency.

1. **Traceroute**:
   - Use the appropriate command or tool to perform a traceroute to a specified website or IP address.

     ```sh
     traceroute example.com
     ```

2. **Dig**:
   - Use the appropriate command or tool to perform a DNS lookup for a specified domain name.

     ```sh
     dig example.com
     ```

3. **Document the Networking Analysis**:
   - Add the output of the `traceroute` and `dig` commands to the `submission6.md` file.
   - Include any observations or insights regarding the network path, latency, and DNS resolution.

### Guidelines

- Use proper Markdown formatting for the documentation files.
- Organize the files within the lab folder using appropriate naming conventions.
- Create a Pull Request to the main branch of the repository with your completed lab assignment.

> Note: Actively explore and document your findings to gain hands-on experience with operating system analysis and networking diagnostics.
