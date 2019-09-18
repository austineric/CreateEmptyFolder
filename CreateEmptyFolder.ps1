

####################################
# Author:      Eric Austin
# Create date: July 2019
# Description: Quickly create an empty folder on the desktop for temporary use
####################################

$FolderName=""
$Instance=1 #initialize as 1 so the end result will always be one higher the the current number of instances
$ParentDirectory=""
$NewDirectoryLocation=""

Try {
    
    $FolderName=(Get-Date).ToString("yyyy.MM.dd_")
    $ParentDirectory=Join-Path $env:USERPROFILE "\Desktop"

    Get-ChildItem -Path $ParentDirectory | ForEach-Object {
        if ($_.Name -like $FolderName + "*" ){
            $Instance=$Instance + 1
        }
    }

    #set final folder name
    $FolderName=$FolderName + $Instance.ToString()

    #set final new directory location
    $NewDirectoryLocation=Join-Path $ParentDirectory $FolderName

    #create directory and open in explorer
    New-Item -ItemType "Directory" -Path $NewDirectoryLocation | Out-Null
    explorer.exe $NewDirectoryLocation

}

Catch {

    Throw $Error[0]
    
}


