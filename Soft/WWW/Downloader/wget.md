[wget via proxy](https://stackoverflow.com/questions/11211705/how-to-set-proxy-for-wget)
#wget #proxy #curl #downloader
For all users of the system via the `/etc/wgetrc` or for the user only with the `~/.wgetrc` file:

```
use_proxy=yes
http_proxy=127.0.0.1:8080
https_proxy=127.0.0.1:8080
```
or via `-e` options placed after the URL:
```
wget ... -e use_proxy=yes -e http_proxy=127.0.0.1:8080 ...
```
Example:
```
wget.exe -O TCIMG.zip -e http_proxy=127.0.0.1:12346 --tries=10 "htttp://wincmd.ru/download.php?id=TCIMG" 
```

#### [Using Wget with a Proxy](https://brightdata.com/blog/how-tos/wget-proxy)

[GNU Wget](https://www.gnu.org/software/wget/) is a versatile command line utility that has become indispensable for many Linux users who rely on it for effortlessly fetching files from the internet. It is feature-rich, is easy to use, and supports common network protocols, including HTTP, HTTPS, and FTP. In addition, Wget has built-in support to download entire websites or subsets of pages, making it an ideal tool for web scraping, mirroring, and archiving.

One of Wget’s most impressive features is its ability to work seamlessly with proxies. As a Linux user, you’ll often find yourself needing a proxy to mask your identity, bypass pesky regional restrictions, or enhance performance through load balancing. With Wget in your toolkit, integrating proxies is easy.

## What Is Wget?

Wget, short for “World Wide Web” and “get”, is a free and open source program for interacting with files on the internet. It’s part of the [GNU Project](https://en.wikipedia.org/wiki/GNU_Project), a free software mass collaboration effort.

Wget comes equipped with handy features for technical users working with files online. These include batch downloads, resuming of interrupted downloads, recursive downloading, proxy support, download scheduling, bandwidth throttling, customizable user agent, and SSL/TLS support. It’s also non-interactive, making it perfect for scripts and cron jobs that run in the background.

Wget is popular among Linux and Unix users and also has versions available for Windows and macOS. Wget’s impressive range of features and cross-platform compatibility makes it the go-to tool for various web-based tasks, such as downloading large files, automating downloads, and creating website mirrors.

## Using Proxies with Wget in Linux

A wide variety of proxies exist, including datacenter and residential proxies, each with its own advantages and use cases. Using proxies with Wget offers benefits, such as bypassing geo and network/ISP restrictions. It also allows you to maintain anonymity and privacy while browsing the web or downloading files.

When using the right proxy provider, proxies can also be used to cache frequently accessed resources, boosting performance. In addition, proxy providers can influence your network speeds, help you bypass rate limits by providing a wide pool of IP addresses, and even provide solutions that help you bypass captchas. This makes [selecting the right proxy provider](https://brightdata.com/blog/proxy-101/what-to-look-for-when-choosing-a-proxy-provider) essential to ensuring that your proxy performs effectively, especially when using it with Wget.

### Configuring Wget with a Proxy

To use Wget with a proxy, you need to configure the appropriate settings in your environment or within the Wget command itself. There are several different ways of doing this, and this tutorial will cover four of them: configuring proxy settings using environmental variables, setting proxies for all users by updating the `/etc/wgetrc` file, setting proxies for the current user by updating the `~/.wgetrc` file, and setting the proxy for the current terminal instance using the `-e` flag. You’ll also learn how to use Wget with both authenticated and unauthenticated proxies.

You can find all the configurations discussed in this article in [this GitHub gist](https://gist.github.com/mikeyny/824fadf9a26245caa2f4cc329ed63afa).

Before you start using Wget with a proxy, you need the following:

- **Linux environment:** This guide is crafted for a Linux system, which can be Ubuntu, Fedora, Debian, or any other Linux distribution. Make sure you have Linux installed on your machine or a virtual environment.
- **Wget:** Wget comes preinstalled on most Linux systems. To check if it’s installed, open the terminal and type `wget --version`. If Wget is installed, the command returns its version number. If it’s not installed, you can install Wget using your distribution’s package manager, such as `apt` for [Debian-based systems](https://www.tecmint.com/install-wget-in-linux/#wgetdeb) or [`yum` for Fedora](https://www.tecmint.com/install-wget-in-linux/#wgetcentos).
- **Proxy server details:** To use Wget with a proxy, you need the proxy server’s details. This includes the server’s IP address or hostname, port number, and if required, authentication information (_ie_ username and password). You can obtain this information from your proxy provider or network administrator.

#### 1. Configure Proxy Settings Using Environment Variables

The easiest way to set proxy configurations for Wget is by defining them at a system level using environment variables. This allows multiple programs to read the value and use it, so you only need to change it once. Setting the proxy as an environmental variable ensures that Wget uses it for all requests made from your computer.

To set up a proxy for Wget, add the following lines to your shell configuration file (_ie_ `.bashrc` or `.bash_profile`) and replace the placeholders with your proxy server’s address and port (_ie_ `http://proxy.example.com:8080`):

```
export http_proxy=http://proxy_address:proxy_port
export https_proxy=https://proxy_address:proxy_port
```

If the proxy requires authentication, instead of `http://proxy_address:proxy_port`, you should also add the username and password in the URL so that it looks like this:

```
export http_proxy=http://username:password@proxy_address:proxy_port
export https_proxy=username:password@proxy_address:proxy_port
export ftp_proxy=username:password@proxy_address:proxy_port

```

> Remember to replace the variables for `username`, `password`, `proxy_address`, and `proxy_port` with the appropriate values (_ie_ `http_proxy=http://username:password@proxy.example.com:8080`).

After adding these lines, restart your shell or run `source .bashrc` or `source .bash_profile`, depending on which file you used to apply the changes.

#### 2. Set Proxies for All Users by Updating the /etc/wgetrc File

If you need to set a proxy for the entire system. For example, if you want to use a proxy only when downloading files with Wget to protect your identity, Wget provides an easy way to do this, and it can be done either for an individual system user or for all system users.

Setting the proxy for all system users is helpful in cases where there’s a shared company machine with different users relying on the same proxy to carry out the work. Wget allows you to configure the proxy once so that all users can access it.

To set a proxy for all users, you need to modify the config file located in `/etc/wgetrc`. The `wgetrc` file is an initialization file that stores default settings and options for Wget. This file allows you to customize its behavior without always specifying command line arguments.

To set the proxy, open the `wgetrc` file using your favorite text editor and add the following lines:

```
https_proxy = http://proxy.example.com:8080
http_proxy = http://proxy.example.com:8080
ftp_proxy = http://proxy.example.com:8080
```

For authenticated proxies, use the following syntax:

```
https_proxy = http://username:password@proxy.example.com:8080
http_proxy = http://username:password@proxy.example.com:8080
ftp_proxy = http://username:password@proxy.example.com:8080
```

Replace `proxy.example.com:8080` and `username:password` with the address, port, and authorization credentials of your proxy server. Save the file and close the editor. From now on, all Wget requests made by any user on your system will use the specified proxy server.

#### 3. Set Proxies for the Current User by Updating the ~/.wgetrc File

Wget also allows you to change the proxy configurations for just the current user. This can be helpful if you’re in a situation where the proxy details need authentication information specific to each user.

To set the proxy, you need to create/modify the `~/.wgetrc` file. This is a user-specific `wgetrc` file located in your home directory (`~/`). It stores configurations that are only affected by the current user. The `~/.wgetrc` file may not exist by default, especially on new Linux installations or user accounts because the file is typically created when a user needs to customize Wget settings specific to their account. If the file doesn’t exist, you can create it.

Once you have the `~/.wgetrc` file, open it in your favorite text editor and add the following lines:

```
https_proxy = http://proxy.example.com:8080
http_proxy = http://proxy.example.com:8080
ftp_proxy = http://proxy.example.com:8080
```

Again, remember to replace `proxy.example.com:8080` with your specific details. This method only affects Wget requests made by the current user. If you switch to a different user on the same machine, these settings do not apply.

#### 4. Set Proxy for the Current Terminal Instance Using the -e Flag

If you don’t want to set the proxy at a system or Wget level, you can configure it directly when running the Wget command. This method allows you to use different proxy settings for individual Wget commands, giving you greater flexibility.

To specify the proxy configuration for a single Wget request, use the following syntax:

```
# http proxy
wget -e use_proxy=yes -e http_proxy=http://proxy_address:proxy_port URL
# https proxy
wget -e use_proxy=yes -e https_proxy=http://proxy_address:proxy_port URL
```

In this code, `URL` is the URL you want Wget to fetch (_eg_ `www.google.com`).

For authenticated proxies, you can use the `http://username:password@proxy_address:proxy_port` syntax for specifying the proxy, as discussed in the previous section.

This method allows you to set a proxy for a single request without affecting other requests, terminal sessions, or users.

## Using Wget

Thankfully, using Wget is simple. The general syntax for Wget is `wget [options] [url]`, where you first specify optional arguments (_ie_ `[options]`), such as the `-e use_proxy=yes` that you learned about earlier, followed by the `[url]` that you want to fetch. This could be a media file, such as a document or even a web page.

Because the first part is optional, you can fetch a web resource by specifying `wget [url]`. For instance, calling `wget http://example.com/file.pdf` fetches the file and downloads it to your local machine.

You can also download a file while specifying the name to use when saving it to disk. To do this, use the `--output-document` argument:

```
 wget --output-document=image.jpg https://httpbin.org/image/jpeg
```

Wget also allows you to batch your downloads and download from multiple URLs in one command. To do this, you need to create a file and paste your URLs, each on its own line. After doing this, you can run the following command:

```
wget ‐‐input list-of-file-urls.txt
```

> **Please note:** If you’re using method 4 for specifying your proxy, you must append `-e use_proxy=yes -e http_proxy=http://proxy_address:proxy_port` to the previous commands to get them to work with a proxy. Options 1, 2, and 3 will work as is since the proxy is configured already.