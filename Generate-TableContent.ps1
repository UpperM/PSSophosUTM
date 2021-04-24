Write-Output $PSScriptRoot

$RootFolder = "$PSScriptRoot\PSSophosUTM"

$Folders = Get-ChildItem -Path "$RootFolder\Public"

foreach ($Folder in $Folders)
{
    $Title              = "# $Folder `n"
    Write-Output "  * [$Folder](Documentation/$Folder.md)"

}
