https://linuxstoney.com/diagnose-and-fix-slow-boot-on-ubuntu/

#### Method 2 : Try from “No splash screen to Kernel” to find which processes are taking the most time for booting.

```
A start job is running for Raise network interfaces (1min 26s / 5min 24s)
```

So, we need to reduce time for this process to save boot time. To do so,

You have to edit,

/etc/systemd/system/network-online.target.wants/networking.service

```
sudo nano /etc/systemd/system/network-online.target.wants/networking.service
```

Find

```
TimeoutStartSec=5min
```

Change to

```
TimeoutStartSec=5s
```

and reboot