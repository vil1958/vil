[#### Python 3.11.4](https://www.python.org/downloads/release/python-3114/)


[### Installing Without UI](https://docs.python.org/3.11/using/windows.html#installation-steps:~:text=enabled%20in%20Python.-,4.1.3.%20Installing%20Without%20UI,-%C2%B6)

[Мой вариант:](http://wp.kraeftigerkaese.net/pub/python-v3-unattended-silent-install-w-xml/)
`python-3.11.4-amd64 /quiet unattend.xml`
[unattend.xml:[[unattend.xml]]




```
<Options>
  <Option Name="InstallAllUsers" Value="yes" />
  <Option Name="TargetDir" Value="D:\Python" />
  <Option Name="DefaultJustForMeTargetDir" Value="D:\Python" />
  <Option Name="DefaultCustomTargetDir" Value="D:\Python" />
  <Option Name="AssociateFiles" Value="yes" />
  <Option Name="AppendPath" Value="yes" />
  <Option Name="CompileAll" Value="yes" />
  <Option Name="PrependPath" Value="yes" />
  <Option Name="Shortcuts" Value="yes" />
  <Option Name="Include_doc" Value="yes" />
  <Option Name="Include_debug" Value="no" />
  <Option Name="Include_dev" Value="yes" />
  <Option Name="Include_exe" Value="yes" />
  <Option Name="Include_launcher" Value="yes" />
  <Option Name="InstallLauncherAllUsers" Value="yes" />
  <Option Name="Include_lib" Value="yes" />
  <Option Name="Include_pip" Value="yes" />
  <Option Name="Include_symbols" Value="no" />
  <Option Name="Include_tcltk" Value="yes" />
  <Option Name="Include_test" Value="yes" />
  <Option Name="Include_tools" Value="yes" />
  <Option Name="SimpleInstall" Value="yes" />
  <Option Name="SimpleInstallDescription">Automatic Install</Option>
  </Options>
```

All of the options available in the installer UI can also be specified from the command line, allowing scripted installers to replicate an installation on many machines without user interaction. These options may also be set without suppressing the UI in order to change some of the defaults.

To completely hide the installer UI and install Python silently, pass the `/quiet` option. To skip past the user interaction but still display progress and errors, pass the `/passive` option. The `/uninstall` option may be passed to immediately begin removing Python - no confirmation prompt will be displayed.

All other options are passed as `name=value`, where the value is usually `0` to disable a feature, `1` to enable a feature, or a path. The full list of available options is shown below.


For example, to silently install a default, system-wide Python installation, you could use the following command (from an elevated command prompt):

`python-3.11.4.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0`

To allow users to easily install a personal copy of Python without the test suite, you could provide a shortcut with the following command. This will display a simplified initial page and disallow customization:
```
python-3.11.4.exe InstallAllUsers=0 Include_launcher=0 Include_test=0
    SimpleInstall=1 SimpleInstallDescription="Just for me, no test suite."
```


(Note that omitting the launcher also omits file associations, and is only recommended for per-user installs when there is also a system-wide installation that included the launcher.)

The options listed above can also be provided in a file named `unattend.xml` alongside the executable. This file specifies a list of options and values. When a value is provided as an attribute, it will be converted to a number if possible. Values provided as element text are always left as strings. This example file sets the same options as the previous example:

<Options>
    <Option Name="InstallAllUsers" Value="no" />
    <Option Name="Include_launcher" Value="0" />
    <Option Name="Include_test" Value="no" />
    <Option Name="SimpleInstall" Value="yes" />
    <Option Name="SimpleInstallDescription">Just for me, no test suite</Option>
</Options>
