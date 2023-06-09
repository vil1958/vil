REM KeePassXC 2.7.3

REM https://keepassxc.org/download/
REM https://keepassxc.org/download/#windows
REM choco install keepassxc
REM https://github.com/keepassxreboot/keepassxc/releases/download/2.7.3/KeePassXC-2.7.3-Win64.msi
REM https://github.com/keepassxreboot/keepassxc/releases/download/2.7.3/KeePassXC-2.7.3-Win32.msi
REM https://github.com/keepassxreboot/keepassxc/releases/download/2.7.3/KeePassXC-2.7.3-Win64.zip
REM https://github.com/keepassxreboot/keepassxc/releases/download/2.7.3/KeePassXC-2.7.3-Win32.zip
REM https://github.com/chocolatey/chocolatey-coreteampackages/tree/master/automatic/keepassxc
REM https://github.com/microsoft/winget-pkgs/tree/master/manifests/k/KeePassXCTeam/KeePassXC

SET VER=2.7.3
SET PRGI=KeePassXC
SET PRGO=KeePassXC
SET PTH=https://github.com/keepassxreboot/keepassxc/releases/download/%VER%
SET REF=https://keepassxc.org/download/#windows

wget.exe -O "%PRGO%_%VER%_x64.msi" "%PTH%/%PRGI%-%VER%-Win64.msi" --referer="%REF%" --content-disposition
wget.exe -O "%PRGO%_%VER%_x64_P.zip" "%PTH%/%PRGI%-%VER%-Win64.zip" --referer="%REF%" --content-disposition

REM wget.exe -O "%PRGO%_%VER%_x32.msi" "%PTH%/%PRGI%-%VER%-Win32.msi" --referer="%REF%" --content-disposition
REM wget.exe -O "%PRGO%_%VER%_x32_P.zip" "%PTH%/%PRGI%-%VER%-Win32.zip" --referer="%REF%" --content-disposition


