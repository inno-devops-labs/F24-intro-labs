# Lab 9: CI/CD Lab - GitHub Actions

## Task 1: Create Your First GitHub Actions Pipeline

1. **Guides:**

    GitHub Actions is a powerful workflow automation tool that allows you to automate your development and deployment processes.

    * A workflow is a `.yml` file that defines the steps to be executed by GitHub Actions.
    * The workflow file is stored in the `.github/workflows` directory of the repository.
    * The `on` keyword is used to specify the trigger for the workflow, such as push or pull requests.
    * The `jobs` keyword is used to define a job, which is a set of steps that are executed on a runner.
    * The `steps` keyword is used to define individual steps within a job.

2. **Creating workflow:**

    ```yml
    name: Task1 Workflow

    on:
      push:
        branches:
          - lab9

    jobs:
      build-and-deploy:
        runs-on: ubuntu-latest
        steps:
          - name: Checkout code
            uses: actions/checkout@v2
          - name: Run a command
            run: echo "Hello World!"
    ```

    * **Output:**

        ```bash
        Run echo "Hello World!"
        Hello World!
        ```

    The workflow was triggered automatically when I pushed the changes tothe repository.

    The workflow executed successfully, and I saw the output "HelloWorld!" in the workflow logs.

    The workflow was executed on an Ubuntu runner, and the actions/checkout@v2 action was used to checkout the code.

## Task 2: Gathering System Information and Manual Triggering

1. **Create `second-task-workflow.yml`:**

    ```yml
    name: Task2 Workflow

    on:
      workflow_dispatch:
        inputs:
          name:
            description: 'Person to greet'
            required: false
            default: 'World'

    jobs:
      print-greeting:
        runs-on: ubuntu-latest
        steps:
          - name: Checkout code
            uses: actions/checkout@v2
          - name: Run a command
            run: echo "Hello ${{ github.event.inputs.name }}!"
    ```

    * **Input:**

      ```bash
      1kkiren!
      ```

    * **Output:**

        ```bash
        Run echo "Hello 1kkiren!!"
        Hello 1kkiren!!
        ```

    Surprisingly, the workflow with manual trigger can be executed only from the main branch. If it is not in the main, the workflow will not be shown in the "Actions" tab.

2. **Workflow for gathering OS information:**

    ```yml
    name: Task3 Workflow

    on:
      workflow_dispatch:

    jobs:
      get_data:
        runs-on: ubuntu-latest
        steps:
          - name: Checkout code
            uses: actions/checkout@v2

          - name: Print runner OS information
            run: uname -a

          - name: Print CPU information
            run: lscpu

          - name: Print memory usage
            run: free -h

          - name: Print disk usage
            run: df -h
    ```

    * **Output:**

        ```bash
        Run uname -a
        Linux fv-az768-113 6.8.0-1014-azure #16~22.04.1-Ubuntu SMP Thu Aug 15 21:31:41 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux
        ```

        ```bash
        Run lscpu
        Architecture:                         x86_64
        CPU op-mode(s):                       32-bit, 64-bit
        Address sizes:                        48 bits physical, 48 bits virtual
        Byte Order:                           Little Endian
        CPU(s):                               4
        On-line CPU(s) list:                  0-3
        Vendor ID:                            AuthenticAMD
        Model name:                           AMD EPYC 7763 64-Core Processor
        CPU family:                           25
        Model:                                1
        Thread(s) per core:                   2
        Core(s) per socket:                   2
        Socket(s):                            1
        Stepping:                             1
        BogoMIPS:                             4890.85
        Flags:                                fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl tsc_reliable nonstop_tsc cpuid extd_apicid aperfmperf pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm cmp_legacy svm cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw topoext vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves user_shstk clzero xsaveerptr rdpru arat npt nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold v_vmsave_vmload umip vaes vpclmulqdq rdpid fsrm
        Virtualization:                       AMD-V
        Hypervisor vendor:                    Microsoft
        Virtualization type:                  full
        L1d cache:                            64 KiB (2 instances)
        L1i cache:                            64 KiB (2 instances)
        L2 cache:                             1 MiB (2 instances)
        L3 cache:                             32 MiB (1 instance)
        NUMA node(s):                         1
        NUMA node0 CPU(s):                    0-3
        Vulnerability Gather data sampling:   Not affected
        Vulnerability Itlb multihit:          Not affected
        Vulnerability L1tf:                   Not affected
        Vulnerability Mds:                    Not affected
        Vulnerability Meltdown:               Not affected
        Vulnerability Mmio stale data:        Not affected
        Vulnerability Reg file data sampling: Not affected
        Vulnerability Retbleed:               Not affected
        Vulnerability Spec rstack overflow:   Vulnerable: Safe RET, no microcode
        Vulnerability Spec store bypass:      Vulnerable
        Vulnerability Spectre v1:             Mitigation; usercopy/swapgs barriers and __user pointer sanitization
        Vulnerability Spectre v2:             Mitigation; Retpolines; STIBP disabled; RSB filling; PBRSB-eIBRS Not affected; BHI Not affected
        Vulnerability Srbds:                  Not affected
        Vulnerability Tsx async abort:        Not affected
        ```

        ```bash
        Run free -h
                       total        used        free      shared  buff/cache   available
        Mem:            15Gi       676Mi        13Gi        23Mi       1.1Gi        14Gi
        Swap:          4.0Gi          0B       4.0Gi
        ```

        ```bash
        Run df -h
        Filesystem      Size  Used Avail Use% Mounted on
        /dev/root        73G   52G   21G  72% /
        tmpfs           7.9G  172K  7.9G   1% /dev/shm
        tmpfs           3.2G  1.1M  3.2G   1% /run
        tmpfs           5.0M     0  5.0M   0% /run/lock
        /dev/sda15      105M  6.1M   99M   6% /boot/efi
        /dev/sdb1        74G  4.1G   66G   6% /mnt
        tmpfs           1.6G   12K  1.6G   1% /run/user/1001
        ```
