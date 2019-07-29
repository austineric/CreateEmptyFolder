

####################################
# Author:      Eric Austin
# Create date: July 2019
# Description: Quickly create a randomly-named empty folder on the desktop for temporary use
####################################

Try {
    
    #add the first eight characters of a GUID to the user's desktop path
    Do {
        [string]$RandomText=(New-Guid)
        $RandomText=$RandomText.Substring(0,7)
        $ParentDirectory=Join-Path $env:USERPROFILE "\Desktop"
        $NewDirectoryLocation=Join-Path $ParentDirectory $RandomText
        Write-Host $NewDirectoryLocation
    } Until ((Test-Path -Path $NewDirectoryLocation) -eq $false )

    #create directory and open in explorer
    New-Item -ItemType "Directory" -Path $NewDirectoryLocation | Out-Null
    explorer.exe $NewDirectoryLocation

}

Catch {

    Throw $Error[0]
    
}


