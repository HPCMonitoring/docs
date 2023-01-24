# Linux container (LXC)

## Install LXC

Full documentation about installation goes [here](https://linuxcontainers.org/lxc/getting-started).
For security reasons, we create an unprivileged container as a user by these following steps:

### Init configurations

```bash
mkdir -p ~/.config/lxc
cp /etc/lxc/default.conf ~/.config/lxc/default.conf
MS_UID="$(grep "$(id -un)" /etc/subuid  | cut -d : -f 2)"
ME_UID="$(grep "$(id -un)" /etc/subuid  | cut -d : -f 3)"
MS_GID="$(grep "$(id -un)" /etc/subgid  | cut -d : -f 2)"
ME_GID="$(grep "$(id -un)" /etc/subgid  | cut -d : -f 3)"
echo "lxc.idmap = u 0 $MS_UID $ME_UID" >> ~/.config/lxc/default.conf
echo "lxc.idmap = g 0 $MS_GID $ME_GID" >> ~/.config/lxc/default.conf
```

### Download container

Run this command to start download:

```bash
systemd-run --unit=hpc-unit --user --scope -p "Delegate=yes" -- lxc-create -t download -n hpc-container
```

Then, the console will print list of distibution, choose distribution `centos`, release `7` and host computer's architecture. After downloading successful, your terminal should print result like this:

```script
Downloading the image index

---
DIST        RELEASE ARCH    VARIANT BUILD
---
almalinux   8       amd64   default 20230123_23:10
almalinux   8       arm64   default 20230123_23:14
almalinux   8       ppc64el default 20230123_23:08
..... Other distribution
---

Distribution: 
centos
Release: 
7
Architecture: 
amd64

Downloading the image index
Downloading the rootfs
Downloading the metadata
The image cache is now ready
Unpacking the rootfs

---
You just created a Centos 7 x86_64 (20230123_22:38) container.
```

### Start container

Run lxc container with allocating an empty delegated cgroup:

```bash
systemd-run --unit=hpc-unit --user --scope -p "Delegate=yes" -- lxc-start hpc-container
```

To confirm its status:

```bash
lxc-info -n my-container
lxc-ls -f
```

And get a shell inside it with:

```bash
lxc-attach -n hpc-container
```

Stopping it can be done with:

```bash
lxc-stop -n my-container
```

And finally removing it with:

```bash
lxc-destroy -n my-container
```
