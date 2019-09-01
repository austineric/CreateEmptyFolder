

####################################
# Author:      Eric Austin
# Create date: July 2019
# Description: Quickly create a randomly-named empty folder on the desktop for temporary use
####################################

Try {
    
    #set directory name as a datetime
    $ParentDirectory=Join-Path $env:USERPROFILE "\Desktop"
    $NewDirectoryLocation=Join-Path $ParentDirectory (Get-Date).ToString("yyyy.MM.ddTHH.mm.ss")

    #create directory and open in explorer
    New-Item -ItemType "Directory" -Path $NewDirectoryLocation | Out-Null
    explorer.exe $NewDirectoryLocation

}

Catch {

    Throw $Error[0]
    
}


