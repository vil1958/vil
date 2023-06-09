https://kodi.wiki/view/HOW-TO:Install_Kodi_for_Linux

### Adding Team Kodi PPA repository

Use the command line terminal in Ubuntu, and enter the following commands. Follow the prompts as you would any other software installation.

sudo apt install software-properties-common
sudo add-apt-repository -y ppa:team-xbmc/ppa
sudo apt install kodi

  
The Kodi repositories are as follows:

**Note:** Although the URL still has "Team XBMC" in the title, these are the current URLs for Kodi.

[https://launchpad.net/~team-xbmc/+archive/ppa](https://launchpad.net/~team-xbmc/+archive/ppa)

`**ppa:team-xbmc/ppa**`

Final release builds

[https://launchpad.net/~team-xbmc/+archive/unstable](https://launchpad.net/~team-xbmc/+archive/unstable)

`**ppa:team-xbmc/unstable**`

[Betas and release candidates](https://kodi.wiki/view/Development_builds "Development builds")

[https://launchpad.net/~team-xbmc/+archive/xbmc-nightly](https://launchpad.net/~team-xbmc/+archive/xbmc-nightly)

`**ppa:team-xbmc/xbmc-nightly**`

[Nightly builds](https://kodi.wiki/view/Development_builds "Development builds")

Note that this PPA only provides builds for Ubuntu i386 and Ubuntu amd64 but _not for Ubuntu armhf_, which can run on a Raspberry Pi.

  

### Installing binary add-ons (PVR, audio decoders, audio encoders, screensavers, visualizations, audio DSP)

See: **[Ubuntu binary add-ons](https://kodi.wiki/view/Ubuntu_binary_add-ons "Ubuntu binary add-ons")**

  

### Installing a development build

See also: **[Development builds](https://kodi.wiki/view/Development_builds "Development builds")**

To install a beta/unstable version of Kodi you must first add the unstable repository, then install XBMC. Use `ppa:team-xbmc/xbmc-nightly` for nightly builds and `ppa:team-xbmc/unstable` for [beta](https://kodi.wiki/view/Development_builds "Development builds") builds.

sudo apt install software-properties-common
sudo add-apt-repository -y ppa:team-xbmc/xbmc-nightly
sudo apt install kodi

Note that if you have any addons (such as PVR clients), these must be updated as well (they will not be updated automatically):

sudo apt install kodi-pvr-mythtv

  

### Upgrading

To update Kodi when a new version is released, just do a general system/package or use the following commands in the terminal (or via [SFTP](https://kodi.wiki/view/SFTP "SFTP")):

sudo apt update
sudo apt upgrade --with-new-pkgs

  

### Downgrading to a stable version from a development version

If you install a nightly build or an unstable release and want to return to a stable release, follow these instructions:

Remove the unstable or nightly PPA:

apt-cache policy | grep -Eo 'team-xbmc/(unstable|nightly)' | sudo xargs -r add-apt-repository -ryP

Then restore the stable version with the following commands:

sudo add-apt-repository ppa:team-xbmc/ppa
sudo apt-get update
sudo apt-get remove kodi kodi-x11
sudo apt-get install kodi

  

### Downgrading between newer and older stable versions

If you want to return to the next most recent stable release, follow these instructions:

Remove the current stable packages and PPA:

sudo apt purge kodi*
sudo add-apt-repository -r ppa:team-xbmc/ppa

Then install the "oldstable" version with the following commands:

sudo add-apt-repository -y ppa:team-xbmc/kodi-old
sudo apt install kodi

  

### Reverting to an earlier nightly

ALthough launchpad doesn't list older nightlies in their PPA, they are usually still available for download directly from the website. Visit the [xbmc-nightly repository index](https://launchpad.net/~team-xbmc/+archive/ubuntu/xbmc-nightly/+packages?field.name_filter=&field.status_filter=superseded&field.series_filter=), where you will then have to download the appropriate .deb files and manually install them using `sudo dpkg -i [path to downloaded file]`.

  

### Uninstalling

If you need to uninstall Kodi and purge its global configuration files (for instance, in the attempt to troubleshoot a persistent crash or other errors), do so by using the first of the following commands. If that fails to solve the issue, you will likely need to remove your user settings folder with all of your settings and library data to return to a state equivalent to what existed before Kodi was first installed on the system. This will not delete any videos or music, but just the settings and library data itself, but it is still recommended to keep a backup of them in case it's discovered that they weren't at issue and you are able to effect another solution. An example of how to accomplish a backup and then deletion of your user settings is provided on the last two lines, the highlighted one being responsible for making the backup which can thereafter be found in your home folder with the filename kodi-backup__timestamp_.tar.xz.

sudo apt purge kodi*
tar cf - "${HOME}/.kodi/" | xz -z9e - >"${HOME}/kodi-backup_$(date +%m%d%y-%H%M).tar.xz"
rm -Ri "${HOME}/.{kodi,xbmc}/"

## Flatpak

If you want to use the flatpak version and do not know, if your distro supports flatpak check [https://flatpak.org/setup/](https://flatpak.org/setup/) for install instructions.

After you've sorted that, go to [https://flathub.org/apps/details/tv.kodi.Kodi](https://flathub.org/apps/details/tv.kodi.Kodi) and hit the install button or copy the instructions at the end of the page to your terminal and execute them.

  

### Beta channel

You can also run Kodi flatpak betas, if you install the flatpak beta remote.

flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo

Then install via

flatpak install flathub-beta tv.kodi.Kodi

You should now have an entry on your system, that's labeled `Kodi (Beta)`, that you can use to run the beta. Be warned, it will use the same paths as the older versions, so they might clash. Usually they go along well, but make backups, if you need your data.

## Embedded/Appliance type install

### LibreELEC

Main page: **[LibreELEC](https://kodi.wiki/view/LibreELEC "LibreELEC")**

**LibreELEC** (short for "_Libre Embedded Linux Entertainment Center_") is small and very fast booting, open source [JeOS (Just enough Operating System)](https://kodi.wiki/view/JeOS_implementations_for_Kodi "JeOS implementations for Kodi"). LibreELEC is a complete media center software suite for embedded systems and computers, as it comes with a pre-configured version of Kodi and optional third-party [PVR](https://kodi.wiki/view/PVR "PVR") backend software.

  

## Third Party Repositories

The instructions in this section are for unofficial Linux binaries that are un/semi supported by Team Kodi. Most of those binaries use system ffmpeg or even worse totally untested libav, which is not recommended for Kodi as we support ffmpeg only.

  

### Debian

Debian GNU/Linux ships its own **Kodi from Debian** flavor with following changes:

-   Only system libraries are used (no embedded third-party libraries except of libdvdread and libdvdnav)
-   Old web interface (Chorus) is shipped to ensure Debian Free Software Guides (DFSG) compatibility

as well as a subset of Kodi binary addons packaged in [main repository of Debian](https://qa.debian.org/developer.php?email=vasek.gello@gmail.com).

  

![Stop hand.png](https://kodi.wiki/images/thumb/f/ff/Stop_hand.png/30px-Stop_hand.png)

**Team Kodi offers no official support to "Kodi from Debian"!** Please refer to links below for support!

  
The support for Kodi from Debian is provided via the following channels:

1.  [Kodi from Debian - Support Thread](https://forum.kodi.tv/showthread.php?tid=363611) on Kodi forums
2.  [Github issues](https://github.com/xbmc/xbmc/issues)
3.  [Debian Bug Tracker](https://bugs.debian.org/)

  

#### Checking installed and available Kodi packages

You can check what versions of Kodi and its binary add-ons are installed with the following command:

dpkg -l | grep kodi

To check what versions of Kodi are available, use this command:

apt-cache policy kodi*

  

#### Installing Kodi on Debian Unstable or Testing

Installation of Kodi from Debian on Debian unstable ("sid") and testing is straightforward:

sudo apt update
sudo apt install kodi

To install Kodi binary add-ons (like **PVR IPTV Simple**, for example):

sudo apt install kodi-pvr-iptvsimple

**NOTE**: Make sure user running Kodi belongs to the following groups (for example, for user **kodi**)

$ groups kodi
kodi: cdrom,audio,render,video,plugdev,users,dialout,dip,input

This needs to be done to ensure Video Acceleration API (VA-API) is properly initialized during Kodi start-up and videos playing get acceleration using VAAPI and not VDPAU on Intel or AMD cards. To add user to groups, use the command:

usermod -a -G cdrom,audio,render,video,plugdev,users,dialout,dip,input kodi

  

#### Installing Kodi on Debian 10 "buster"

By default, Debian buster users get Kodi 17.6 "Krypton". However, it is possible to get Kodi 19.x "Matrix" from buster-backports.

  
To get Kodi 17.6 and the corresponding add-ons, use the method described in **Debian Unstable or Testing** section above.

  
To get Kodi 19.x and the corresponding add-ons from Debian Backports:

# Add Debian Backports repository for Debian 10 "buster"
if ! apt-cache policy 2>/dev/null | grep -q "http://.*buster-backports"; then
  echo "deb http://deb.debian.org/debian/ buster-backports main contrib" | sudo tee /etc/apt/sources.list.d/buster-backports.list
fi

# Update APT lists
sudo apt-get update

# Install Kodi from backports:
sudo apt-get install {kodi,kodi-bin,kodi-data,kodi-repository-kodi,libspdlog1}/buster-backports

# (OPTIONAL) Install Kodi binary add-ons (for example, 'PVR IPTV Simple'):
sudo apt-get install kodi-pvr-iptvsimple/buster-backports

  

#### Installing Kodi on Debian 9 "stretch"

By default, Debian stretch users get Kodi 17.1 "Krypton". No higher version is packaged in backports.

To get Kodi 17.1 and the corresponding add-ons, use the method described in **Debian Unstable or Testing** section above.

=================================
https://kodi.wiki/view/HOW-TO:Install_Kodi_for_Linux

### Adding Team Kodi PPA repository

Use the command line terminal in Ubuntu, and enter the following commands. Follow the prompts as you would any other software installation.

`sudo apt install software-properties-common`
`sudo add-apt-repository -y ppa:team-xbmc/ppa`
`sudo apt install kodi`

  
The Kodi repositories are as follows:

**Note:** Although the URL still has "Team XBMC" in the title, these are the current URLs for Kodi.

[https://launchpad.net/~team-xbmc/+archive/ppa]
ppa:team-xbmc/ppa Final release builds

[https://launchpad.net/~team-xbmc/+archive/unstable](https://launchpad.net/~team-xbmc/+archive/unstable)
ppa:team-xbmc/unstable [Betas and release candidates](https://kodi.wiki/view/Development_builds "Development builds")
`sudo apt install software-properties-common`
`sudo add-apt-repository -y ppa:team-xbmc/unstable`
`sudo apt install kodi`

`sudo add-apt-repository --remove ppa:team-xbmc/unstable`
`sudo apt update`

[https://launchpad.net/~team-xbmc/+archive/xbmc-nightly](https://launchpad.net/~team-xbmc/+archive/xbmc-nightly)
ppa:team-xbmc/xbmc-nightly [Nightly builds](https://kodi.wiki/view/Development_builds "Development builds")

## Удаление Kodi

Если вы хотите полностью удалить Kodi из Ubuntu, включая конфигурационные файлы и дополнения выполните эти команды:

 `sudo apt update`  
 `sudo apt remove kodi*`