ассоциировать:
#assoc #ftype
`"C:\Program Files\AIMP\AIMP.exe"``
`ftype`
`assoc`
*.mp3,*.ogg,*.flac,*.fla,*.au,*.ac3,*.ape,*.aac,*.wma,*.wav,*.m4a

`ftype | grep AIMP`
`assoc | grep .mp3`
`assoc .mp3=AIMP.AssocFile.MP3`

`AIMP.AssocFile.MP3="C:\Program Files\AIMP\AIMP.exe" "%1"`