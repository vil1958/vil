https://computingforgeeks.com/how-to-configure-nfs-client-on-ubuntu-debian-linux/
`sudo showmount --exports 192.168.1.2`

#### Mounting an NFS share with mount

The mount utility can be used to mount an NFS share with the following command:
```
mount -t nfs -o options host:/remote/export /local/directory
```

-   **options** is a comma-delimited list of mount options.
-   **host** is the _host name_, _IP address_, or _fully qualified domain name_ of the NFS server exporting the file system to be mounted.
-   **/remote/export** is the file system or directory being exported from the server, i.e, directory to be mounted.
-   **/local/directory** is the client location where _/remote/export_ is mounted.

In our example, this will be:
```
sudo umount /mnt/Z
sudo mount -t nfs -o nfsvers=4 192.168.1.2:/volume1/share /mnt/Z
```
Confirm:
```
df -hT | grep /mnt/Z
```
Try write files to the directory.
```
echo "Test file1" | sudo tee /mnt/Z/testfile1
echo "Test file2" | sudo tee /mnt/Z/testfile2
```

