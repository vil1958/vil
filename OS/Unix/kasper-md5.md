https://askubuntu.com/questions/1421093/ubuntu-boot-systemd1-failed-to-start-casper-md5check-verify-live-iso-checksum

`systemctl --failed`
● casper-md5check.service loaded failed failed casper-md5check Verify Live ISO >

LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.
1 loaded units listed.

Run `apt-cache show casper` to show the output:

```
Origin: Ubuntu
Filename: pool/main/c/casper/casper_1.470_amd64.deb
Description-en: Run a "live" preinstalled system from read-only media
Description-md5: 9be0120948307c7e897a16c45a69ba0f
Tag: admin::boot, admin::filesystem, implemented-in::shell, protocol::smb,  role::plugin, scope::utility, special::completely-tagged, works-with-    format::iso9660
Task: xubuntu-live
```

This shows it came from the Ubuntu main repository. By the pkg description and the info gathered from the github repository file [casper-md5check.c](https://github.com/Jolicloud/casper/blob/master/casper-md5check/casper-md5check.c) it seems to be safe to completely remove if you are not involved with anything live-boot install related. I removed the casper package with
`sudo apt remove casper -y`

`systemctl status casper-md5check`
shows that the service is masked:

Unmasking the service with
`sudo systemctl unmask casper-md5check`

utomatically removes the service unit file located at /etc/systemd/system/casper-md5check.service.

However there's still a couple more casper related files found by searching for 'casper*' that can be removed:

```
sudo rm /etc/systemd/system/casper.service

```

```
sudo rm /etc/systemd/system/multi-user.target.wants/casper-md5check.service
```

```
sudo rm /etc/systemd/system/final.target.wants/casper.service
```

You can then do
`sudo systemctl daemon-reload`
and
`sudo systemctl reset-failed`
in order to reset the failures.

```
systemctl --failed
```
```
sudo systemctl is-system-running
```


