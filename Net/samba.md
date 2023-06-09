https://learn.microsoft.com/ru-ru/windows-server/storage/file-server/troubleshoot/detect-enable-and-disable-smbv1-v2-v3?tabs=server

Обнаружить:
`Get-SmbServerConfiguration | Select EnableSMB2Protocol`

Отключите:
'Set-SmbServerConfiguration -EnableSMB2Protocol $false'

Включите параметр:
`Set-SmbServerConfiguration -EnableSMB2Protocol $true`

