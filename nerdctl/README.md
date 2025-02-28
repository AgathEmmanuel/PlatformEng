# nerdctl  


[https://github.com/containerd/nerdctl/releases/tag/v1.7.6](https://github.com/containerd/nerdctl/releases/tag/v1.7.6)  


```

Compatible containerd versions

This release of nerdctl is expected to be used with containerd v1.6 or v1.7.
About the binaries

    Minimal (nerdctl-1.7.6-linux-amd64.tar.gz): nerdctl only
    Full (nerdctl-full-1.7.6-linux-amd64.tar.gz): Includes dependencies such as containerd, runc, and CNI

Minimal

Extract the archive to a path like /usr/local/bin or ~/bin .
tar Cxzvvf /usr/local/bin nerdctl-1.7.6-linux-amd64.tar.gz

-rwxr-xr-x root/root  25116672 2024-04-30 06:21 nerdctl
-rwxr-xr-x root/root     21916 2024-04-30 06:20 containerd-rootless-setuptool.sh
-rwxr-xr-x root/root      7187 2024-04-30 06:20 containerd-rootless.sh

Full

Extract the archive to a path like /usr/local or ~/.local .
tar Cxzvvf /usr/local nerdctl-full-1.7.6-linux-amd64.tar.gz

drwxr-xr-x 0/0               0 2024-04-30 06:28 bin/
-rwxr-xr-x 0/0        27644700 2015-10-21 00:00 bin/buildctl
-rwxr-xr-x 0/0        23724032 2022-09-05 09:52 bin/buildg
-rwxr-xr-x 0/0        53374823 2015-10-21 00:00 bin/buildkitd
-rwxr-xr-x 0/0         7277848 2024-04-30 06:26 bin/bypass4netns
-rwxr-xr-x 0/0         5308416 2024-04-30 06:26 bin/bypass4netnsd
-rwxr-xr-x 0/0        38946168 2024-04-30 06:27 bin/containerd
-rwxr-xr-x 0/0         9474048 2023-11-02 17:34 bin/containerd-fuse-overlayfs-grpc
-rwxr-xr-x 0/0           21916 2024-04-30 06:26 bin/containerd-rootless-setuptool.sh
-rwxr-xr-x 0/0            7187 2024-04-30 06:26 bin/containerd-rootless.sh
-rwxr-xr-x 0/0        12161024 2024-04-30 06:28 bin/containerd-shim-runc-v2
-rwxr-xr-x 0/0        45903872 2023-10-31 08:57 bin/containerd-stargz-grpc
-rwxr-xr-x 0/0        20630617 2024-04-30 06:28 bin/ctd-decoder
-rwxr-xr-x 0/0        18870272 2024-04-30 06:27 bin/ctr
-rwxr-xr-x 0/0        29671743 2024-04-30 06:28 bin/ctr-enc
-rwxr-xr-x 0/0        19931136 2023-10-31 08:58 bin/ctr-remote
-rwxr-xr-x 0/0         1785448 2024-04-30 06:28 bin/fuse-overlayfs
-rwxr-xr-x 0/0        65589641 2024-04-30 06:27 bin/ipfs
-rwxr-xr-x 0/0        25088000 2024-04-30 06:26 bin/nerdctl
-rwxr-xr-x 0/0        10666181 2024-03-05 22:20 bin/rootlessctl
-rwxr-xr-x 0/0        12358373 2024-03-05 22:20 bin/rootlesskit
-rwxr-xr-x 0/0        15074072 2024-04-30 06:26 bin/runc
-rwxr-xr-x 0/0         2346328 2024-04-30 06:28 bin/slirp4netns
-rwxr-xr-x 0/0          870496 2024-04-30 06:28 bin/tini
drwxr-xr-x 0/0               0 2024-04-30 06:28 lib/
drwxr-xr-x 0/0               0 2024-04-30 06:28 lib/systemd/
drwxr-xr-x 0/0               0 2024-04-30 06:28 lib/systemd/system/
-rw-r--r-- 0/0            1475 2024-04-30 06:28 lib/systemd/system/buildkit.service
-rw-r--r-- 0/0            1414 2024-04-30 06:25 lib/systemd/system/containerd.service
-rw-r--r-- 0/0             312 2024-04-30 06:28 lib/systemd/system/stargz-snapshotter.service
drwxr-xr-x 0/0               0 2024-04-30 06:28 libexec/
drwxr-xr-x 0/0               0 2024-04-30 06:28 libexec/cni/
-rw-r--r-- 0/0           11357 2024-03-12 10:56 libexec/cni/LICENSE
-rw-r--r-- 0/0            2343 2024-03-12 10:56 libexec/cni/README.md
-rwxr-xr-x 0/0         4119661 2024-03-12 10:56 libexec/cni/bandwidth
-rwxr-xr-x 0/0         4662227 2024-03-12 10:56 libexec/cni/bridge
-rwxr-xr-x 0/0        11065251 2024-03-12 10:56 libexec/cni/dhcp
-rwxr-xr-x 0/0         4306546 2024-03-12 10:56 libexec/cni/dummy
-rwxr-xr-x 0/0         4751593 2024-03-12 10:56 libexec/cni/firewall
-rwxr-xr-x 0/0         4198427 2024-03-12 10:56 libexec/cni/host-device
-rwxr-xr-x 0/0         3560496 2024-03-12 10:56 libexec/cni/host-local
-rwxr-xr-x 0/0         4324636 2024-03-12 10:56 libexec/cni/ipvlan
-rwxr-xr-x 0/0         3651038 2024-03-12 10:56 libexec/cni/loopback
-rwxr-xr-x 0/0         4355073 2024-03-12 10:56 libexec/cni/macvlan
-rwxr-xr-x 0/0         4095898 2024-03-12 10:56 libexec/cni/portmap
-rwxr-xr-x 0/0         4476535 2024-03-12 10:56 libexec/cni/ptp
-rwxr-xr-x 0/0         3861176 2024-03-12 10:56 libexec/cni/sbr
-rwxr-xr-x 0/0         3120090 2024-03-12 10:56 libexec/cni/static
-rwxr-xr-x 0/0         4381887 2024-03-12 10:56 libexec/cni/tap
-rwxr-xr-x 0/0         3743844 2024-03-12 10:56 libexec/cni/tuning
-rwxr-xr-x 0/0         4319235 2024-03-12 10:56 libexec/cni/vlan
-rwxr-xr-x 0/0         4008392 2024-03-12 10:56 libexec/cni/vrf
drwxr-xr-x 0/0               0 2024-04-30 06:26 share/
drwxr-xr-x 0/0               0 2024-04-30 06:26 share/doc/
drwxr-xr-x 0/0               0 2024-04-30 06:26 share/doc/nerdctl/
-rw-r--r-- 0/0           12480 2024-04-30 06:20 share/doc/nerdctl/README.md
drwxr-xr-x 0/0               0 2024-04-30 06:20 share/doc/nerdctl/docs/
-rw-r--r-- 0/0            3953 2024-04-30 06:20 share/doc/nerdctl/docs/build.md
-rw-r--r-- 0/0            2570 2024-04-30 06:20 share/doc/nerdctl/docs/builder-debug.md
-rw-r--r-- 0/0            3996 2024-04-30 06:20 share/doc/nerdctl/docs/cni.md
-rw-r--r-- 0/0           74383 2024-04-30 06:20 share/doc/nerdctl/docs/command-reference.md
-rw-r--r-- 0/0            1814 2024-04-30 06:20 share/doc/nerdctl/docs/compose.md
-rw-r--r-- 0/0            5329 2024-04-30 06:20 share/doc/nerdctl/docs/config.md
-rw-r--r-- 0/0            9128 2024-04-30 06:20 share/doc/nerdctl/docs/cosign.md
-rw-r--r-- 0/0            5660 2024-04-30 06:20 share/doc/nerdctl/docs/cvmfs.md
-rw-r--r-- 0/0            2435 2024-04-30 06:20 share/doc/nerdctl/docs/dir.md
-rw-r--r-- 0/0             906 2024-04-30 06:20 share/doc/nerdctl/docs/experimental.md
-rw-r--r-- 0/0           14217 2024-04-30 06:20 share/doc/nerdctl/docs/faq.md
-rw-r--r-- 0/0             884 2024-04-30 06:20 share/doc/nerdctl/docs/freebsd.md
-rw-r--r-- 0/0            3228 2024-04-30 06:20 share/doc/nerdctl/docs/gpu.md
-rw-r--r-- 0/0           14463 2024-04-30 06:20 share/doc/nerdctl/docs/ipfs.md
-rw-r--r-- 0/0            1748 2024-04-30 06:20 share/doc/nerdctl/docs/multi-platform.md
-rw-r--r-- 0/0            2960 2024-04-30 06:20 share/doc/nerdctl/docs/notation.md
-rw-r--r-- 0/0            2596 2024-04-30 06:20 share/doc/nerdctl/docs/nydus.md
-rw-r--r-- 0/0            3277 2024-04-30 06:20 share/doc/nerdctl/docs/ocicrypt.md
-rw-r--r-- 0/0            1876 2024-04-30 06:20 share/doc/nerdctl/docs/overlaybd.md
-rw-r--r-- 0/0           15657 2024-04-30 06:20 share/doc/nerdctl/docs/registry.md
-rw-r--r-- 0/0            5088 2024-04-30 06:20 share/doc/nerdctl/docs/rootless.md
-rw-r--r-- 0/0            2015 2024-04-30 06:20 share/doc/nerdctl/docs/soci.md
-rw-r--r-- 0/0           10312 2024-04-30 06:20 share/doc/nerdctl/docs/stargz.md
drwxr-xr-x 0/0               0 2024-04-30 06:28 share/doc/nerdctl-full/
-rw-r--r-- 0/0            1154 2024-04-30 06:28 share/doc/nerdctl-full/README.md
-rw-r--r-- 0/0            6578 2024-04-30 06:28 share/doc/nerdctl-full/SHA256SUMS

Included components

See share/doc/nerdctl-full/README.md:

# nerdctl (full distribution)
- nerdctl: v1.7.6
- containerd: v1.7.16
- runc: v1.1.12
- CNI plugins: v1.4.1
- BuildKit: v0.12.5
- Stargz Snapshotter: v0.15.1
- imgcrypt: v1.1.10
- RootlessKit: v2.0.2
- slirp4netns: v1.2.3
- bypass4netns: v0.4.0
- fuse-overlayfs: v1.13
- containerd-fuse-overlayfs: v1.0.8
- Kubo (IPFS): v0.27.0
- Tini: v0.19.0
- buildg: v0.4.1

## License
- bin/slirp4netns:    [GNU GENERAL PUBLIC LICENSE, Version 2](https://github.com/rootless-containers/slirp4netns/blob/v1.2.3/COPYING)
- bin/fuse-overlayfs: [GNU GENERAL PUBLIC LICENSE, Version 2](https://github.com/containers/fuse-overlayfs/blob/v1.13/COPYING)
- bin/ipfs: [Combination of MIT-only license and dual MIT/Apache-2.0 license](https://github.com/ipfs/kubo/blob/v0.27.0/LICENSE)
- bin/{runc,bypass4netns,bypass4netnsd}: Apache License 2.0, statically linked with libseccomp ([LGPL 2.1](https://github.com/seccomp/libseccomp/blob/main/LICENSE), source code available at https://github.com/seccomp/libseccomp/)
- bin/tini: [MIT License](https://github.com/krallin/tini/blob/v0.19.0/LICENSE)
- Other files: [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)

Quick start
Rootful

$ sudo systemctl enable --now containerd
$ sudo nerdctl run -d --name nginx -p 80:80 nginx:alpine

Rootless

$ containerd-rootless-setuptool.sh install
$ nerdctl run -d --name nginx -p 8080:80 nginx:alpine

Enabling cgroup v2 is highly recommended for rootless mode, see https://rootlesscontaine.rs/getting-started/common/cgroup2/ .



```




[https://github.com/containerd/nerdctl/blob/main/docs/command-reference.md](https://github.com/containerd/nerdctl/blob/main/docs/command-reference.md)  


[https://github.com/containerd/nerdctl/tree/main?tab=readme-ov-file#install](https://github.com/containerd/nerdctl/tree/main?tab=readme-ov-file#install)  



https://github.com/containerd/nerdctl/blob/main/extras/rootless/containerd-rootless-setuptool.sh  

https://github.com/containerd/nerdctl/tree/main/extras/rootless  


https://rootlesscontaine.rs/getting-started/containerd/  



[https://github.com/containerd/nerdctl/blob/main/docs/rootless.md](https://github.com/containerd/nerdctl/blob/main/docs/rootless.md)  


[https://github.com/containerd/containerd/blob/main/docs/getting-started.md](https://github.com/containerd/containerd/blob/main/docs/getting-started.md)  


```

systemd

If you intend to start containerd via systemd, you should also download the containerd.service unit file from https://raw.githubusercontent.com/containerd/containerd/main/containerd.service into /usr/local/lib/systemd/system/containerd.service, and run the following commands:

systemctl daemon-reload
systemctl enable --now containerd


```



$ containerd-rootless-setuptool.sh install                                                                                                                    
[INFO] Checking RootlessKit functionality                                                                                                                                                  
[INFO] Checking cgroup v2                                                                                                                                                                  
[INFO] Checking overlayfs                                                                                                                                                                  
[INFO] Requirements are satisfied                                                                                                                                                          
[INFO] Creating "/home/user_name/.config/systemd/user/containerd.service"                                                                                                                      
[INFO] Starting systemd unit "containerd.service"                                                                                                                                          
+ systemctl --user start containerd.service                                                                                                                                                
+ sleep 3                                                                                                                                                                                  
+ systemctl --user --no-pager --full status containerd.service                                                                                                                             
● containerd.service - containerd (Rootless)


[INFO] Installed "containerd.service" successfully.
[INFO] To control "containerd.service", run: `systemctl --user (start|stop|restart) containerd.service`
[INFO] To run "containerd.service" on system startup automatically, run: `sudo loginctl enable-linger user_name`
[INFO] ------------------------------------------------------------------------------------------
[INFO] Use `nerdctl` to connect to the rootless containerd.
[INFO] You do NOT need to specify $CONTAINERD_ADDRESS explicitly.





https://github.com/containerd/nerdctl/blob/main/docs/command-reference.md  



nerdctl run --name test -d nginx:alpine

nerdctl image ls

nerdctl ps

nerdctl ps -a

nerdctl exec -it test sh



https://github.com/containerd/nerdctl/blob/main/docs/build.md


$ CONTAINERD_NAMESPACE=default containerd-rootless-setuptool.sh install-buildkit-containerd                                                                
[INFO] Creating "/home/user_name/.config/systemd/user/default-buildkit.service"                  
[INFO] Starting systemd unit "default-buildkit.service"                     
+ systemctl --user start default-buildkit.service                                                                                                                                          
+ sleep 3                                                                                                                                                                                  
+ systemctl --user --no-pager --full status default-buildkit.service                                                                                                                       
● default-buildkit.service - BuildKit (Rootless)                                                                                                                                           
     Loaded: loaded (/home/user_name/.config/systemd/user/default-buildkit.service; disabled; preset: enabled)                                                                                 
     Active: active (running) since Fri 2025-02-28 15:33:05 IST; 3s ago

+ systemctl --user enable default-buildkit.service
Created symlink /home/user_name/.config/systemd/user/default.target.wants/default-buildkit.service → /home/user_name/.config/systemd/user/default-buildkit.service.
[INFO] Installed "default-buildkit.service" successfully.
[INFO] To control "default-buildkit.service", run: `systemctl --user (start|stop|restart) default-buildkit.service`



nerdctl build -t testnginx .

nerdctl build -t testnginx:v1 .

nerdctl push testnginx



