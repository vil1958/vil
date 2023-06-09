https://vitux.com/how-to-install-ntp-server-and-client-on-ubuntu/

## Configure NTP Client to be Time Synced with the NTP Server

Let us now configure our Ubuntu client machine to be time-synchronized with the NTP server.

### Step 1: Install ntpdate

The ntpdate command will let you manually check your connection configuration with the NTP-server. Open the Terminal application on the client machine and enter the following command as sudo:
`sudo apt-get install ntpdate`

### Step 2: Specify IP and hostname of the NTP server in the hosts file

For your NTP server to be resolved by a hostname in your client machine, you need to configure your /etc/hosts file.

Open the hosts file as sudo in the nano editor by entering the following command:

$ sudo nano /etc/hosts

Now add your NTP server’s IP and specify a hostname as follows in this file:

	192.168.1.2 NTP-server-host

### Step 3: Check if the client machine’s time is synchronized with an NTP server

The following ntpdate command will let you manually check if time is synchronized between the client and server systems:
`sudo ntpdate NTP-server-host`
or  `sudo pool.ntp.org`
The output should ideally show a time offset between the two systems.

https://superuser.com/questions/639202/updating-time-ntpdate3108-the-ntp-socket-is-in-use-exiting
```
sudo service ntp stop
sudo ntpdate NTP-server-host
sudo service ntp start
```

If you want to execute `ntpdate` with the `ntp` daemon already up and running, use the following command:

```
# ntpdate -u pool.ntp.org
```

and it will use a different port.
**Rather than using `-u`**, you can also do this which I think uses port 123 (rather than a non 'privileged' port):

`service ntp stop`, then  
`ntpdate <server url>` (without the -u) and finally  
`service ntp start`.

This seems to bypass the port blockage issue, at least to set the clock one time. If `-u` works, but this does not, then it's a pretty sure sign that the port is blocked, or the server is unresponsive, ...

---

**Another issue** that I had to solve was that for me the Debian default `/etc/ntp.conf` configuration included 4 lines to the pools: `debian.pool.ntp.org`. None of those servers worked. I got this error message:

> Error resolving debian.pool.ntp.org: No address associated with  
> hostname (-5) 24 Mar 04:49:27 ntpdate[15115]: Can't find host  
> debian.pool.ntp.org: No address associated with hostname (-5) 24 Mar  
> 04:49:27 ntpdate[15115]: no servers can be used, exiting

I had to change the servers to `us.pool.ntp.org`.