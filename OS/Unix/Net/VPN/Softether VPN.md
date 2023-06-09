How to set up Softether VPN client on Ubuntu 20.04 / Linux [Simple]
https://intellexlab.medium.com/how-to-set-up-softether-vpn-client-on-ubuntu-20-04-linux-simple-41768d76ea3

If for any reason, you have to use the SoftEther VPN Client on Linux / Ubuntu environment then you would have noticed that right now there is no UI interface available by SoftEther VPN client for Linux environment. Only the command line tool is available to configure and connect to the VPN server, which is quite a complicated process.

To make things easier, I have written bash scripts to easily configure, connect/disconnect VPN. The scripts are available at my git repository [here](https://github.com/mfaizanse/intellexlab-files/tree/main/softether-vpn-client). Below I have mentioned the steps needed to properly set up the SoftEther VPN Client on Ubuntu / Linux.

# Prerequisites:

1.  VPN User Account.
2.  VPN connection configurations (VPN Server Host name, Port and IPv4 address etc.). **Note**: If you don’t know the VPN Server Host IPv4 address, then you can easily find it using the command “nslookup <hostname>”, or simply visit the website ([https://whatismyipaddress.com/hostname-ip](https://whatismyipaddress.com/hostname-ip)).
3.  Linux (Ubuntu, Linux Mint etc.) machine.
4.  Make sure that IP forwarding is enabled in your system. **Note**: To check if IP forwarding is enabled, open terminal window, and run the following command:

cat /proc/sys/net/ipv4/ip_forward

If it returns ‘1’, then IP forwarding is enabled and you are good to go to Step 1. Otherwise, you need to enable IP forwarding in /etc/sysctl.conf file.

-   Open the file `/etc/sysctl.conf` in an editor (e.g. `sudo gedit /etc/sysctl.conf`).
-   Uncomment the line: _net.ipv4.ip_forward=1. Save and close the file._
-   Run the following command in terminal: `sysctl -p` .

5. Find the local gateway of your system by running the command: `sudo netstat -rn` . Please note down the gateway IPv4 address, we will need it in step 2. In the following example, the gateway is: `192.168.0.1` .

![](https://miro.medium.com/max/700/1*wFY0-aj0qKrvvThts0JUzQ.png)

# Step 1: Download and extract SoftEther VPN Client

1. Go to SoftEther official website ([https://www.softether.org](https://www.softether.org/)) and download the client for your machine. Navigate to `Download > Download SoftEther VPN` . Click on `Download SoftEther VPN` .

![SoftEther Download Link](https://miro.medium.com/max/700/1*zn6R9V04xbUfc2_i2e3aWg.png)

2. Make sure you have selected the correct CPU type.

![SoftEther VPN Client Linux Download](https://miro.medium.com/max/700/1*luA1otWOMCQ5YwBMvUOqfQ.png)

3. Extract the downloaded tar.gz file to the location `~/softether`.

**Note**: You can also extract it to any other location, but then you would need to update the location configurations in step 2 (in file: vpn_config). To extract the file, you can use the following commands:

mkdir ~/softethertar -xf softether-vpnclient-<version_info>.tar.gz -C ~/softether

Now, download the [script files from my repository](https://github.com/mfaizanse/intellexlab-files/tree/main/softether-vpn-client), and save them anywhere on your machine.

# Step 2: Setup the SoftEther VPN Client

1.  Open terminal to the location where you have saved these script files.
2.  First, we need to set the configuration variables in the file named `vpn_config`. Open the file in your favourite editor and set the following variables:

-   CLIENT_DIR: The location of the SoftEther VPN Client extracted in step 1. e.g. `/home/<username>/softether/vpnclient` .
-   NIC_NAME: The name for virtual network interface. You can use the default one `nic1` .
-   ACCOUNT_NAME: The name of the VPN Account. You can use any text here. e.g. cisco, cactusvpn etc.
-   VPN_HOST_IPv4: The VPN Server Host IP address, which is mentioned in prerequisites e.g. `169.123.123.123`.
-   LOCAL_GATEWAY: The gateway IPv4 address which we noted in prerequisite#5. e.g. `192.168.0.1` .

![](https://miro.medium.com/max/700/1*TuTwpR_aQCj5C6h5yrsBeg.png)

3. Now, make sure the script files are marked as executables. You can review the scripts if you want to, for security concerns :)

You can run the following commands on the terminal to make them executables:

chmod +x ./setup-client.shchmod +x ./remove-client.shchmod +x ./vpn-connect.shchmod +x ./vpn-disconnect.sh

4. Run the first setup script, by running the command:

./setup-client.sh

Follow the instructions on the terminal, and provide the asked information.

-   _Accept the License Agreement by entering 1._
-   _Accept the Terms and conditions by entering 1._
-   _Destination VPN Server Host Name and Port Number:_ `_<hostname>:<port>_` _. e.g. vpn.intellexlab.com:443._
-   _Destination Virtual Hub Name:_ `_<hub_name>_` _. The hub name provided by your VPN provider._
-   _Connecting User Name:_ `_<your_vpn_username>_` _._
-   _Used Virtual Network Adapter Name:_ `_<NIC_NAME>_`_. The NIC name we set in vpn_config. e.g._ `_nic1_`_._
-   _Password:_ `_<your_vpn_password>_` _._
-   _Specify standard or radius:_ `_radius_` _. Or according to your VPN provider._

When done, review the output on the terminal window to see if there are any errors/issues. If not, continue to next step.

# Step 3: Connect to the VPN

Since now everything is configured, you can connect to the VPN by running the command:

./vpn-connect.sh

Once completed, you should be able to browse the internet. Hurryyy!!!

## Disconnect / Sign-Out

To disconnect from the VPN, simply run `./vpn-disconnect.sh`. Next time, you want to connect again, just simply run `./vpn-connect.sh` .

To permanently sign out your VPN account, first disconnect and then run `./remove-client.sh` .

> **_Disclaimer_**_: Please use my scripts at your risk. Its working fine for me. If you face any issues, feel free to comment below._

# Ubuntu SoftEther VPN Manual Installation
https://www.rapidvpn.com/setup-vpn-softether-ubuntu

1. SoftEther VPN Client installation process on Ubuntu require advanced linux skills.  
Download SoftEther VPN Client from the official site selecting your platform and CPU: [http://www.softether-download.com/en.aspx?product=softether](http://www.softether-download.com/en.aspx?product=softether)  
  
![SoftEther VPN connection on Ubuntu - Step 1](https://www.rapidvpn.com/images/howto/ubuntu/softether/1.png)  
* current selection is for linux 64bit OS.

2. Uncompress downloaded file to a local folder, run "make" command and accept all your licence agreements. When the process is completed, start the vpnclient service as root:`   #sudo ./vpnclient start   `

3. Create your connection setting using your assigned RapidVPN server details. Your file content must be similar to:`declare root { bool CheckServerCert false uint64 CreateDateTime 0 uint64 LastConnectDateTime 0 bool StartupAccount false uint64 UpdateDateTime 0 declare ClientAuth { uint AuthType 1 string Username rapidvpnusername } declare ClientOption { string AccountName rapidvpn1 uint AdditionalConnectionInterval 1 uint ConnectionDisconnectSpan 0 string DeviceName se bool DisableQoS false bool HalfConnection false bool HideNicInfoWindow false bool HideStatusWindow false string Hostname x.x.x.x string HubName default uint MaxConnection 1 bool NoRoutingTracking false bool NoTls1 false bool NoUdpAcceleration false uint NumRetry 4294967295 uint Port 443 uint PortUDP 0 string ProxyName $ byte ProxyPassword $ uint ProxyPort 0 uint ProxyType 0 string ProxyUsername $ bool RequireBridgeRoutingMode false bool RequireMonitorMode false uint RetryInterval 15 bool UseCompress false bool UseEncrypt true } }`
You must change x.x.x.x with your assigned server IP and rapidvpnusername with your assigned username. Save this file to **/home/rapidvpn1.vpn**.

4. Now, connect to your local vpn client with "vpncmd" and crate your local NIC named "se":`#vpncmd vpncmd command - SoftEther VPN Command Line Management Utility SoftEther VPN Command Line Management Utility (vpncmd command) Version 2.00 Build 9387 (English) Compiled 2013/09/16 12:45:42 by yagi at pc25 Copyright (c) SoftEther Project. All Rights Reserved. By using vpncmd program, the following can be achieved. 1. Management of VPN Server or VPN Bridge 2. Management of VPN Client 3. Use of VPN Tools (certificate creation and Network Traffic Speed Test Tool) Select 1, 2 or 3: 2 Specify the host name or IP address of the computer that the destination VPN Client is operating o n. If nothing is input and Enter is pressed, connection will be made to localhost (this computer). Hostname of IP Address of Destination: localhost Connected to VPN Client "localhost". VPN Client>remoteenable RemoteEnable command - Allow Remote Management of VPN Client Service The command completed successfully. VPN Client>niccreate NicCreate command - Create New Virtual Network Adapter Virtual Network Adapter Name: se The command completed successfully.`
                    

5. Import your created configuration:`   VPN Client>accountimport AccountImport command - Import VPN Connection Setting Import Source File Name: /home/rapidvpn1.vpn The VPN Connection Setting "rapidvpn1" was imported. The command completed successfully.   `

6. Setup username and password for your RapidVPN imported connection:`   VPN Client>AccountUsernameSet rapidvpn1 AccountUsernameSet command - Set User Name of User to Use Connection of VPN Connection Setting Connecting User Name: rapidvpn_username The auth type for this VPN Connection Setting is currently set as password authentication. After c hanging the user name, you must use the AccountPasswordSet command to reset the password. The command completed successfully. VPN Client>AccountPasswordSet rapidvpn1 AccountPasswordSet command - Set User Authentication Type of VPN Connection Setting to Password Au thentication Please enter the password. To cancel press the Ctrl+D key. Password: **************** Confirm input: **************** Specify standard or radius: radius The command completed successfully. VPN Client>accountconnect rapidvpn1 AccountConnect command - Start Connection to VPN Server using VPN Connection Setting The command completed successfully. VPN Client>accountstartupset rapidvpn1 AccountStartupSet command - Set VPN Connection Setting as Startup Connection The command completed successfully.   `

7. Make your vpn adapter to get ip address from RapidVPN NAS:`   #sudo dhclient vpn_se   `

8. **Final info**  
Now your VPN should be connected. Please note, under linux - the routing table is not automatically modified by SoftEther Client and you need to manually tweek your routing information to make your vpn connection to route all traffic. Also, you will need to enable ip forward option in **"/etc/sysctl.conf"**:`   #net.ipv4.ip_forward=1   `  
and load with command:`   #sysctl -p   `

# SoftEther Linux Howto

https://github.com/bgilmer77/SoftEther-VPN-Client-Setup-on-Linux/blob/master/softether-linux-howto.md

This how-to is written to support those who wish to connect to a SoftEther VPN established by the Advanced Media Workflow Association (AMWA).
This VPN has been established to provide remote connectivity in support of AMWA workshops.
The purpose of these workshops is to further the development of technical specifications issues by the AMWA.

This how-to is written as a quick guide for those who want to install and configure the SoftEther VPN Client on a Linux system.
Specifically, these instructions were written for an Intel NUC running Kali Linux.
These instructions were based upon SoftEther documentation and an article found at https://www.cactusvpn.com/tutorials/how-to-set-up-softether-vpn-client-on-linux/.

## Install SoftEther
- Download the appropriate version of the VPN client from www.softether.org
- Run the `.install.sh` script that is provided with the client
- Start the VPN Client `vpnclient start`

## Configure a VPN account
The `vpncmd` utility is used to configure accounts and to connect to a VPN.
This utility connects to the VPN client running on your local machine.

- Run `vpncmd` and choose option 2.  Press `ENTER` to connect to the client running on your local machine.
- `check` to test your installation.
- `NicCreate vpn_se` to create a virtual VPN interface on your computer
- `AccountCreate [accountName]` to create your account.
You will need the following information:
  * User Name (You will need to contact the AMWA to obtain login credentials)
  * Account Name (this may be any name you choose)
  * VPN server URL (The current AMWA URL is `amwa-nmos-vpn.softether.net`)
  * port number for the VPN server. In the case of the AMWA VPN it is 443
  * Virtual hub to connect to (For AMWA use `NMOS-VPN`)
  * Virtual Network Adapter Name (You created this earlier - `vpn_se`)
  
  Note: during account creation, when asked, `Desination VPN Server Host Name and Port Number:`, enter the information as follows:
  `amwa-nmos-vpn.softether.net:443`

- `AccountPassword [accountName]` to enter your VPN account password.  Specify `Standard` when requested.

## Connect to SoftEther VPN
- Run `vpncmd` if you have not already done so.  Select option 2 and press `ENTER` to connect to your local VPN Client.
- `AccountConnect [accountName]` to connect to the VPN server
- `AccountList` shows connection settings.  Look for `Connected` under `Status`
- Enter `^D` to exit the `vpncmd` utility

## Modify Route Table
Now that you are connected to the VPN and have an IP address, you must modify your IP route table to send traffic through the VPN.
There are two procedures below.
The first will route ALL traffic from your computer through the VPN, including traffic destined for the Internet.
The second will route traffic from your computer throught the VPN and on to the VPN network, but leaves your default route in place so that traffic destined for the Internet still uses your local network interface.

### Route ALL traffic from your computer through the VPN
N.B. you will lose connectivity to local devices on your network such as printers.  (I am short on time - if anyone using this can submit a PR with commands to restore routing for local devices, please do so.)
- `cat /proc/sys/net/ipv4/ip_forward` to check if IP Forwarding is enabled.  If '1' is returned then skip the next step

(You may need to `sudo su` to perform some of the next commands)
- `echo 1 > /proc/sys/net/ipv4/ip_forward`
- `dhclient vpn_vpn_se` to obtain an IP address from the VPN DHCP server
- `ip a` to show the `vpn_se` interface and the assigned IPv4 address
- `netstat -rn` to show the route table prior to modification.

The following assumes that your local network is 192.168.0.0/24 and your default gateway is 192.168.0.1, and that the IP address of the remote VPN server is 15.48.223.55.
- `sudo ip route add 15.48.223.55/32 via 192.168.0.1`
- Delete the old default route. `ip route del default via 192.168.0.1`
Review the new route table with `netstat -rn`

Ping google's nameservers at 8.8.8.8 `ping 8.8.8.8 -c4`

Check your public IP address `wget -qO- http://ipecho.net/plain ; echo` <- note that in this line, O is "capital letter O".

### Route only VPN traffic through the VPN interface
- `cat /proc/sys/net/ipv4/ip_forward` to check if IP Forwarding is enabled.  If '1' is returned then skip the next step

(You may need to `sudo su` to perform some of the next commands)
- `echo 1 > /proc/sys/net/ipv4/ip_forward` 
- `dhclient vpn_vpn_se` to obtain an IP address from the VPN DHCP server
- `ip a` to show the `vpn_se` interface and the assigned IPv4 address
- `netstat -rn` to show the route table prior to modification
The following assumes that your local network is 192.168.0.0/24 and your default gateway is 192.168.0.1, and that the IP address of the remote VPN server is 15.48.223.55.

- Delete the default route added by the `dhclient` command you issued earlier. `sudo ip route del default via 192.168.0.1`


Review the new route table with `netstat -rn`

Ping google's nameservers at 8.8.8.8 `ping 8.8.8.8 -c4`

Ping the remote gateway at 192.168.0.1 `ping 192.168.0.1 -c4`

Check your public IP address `wget -qO- http://ipecho.net/plain ; echo` <- note that in this line, O is "capital letter O".
The IP address returned should be your local public IP address.

### Route issues on cloud computers

Be aware that the `dhclient` command will install a deafult route to the gateway received via DHCP over the VPN.  
If you are using a cloud Linux instance, you will loose your ssh (or other) Internet connectivity to your cloud Linux instance.

In such as case, you may want to create a script with the following commands:
```
dhclient vpn_vpn_se
route add default gw X.Y.Z.J eth0
```
Where X.Y.Z.J is the IP address of your cloud Linux instance Internet gateway, and `eth0` is the Internet facing network interface.

Use `netstat -nr` to ensure that the desired route to the VPN subnet IPs is properly being routed over the VPN interface `vpn_vpn_se`.


## Disconnect from VPN and restore route table
- `vpnclient stop`
- `ip route del 15.48.223.55/32`
- `ip route add default via 192.168.0.1`
