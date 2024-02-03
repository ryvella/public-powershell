# Script to change the extensions of .HEIC files to .jpg in a specified folder

$folderPath = "C:\Path\To\Your\Folder"
$heicFiles = Get-ChildItem -Path $folderPath -Filter *.heic

foreach ($file in $heicFiles) {
    $newFileName = [System.IO.Path]::ChangeExtension($file.FullName, ".jpg")
    Rename-Item -Path $file.FullName -NewName $newFileName
}

Write-Host "Conversion completed successfully!"
