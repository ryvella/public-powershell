# Description:
# If you are using Google Photos or specifically Google Takeout, when you export all your photos,
# you will run into a lot of duplicate photos which Google Photos will edit for you and create a new
# copy of your file with '-edited' afterward.
#
# This script will take a path of your images and a pattern.
# It will loop through all the files having the pattern and
# check that the same files without the '-edited' part exist.
# If this condition is met, the file will be removed.


$targetFolder = "C:\Path\To\Your\Images"
$editedPattern = "*-edited.jpg" # This matches files ending with "-edited.jpg"

$editedFiles = Get-ChildItem -Path $targetFolder -Filter $editedPattern

foreach ($editedFile in $editedFiles) {
    $nonEditedFileName = $editedFile.Name -replace "-edited", ""

    $nonEditedFile = Join-Path -Path $targetFolder -ChildPath $nonEditedFileName
    if (Test-Path $nonEditedFile) {
        Remove-Item $editedFile.FullName -Force
        Write-Output "Deleted edited file: $($editedFile.FullName)"
    }
}

Write-Output "Cleanup complete."
