# Set source and destination folder paths
$sourceFolder = ".\dev"
$destinationFolder = ".\prod"

Write-Host "Source Folder: $sourceFolder"
Write-Host "Destination Folder: $destinationFolder"

# Navigate to the source folder
Set-Location -Path $sourceFolder

# List the files in the source folder (debugging)
Write-Host "Files in source folder:"
Get-ChildItem -Path $sourceFolder

# Copy files from the source folder to the destination folder
Copy-Item -Path $sourceFolder\* -Destination $destinationFolder -Recurse

# List the files in the destination folder after copying (debugging)
Write-Host "Files in destination folder:"
Get-ChildItem -Path $destinationFolder -Recurse
