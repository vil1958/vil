[clean_temp.ps1](https://gist.github.com/wincmd64/54cf6764bf4d00513138922b47767a08)
```
# Рекурсивно удаляет файлы старше Х дней в заданной директории (минуя Корзину)
# Использование: powershell -ExecutionPolicy Bypass -File "clean_temp.ps1"
# Кодировка этого файла должна быть UTF-8 с BOM
# https://t.me/wincmd64

# Кол-во дней
$days = 30
# Путь, например, 'D:\test'
$path = $env:Temp

# SysInfo
$CompObject =  Get-WmiObject -Class WIN32_OperatingSystem
$host.UI.RawUI.WindowTitle = "PowerShell v" + $PSversiontable.psversion + "     Free RAM: " + [math]::Round(($CompObject.FreePhysicalMemory/1MB),3) + " of " + [math]::Round(($CompObject.TotalVisibleMemorySize/1MB),3) + "     Processes: " + (Get-Process).Count

# Version check
if ($PSversiontable.psversion -lt "5.1") {
    Write-Host "POWERSHELL UPDATE NEEDED -- https://microsoft.com/download/details.aspx?id=54616"
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    exit
}

Clear-Host
Write-Host "Path: " -NoNewline
Write-Host $path -BackgroundColor Black
Write-Host "Days: " -NoNewline
Write-Host $days -BackgroundColor Black

function Get-Number {
    Write-Progress -Activity "Calculating..."
    $script:F = Get-ChildItem -Recurse -Force –path $path -File -ErrorAction SilentlyContinue | ? {($_.LastWriteTime -lt (Get-Date).AddDays(-$days))} | Measure-Object | %{$_.Count}
    $Mb = Get-ChildItem -Recurse -Force –path $path -File -ErrorAction SilentlyContinue | ? {($_.LastWriteTime -lt (Get-Date).AddDays(-$days))} | Measure-Object -property length -sum
    $script:Mb = [math]::Round(($Mb.sum/1MB),2)
    Write-Progress -Activity "Calculating..." -Completed
}

function Print-Number {
    Write-Host `n"Remaining files: " -NoNewline
    if ($F -eq 0) {
        Write-Host $F -BackgroundColor Black
    } else {
        Write-Host $F -BackgroundColor Black -NoNewline
        Write-Host "  ["$Mb "MB ]" -ForegroundColor Gray
    }
    Write-Host ""
}

Get-Number

if ($F -eq 0) {
    Write-Host `n"NOTHING FOUND." -ForegroundColor Green
    pause
    exit
}

Print-Number

Write-Host "DELETE?" -ForegroundColor Red
pause

Write-Progress -Activity "Deleting..."
Get-ChildItem -Recurse -Force –path $path -File -ErrorAction SilentlyContinue | ? {($_.LastWriteTime -lt (Get-Date).AddDays(-$days))} | ForEach-Object{
    Try{
        Remove-Item -Force -ErrorAction Stop –LiteralPath $_.FullName
    } Catch {
        Write-Host "> $_" -ForegroundColor Gray
    }
}
Write-Progress -Activity "Deleting..." -Completed

Get-Number
Print-Number

Write-Host "DONE." -ForegroundColor Green
pause
exit
```

[choco.ps1](https://gist.github.com/wincmd64/aa680b1ece5e049b37ddae001e12df5e)
```
# Авто-установка chocolatey и софта
# Использование: powershell -ExecutionPolicy Bypass -File "choco.ps1"
# https://t.me/wincmd64

# ps ver check
if ($PSversiontable.psversion -lt "5.1") {
    Write-Host "POWERSHELL UPDATE NEEDED -- https://microsoft.com/download/details.aspx?id=54616"
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    exit
}

# choco check
if(-not(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "INSTALL CHOCO?" -ForegroundColor Red
    pause
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
} else {
    choco list --localonly
}

Write-Host "INSTALL SOFT?" -ForegroundColor Red
pause

choco install 7zip -y

if ([System.Environment]::OSVersion.Version.ToString(2) -eq "10.0") {
    # win 10+
    choco install vcredist140 -y
} elseif ([System.Environment]::OSVersion.Version.ToString(2) -eq "6.1") {
    # win 7
    choco install firefoxesr -y
}
```

