
[chocolatey](https://chocolatey.org/)

https://chocolatey.org/install

https://github.com/chocolatey/ChocolateyGUI/releases/tag/1.1.2

With PowerShell, you must ensure [Get-ExecutionPolicy](https://go.microsoft.com/fwlink/?LinkID=135170) is not Restricted. We suggest using `Bypass` to bypass the policy to get things installed or `AllSigned` for quite a bit more security.

Run 
`Get-ExecutionPolicy`
If it returns `Restricted`, then run
`Set-ExecutionPolicy AllSigned`
 or
`Set-ExecutionPolicy Bypass -Scope Process`

Now run the following command:
```Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))```

The packages themselves go to `C:\ProgramData\chocolatey\lib`
  (i.e. `C:\ProgramData\chocolatey\lib\yourPackageName`).
A shim file for the command line goes to `C:\ProgramData\chocolatey\bin`
  and points to an executable in `C:\ProgramData\chocolatey\lib\yourPackageName`

https://docs.chocolatey.org/en-us/features/integrations

`choco install whatsapp`

`chocolatey uninstall whatsapp'
`chocolatey uninstall whatsapp -n`



[#### Uninstalling Chocolatey](https://community.chocolatey.org/courses/installation/uninstalling)
Should you decide you don't like Chocolatey, you can uninstall it simply by removing the folder (and the environment variable(s) that it creates). Since it is not actually installed on your system, you don't have to worry that it cluttered up your registry (the applications that you installed with Chocolatey or manually, now that's a different story).

#### Folder

-  `C:\Chocolatey` - for Chocolatey version < `0.9.8.27`
-  `C:\ProgramData\chocolatey` > `0.9.8.27`

**NOTE:** If you upgraded from `0.9.8.26` to `0.9.8.27` it is likely that `Chocolatey` is installed at C:\Chocolatey, which was the default prior to `0.9.8.27`. If you did a fresh install of Chocolatey at version `0.9.8.27` then the installation folder will be `C:\ProgramData\Chocolatey`

#### Environment Variables

-   ChocolateyInstall
-   ChocolateyBinRoot
-   ChocolateyToolsLocation
-   PATH (will need updated to remove)

