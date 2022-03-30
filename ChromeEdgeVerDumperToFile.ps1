﻿
#Set file path for storage --- Make sure to change path name and to make a folder named VersionDump 
$catsarecuteandstoreourversioninfoChrome = 'C:\Users\NAME\Desktop\VersionDump\ChromeVersion.txt'
$catsarecuteandstoreourversioninfoEdge = 'C:\Users\NAME\Desktop\VersionDump\EdgeVersion.txt'

#Get Host
$hostname = Get-Content env:computername


#Get Edge Version
$EdgePath = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$EV = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($EdgePath).ProductVersion
Write-Output "Microsoft Edge version: "  $EV



#Get Chrome Version



$ChromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$CV = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($ChromePath).ProductVersion
Write-Output "Google Chrome version: " $CV



$stuffToWriteToFile = "$hostname,$ChromePath, $CV"

$stuffToWriteToFile  | Out-File -Encoding unicode -Append $catsarecuteandstoreourversioninfoChrome
$stuffToWriteToFile  | Out-File -Encoding unicode -Append '´n'

$moarStuffToWriteToFile = "$hostname, $EdgePath, $EV"
$moarStuffToWriteToFile  | Out-File -Encoding unicode -Append $catsarecuteandstoreourversioninfoEdge
$moarStuffToWriteToFile  | Out-File -Encoding unicode -Append '´n'



