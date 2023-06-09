# How to Install Blueman Bluetooth Manager on Ubuntu?

[https://techsphinx.com/linux/install-blueman-ubuntu/](https://techsphinx.com/linux/install-blueman-ubuntu/)

`sudo apt update`
`sudo apt install bluez bluez-tools`

Once BlueZ is installed you can proceed with the installation of Blueman

ou can install Blueman on Ubuntu by two methods:

• Using the Ubuntu Software Center (Graphical method)

• Using terminal

### Install Blueman on Ubuntu via terminal
`sudo apt install blueman`

Once installation is finished, you can start Blueman using the command:
`blueman-manager`

## Enabling Bluetooth

On Linux Distros like Ubuntu, Bluetooth is already set up. You can check that by running the following command in terminal:
`sudo systemctl status bluetooth.service`

If it's running, then no need to follow the below steps, you can go ahead with connecting Bluetooth devices.

If it is not running, then follow these steps:

Run the following command, if you are using a Bluetooth dongle:
modprobe btusbTo start the Bluetooth service, run this command:
`sudo systemctl start bluetooth.serviceTo`

make it persistent after reboot, use this command:
`sudo systemctl enable bluetooth.service`

Finally, check the status of Bluetooth service using:
`sudo systemctl status bluetooth.service`