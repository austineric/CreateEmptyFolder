
Do {
    [string]$RandomText=(New-Guid)
    $RandomText=$RandomText.Substring(0,7)
    $ParentDirectory=Join-Path $env:USERPROFILE "\Desktop"
    $NewDirectoryLocation=Join-Path $ParentDirectory $RandomText
    Write-Host $NewDirectoryLocation
} Until ((Test-Path -Path $NewDirectoryLocation) -eq $false )

New-Item -ItemType "Directory" -Path $NewDirectoryLocation | Out-Null
explorer.exe $NewDirectoryLocation

