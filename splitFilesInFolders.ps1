# This is a script I used to split a folder containing alot of files
# into multiple folders, with each folder containing 4000 files.
# The limit can be adjusted as needed. This particular script was used
# to upload in bulk however the limit was 4000 files. The variables
# are setup using names for photos as that's what i used it for. 


# Set the path to your image folder
$sourceFolderPath = "SOURCEPATH"

# Set the destination folder where the subfolders will be created
$destinationFolderPath = "DESTINATIONPATH"

if (-not (Test-Path -Path $destinationFolderPath -PathType Container)) {
    New-Item -Path $destinationFolderPath -ItemType Directory
}

$imageFiles = Get-ChildItem -Path $sourceFolderPath -File
$fileCounter = 0

$subfolderCounter = 1

foreach ($imageFile in $imageFiles) {
    if ($fileCounter -ge 4000) {
        $subfolderCounter++
        $fileCounter = 0
    }

    $subfolderPath = Join-Path -Path $destinationFolderPath -ChildPath "Subfolder$subfolderCounter"

    if (-not (Test-Path -Path $subfolderPath -PathType Container)) {
        New-Item -Path $subfolderPath -ItemType Directory
    }
    Move-Item -Path $imageFile.FullName -Destination $subfolderPath
    $fileCounter++
}

Write-Host "Image files have been successfully split into subfolders."
