[Network Configurations](https://docs.activestate.com/platform/state/troubleshooting/network-config/)

мои проекты:
https://platform.activestate.com/vil1958

Запуск среды через Тотал коммандер:
```
%comspec%
/K "CD /D %P && state activate vil1958/perl"
d:\develop\ActiveState\perl\application-x-perl-2.ico
```

To configure the State Tool to use a proxy server set the following environment variables:
у меня получилось так:
```
SET HTTP_PROXY=127.0.0.1:12346
SET HTTPS_PROXY=127.0.0.1:12346
```

### HTTP_PROXY
`set HTTP_PROXY=http://<proxy address>:<network port>`
`set HTTP_PROXY=http://127.0.0.1:12346`

If your proxy needs login credentials:
`set HTTP_PROXY=http//<proxy user>:<proxy password>@<proxy address>:<network port>`

### HTTPS_PROXY
`set HTTPS_PROXY=https://<proxy address>:<network port>`
`set HTTPS_PROXY=https://127.0.0.1:12346`

If your proxy needs login credentials:
`set HTTPS_PROXY=https://<proxy user>:<proxy password>@<proxy address>:<network port>`

`state auth --prompt --verbose`
`vil1958@gmail.com`
`sergcs1958`

`state activate --default vil1958/perl`

```
Your project has been added to the environment of user HOME-PC\vil.  The project may be inaccessible when run with
Administrator privileges or authenticated as a different user
```

Update all:
`state pull`

```
 Pulling Remote Project

Operating on project vil1958/perl, located at d:\develop\ActiveState\perl.

Your activestate.yaml is already up to date!

[vil1958/perl] d:\develop\ActiveState\perl>perl --version

This is perl 5, version 36, subversion 0 (v5.36.0) built for MSWin32-x64-multi-thread

Copyright 1987-2022, Larry Wall

Binary build 36.0r4 provided by ActiveState http://www.ActiveState.com
Built Fri May 19 19:17:24 2023

Perl may be copied only under the terms of either the Artistic License or the
GNU General Public License, which may be found in the Perl 5 source kit.

Complete documentation for Perl, including FAQ lists, should be found on
this system using "man perl" or "perldoc perl".  If you have access to the
Internet, point your browser at https://www.perl.org/, the Perl Home Page
```

#### Set virtual environment as global default:
`state activate --default`

[State Tool Cheat Sheet](https://platform.activestate.com/state-tool-cheat-sheet)

## Package Management

Packages are all built on-demand from source on the Platform and downloaded automatically.
#### Install a package
`state install DateTime`
DateTime is a Perl package available on the Platform. You can replace it with another package name to add other packages to your project.

#### Remove a package
`state uninstall DateTime`
Change DateTime to remove any package that has been added to your project.

#### Install multiple packages
`state import path/to/file`
Import multiple packages using one of the supported file formats

#### Search for a package
`state search date`
This will search our Platform catalogue for packages that match the date search term.

## Change Management
You can make changes to your local environment, like adding and removing packages, without affecting the remote project on the Platform and only push them when you're ready.

#### Push your local changes
`state push`
Update the remote project on the Platform with your local changes.

#### Pull in remote changes
`state pull`
Bring in the latest changes from the remote project on the Platform.

## Project Virtual Environments
Your ActiveState runtime runs in a virtual environment so it's isolated from the rest of your system.

#### Activate by project name
`state activate ActiveState/Perl-5.32`
`state activate vil1958/perl`
Replace ActiveState/Perl-5.32 with the owner and project name you want to activate.

#### Set virtual environment as global default
`state activate --default`
Makes the current runtime usable from anywhere on the system without activating it first.

## Running Commands
You can write your own custom scripts and commands and share them as part of your runtime. Learn more about running scripts [here](https://docs.activestate.com/platform/state/config/#scripts).

#### Run a script defined in your activestate.yaml file
`state run hello "world!"`
This runs the hello script, which accepts "world!" as an argument.

## Authenticating
Create an account and sign in to save your runtime details.

#### Authenticate
`state auth`

#### Get help about the State Tool
`state --help`

#### Get help about a specific command
`state activate --help`
This shows help for the activate command. You can swap it with any of the other State Tool commands.

#### Update the State Tool
`state update`



