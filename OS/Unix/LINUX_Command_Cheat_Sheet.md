
[A QUICK REFERENCE GUIDE from: LinuxTrainingAcademy.com](https://www.linuxtrainingacademy.com/wp-content/uploads/2016/12/LinuxCommandLineCheatSheet.pdf?__s=5dnnz5h0ujfcqdnyyhzv)

Table of Contents:
- 1 - SYSTEM INFORMATION
- 2 - HARDWARE INFORMATION 
- 3 - PERFORMANCE MONITORING AND STATISTICS
- 4 - USER INFORMATION AND MANAGEMENT
- 5 - FILE AND DIRECTORY COMMANDS 
- 6 - PROCESS MANAGEMENT
- 7 - FILE PERMISSIONS
- 8 - NETWORKING
- 9 - ARCHIVES (TAR FILES)
- 10 - INSTALLING PACKAGES 
- 11 - SEARCH
- 12 - SSH LOGINS
- 13 - FILE TRANSFERS
- 14 - DISK USAGE
- 15 - DIRECTORY NAVIGATION
- 16 - SECURITY 
- 17 - LOGGING AND AUDITING 10

1. SYSTEM INFORMATION:
`uname -a` # Display Linux system information
`uname -r` # Display kernel release information
`cat /etc/redhat-release` # Show which version of Red Hat installed
`lsb_release -a` # Show which version of Ubuntu installed
`uptime` # Show how long the system has been running + load
`hostname` # Show system host name
`hostname -I` # Display all local IP addresses of the host
`last reboot` # Show system reboot history
`date` # Show the current date and time
`cal` # Show this month's calendar
`w` # Display who is online
`whoami` # Who you are logged in as

2 - HARDWARE INFORMATION
`dmesg` # Display messages in kernel ring buffer
`cat /proc/cpuinfo` # Display CPU information
`cat /proc/meminfo` # Display memory information
`free -h` # Display free and used memory ( -h for human readable, -m for MB, -g for GB.)
`lspci -tv` # Display PCI devices
`lsusb -tv` # Display USB devices
`dmidecode` # Display DMI/SMBIOS (hardware info) from the BIOS
`hdparm -i /dev/sda` # Show info about disk sda
`hdparm -tT /dev/sda` # Perform a read speed test on disk sda
`badblocks -s /dev/sda` # Test for unreadable blocks on disk sda
`shw` # Display information about CPU, memory, storage, and network interfaces

3 - PERFORMANCE MONITORING AND STATISTICS
`top` # Display and manage the top processes
`htop` # Interactive process viewer (top alternative)
`mpstat` 1 # Display processor related statistics
`vmstat 1` # Display virtual memory statistics
`iostat 1` # Display I/O statistics
`tail -100 /var/log/messages` # Display the last 100 syslog messages (Use /var/log/syslog for Debian based systems.)
`tcpdump -i eth0` # Capture and display all packets on interface eth0
`tcpdump -i eth0` 'port 80' # Monitor all traffic on port 80 ( HTTP )
`lsof` # List all open files on the system
`lsof -u user `# List files opened by user
`free -h` # Display free and used memory ( -h for human readable, -m for MB, -g for GB.)
`watch df -h` # Execute "df -h", showing periodic updates
`mpstat` # Display statistics about CPU usage
`pidstat` # Display statistics about processes running

4 - USER INFORMATION AND MANAGEMENT
`id` # Display the user and group ids of your current user.
`last` # Display the last users who have logged onto the system.
`who` # Show who is logged into the system.
`w `# Show who is logged in and what they are doing.
`groupadd test` # Create a group named "test".
`useradd -c "John Smith" -m john` # Create an account named john, with a comment of "John     Smith" and create the user's home directory.
`userdel john` # Delete the john account.
`usermod -aG sales john` # Add the john account to the sales group

5 -FILE AND DIRECTORY COMMANDS
`ls -al` # List all files in a long listing (detailed) format
`pwd` # Display the present working directory
`mkdir` directory # Create a directory
`rm file` # Remove (delete) file
`rm -r directory` # Remove the directory and its contents recursively
`rm -f file` # Force removal of file without prompting for confirmation
`rm -rf directory` # Forcefully remove directory recursively
`cp file1 file2` # Copy file1 to file2
`cp -r source_directory destination` # Copy source_directory recursively to destination. If destination exists, copy source_directory into destination, otherwise create destination with the contents of source_directory.
`mv file1 file2` # Rename or move file1 to file2. If file2 is an existing directory, move file1 into directory file2
`ln -s /path/to/file linkname` # Create symbolic link to linkname
`touch file` # Create an empty file or update the access and modification times of file. 
`cat file` # View the contents of file
`less file` # Browse through a text file
`head file` # Display the first 10 lines of file
`tail file` # Display the last 10 lines of file
`tail -f file` # Display the last 10 lines of file and "follow" the file as it grows.

6 - PROCESS MANAGEMENT
`ps` # Display your currently running processes
`ps -ef` # Display all the currently running processes on the system.
`ps -ef | grep processname` # Display process information for processname
`top` # Display and manage the top processes
`htop` # Interactive process viewer (top alternative)
`kill pid` # Kill process with process ID of pid
`killall processname` # Kill all processes named processname
`program &` # Start program in the background
`bg` # Display stopped or background jobs
`fg` # Brings the most recent background job to foreground
`fg n` # Brings job n to the foreground
`nohup processname` # Runs a process even after user logs out

7-FILE PERMISSIONS
user group world
U     G      W
rwx rwx rwx `chmod 777 filename` # Use sparingly!
rwx rwx r-x `chmod 775 filename`
rwx r-x r-x `chmod 755 filename`
rw- rw- r-- `chmod 664 filename`
rw- r-- r-- `chmod 644 filename`

LEGEND:
U = User G = Group W = World r = Read w = write x = execute - = no access

`chown john /path/to/file` # Change ownership of /path/to/file to john
`chgrp sales /path/to/file` # Change group ownership of /path/to/file to group sales

8 - NETWORKING
`ip a` # Display all network interfaces and IP address
`ip addr show dev eth0` # Display eth0 address and details
`ethtool eth0` # Query or control network driver and hardware settings
`ping host` # Send ICMP echo request to host
`whois domain` # Display whois information for domain
`dig domain` # Display DNS information for domain
`dig -x IP_ADDRESS` # Reverse lookup of IP_ADDRESS
`host domain` # Display DNS IP address for domain
`hostname -i` # Display the network address of the host name.
`hostname -I` # Display all local IP addresses of the host.
`wget http://domain.com/file` # Download http://domain.com/file
`netstat -nutlp` # Display listening tcp and udp ports and corresponding programs
`ifconfig` # Display information about network interfaces
`traceroute host` # Display the path that packets take to host
`tcpdump` # Capture and analyze network traffic

9 - ARCHIVES (TAR FILES)
`tar cf archive.tar directory` # Create tar named archive.tar containing directory.
`tar xf archive.tar` # Extract the contents from archive.tar.
`tar czf archive.tar.gz directory` # Create a gzip compressed tar file name archive.tar.gz.
`tar xzf archive.tar.gz` # Extract a gzip compressed tar file.
`tar cjf archive.tar.bz2 directory` # Create a tar file with bzip2 compression
`tar xjf archive.tar.bz2` # Extract a bzip2 compressed tar file.

10 - INSTALLING PACKAGES
`yum search keyword` # Search for a package by keyword.
`yum install package` # Install package.
`yum info package` # Display description and summary information about package for RHEL based systems.
`rpm -i package.rpm` # Install package from local file named package.rpm
`yum remove package` # Remove/uninstall package for RHEL based systems.
`yum update package` # Update package with name package for RHEL based systems.

`tar zxvf sourcecode.tar.gz`  # Install software from source code.
`cd sourcecode`
`./configure`
`make`
`make install`

`apt-get update` # Update package list for Debian based systems
`apt-get upgrade` # Upgrade all installed packages to their newest version for Debian based systems.
`apt-get install package` # Install package with name package for Debian based systems.
`apt-remove package` # Remove package with name package for Debian based systems.

11- SEARCH
`grep pattern file` # Search for pattern in file
`grep -r pattern directory` # Search recursively for pattern in directory
`locate name` # Find files and directories by name
`find /home/john -name 'prefix*'` # Find files in /home/john that start with "prefix".
`find /home -size +100M` # Find files larger than 100MB in /home
`whereis program` # Display the location of the binary, source and manual page files of program. `which program` # Display the path of executable that would run if program is executed.

12 - SSH LOGINS
`ssh host` # Connect to host as your local username.
`ssh user@host` # Connect to host as user
`ssh -p port user@host` # Connect to host using port
`ssh-keygen` # Create a new SSH key pair.
`ssh-copy-id user@host` # Copy SSH key to the remote host to enable passwordless logins for user.

13 -FILE TRANSFERS
`scp file.txt server:/tmp` # Secure copy file.txt to the /tmp folder on server
`scp server:/var/www/*.html /tmp` # Copy *.html files from server to the local /tmp folder.
`scp -r server:/var/www /tmp` # Copy all files and directories recursively from server to the current system's /tmp folder.
`rsync -a /home /backups/` # Synchronize /home to /backups/home
`rsync -avz /home server:/backups/` # Synchronize files/directories between the local and remote system with compression enabled
`ftp host` # Connect to FTP server on the remote host.

14 - DISK USAGE
`df -h` # Show free and used space on mounted filesystems
`df -i` # Show free and used inodes on mounted filesystems
`fdisk -l` # Display disks partitions sizes and types
`du -ah` # Display disk usage for all files and directories in human readable format
`du -sh` # Display total disk usage off the current directory
`du -a directory` # Display size of all files in directory.
`findmnt` # List all mounted file systems with details.

15 - DIRECTORY NAVIGATION
`cd ..` # To go up one level of the directory tree. (Change into the parent directory.)
`cd` # Go to the $HOME directory
`cd /etc` # Change to the /etc directory
`alias goto=’cd /etc/’` # Create goto alias for command cd /etc/ .

16 - SECURITY
`passwd` # Change the current user's password.
`sudo -i` # Switch to the root account with root's environment. (Login shell.)
`sudo -s` # Execute your current shell as root. (Non-login shell.)
`sudo -l` # List sudo privileges for the current user.
`visudo` # Edit the sudoers configuration file.
`getenforce` # Display the current SELinux mode
`sestatus` # Display SELinux details such as the current SELinux mode, the configured mode, and the loaded policy.
`setenforce 0` # Change the current SELinux mode to Permissive. (Does not survive a reboot.) `setenforce 1` # Change the current SELinux mode to Enforcing. (Does not survive a reboot.) `SELINUX=enforcing` # Set the SELinux mode to enforcing on boot by using this setting in the /etc/selinux/config file.
`SELINUX=permissive` # Set the SELinux mode to permissive on boot by using this setting in the /etc/selinux/config file.
`SELINUX=disabled` # Set the SELinux mode to disabled on boot by using this setting in the /etc/selinux/config file.

17-LOGGING AND AUDITING
`dmesg` # Display messages in kernel ring buffer.
`journalctl` # Display logs stored in the systemd journal.
`journalctl -u servicename` # Display logs for a specific unit (service).












