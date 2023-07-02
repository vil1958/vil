### Removing the MAX_PATH Limitation[](https://docs.python.org/3.11/using/windows.html#removing-the-max-path-limitation "Permalink to this headline")

Windows historically has limited path lengths to 260 characters. This meant that paths longer than this would not resolve and errors would result.

In the latest versions of Windows, this limitation can be expanded to approximately 32,000 characters. Your administrator will need to activate the “Enable Win32 long paths” group policy, or set `LongPathsEnabled` to `1` in the registry key `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem`.

This allows the [`open()`](https://docs.python.org/3.11/library/functions.html#open "open") function, the [`os`](https://docs.python.org/3.11/library/os.html#module-os "os: Miscellaneous operating system interfaces.") module and most other path functionality to accept and return paths longer than 260 characters.
After changing the above option, no further configuration is required.
Changed in version 3.6: Support for long paths was enabled in Python