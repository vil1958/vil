[wget via proxy](https://stackoverflow.com/questions/11211705/how-to-set-proxy-for-wget)
#wget #curl #downloader
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

# Using Wget with a Proxy