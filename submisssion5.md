## Top CPU Usage

```sh
16222 root       20   0 11.5G  144M 45520 S  3.3  3.8  0:35.89 /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/node --dns-result-order=ipv4first /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/out/bootstrap-fork --type=extensionHost --transformURIs --useHostProxy=true
    1 root       20   0  163M 12760  8340 S  1.3  0.3  1:45.04 /sbin/init
16229 root       20   0 11.5G  144M 45520 S  0.7  3.8  0:01.91 /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/node --dns-result-order=ipv4first /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/out/bootstrap-fork --type=extensionHost --transformURIs --useHostProxy=true
```

## Top Memory Usage

```sh
16222 root       20   0 11.5G  145M 45520 S  0.0  3.8  0:36.79 /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/node --dns-result-order=ipv4first /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/out/bootstrap-fork --type=extensionHost --transformURIs --useHostProxy=true
16223 root       20   0 11.5G  145M 45520 S  0.0  3.8  0:00.00 /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/node --dns-result-order=ipv4first /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/out/bootstrap-fork --type=extensionHost --transformURIs --useHostProxy=true
16224 root       20   0 11.5G  145M 45520 S  0.0  3.8  0:00.90 /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/node --dns-result-order=ipv4first /root/.vscode-server/bin/4849ca9bdf9666755eb463db297b69e5385090e3/out/bootstrap-fork --type=extensionHost --transformURIs --useHostProxy=true
```

The processes that use the most resources are connected to VScode because I use extensions to complete this labs in WSL 

## Three Largest Files in `/var`
I used a command to list the three biggest files inside /var.
```sh
du -h -a /var/* | sort -n -r | head -n 3
1020K   /var/cache/apt/archives/fonts-dejavu-core_2.37-2build1_all.deb
996K    /var/cache/apt/archives/busybox-static_1%3a1.30.1-7ubuntu3.1_amd64.deb
956K    /var/cache/apt/archives/libubsan1_12.3.0-1ubuntu1~22.04_amd64.deb
```