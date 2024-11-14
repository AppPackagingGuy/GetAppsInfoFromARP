$DysplayName = Read-Host "Please enter the application name"
$x64App = Get-ChildItem -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" -Recurse | Get-ItemProperty | Where-Object { ($_.DisplayName -Like "*$DysplayName*") -and ($_.SystemComponent -ne "1")} | Select-Object Publisher,DisplayName,DisplayVersion,InstallLocation,@{Name='GUID';Expression={$_.PSChildName}},UninstallString
$x86App = Get-ChildItem -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" -Recurse | Get-ItemProperty | Where-Object {($_.DisplayName -Like "*$DysplayName*") -and ($_.SystemComponent -ne "1")} | Select-Object Publisher,DisplayName,DisplayVersion,InstallLocation,@{Name='GUID';Expression={$_.PSChildName}},UninstallString

if($x64App){Write-Host "`nHKEY x64bit" -BackgroundColor Blue; $x64App}

if($x86App){Write-Host "`nHKEY x86bit" -BackgroundColor Blue; $x86App}

if(!$x64App -and !$x86App){Write-Host "`nNo entry has been found" -BackgroundColor Red}