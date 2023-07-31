# PowerShell script to copy files from the "dev" folder to the "prod" folder
$sourcePath = ".\dev"
$destinationPath = ".\prod"

# Create the destination folder if it doesn't exist
if (-Not (Test-Path -Path $destinationPath -PathType Container)) {
    New-Item -Path $destinationPath -ItemType Directory | Out-Null
}

# Get a list of files in the source folder
$files = Get-ChildItem -Path $sourcePath -File

foreach ($file in $files) {
    $destinationFilePath = Join-Path -Path $destinationPath -ChildPath $file.Name
    Copy-Item -Path $file.FullName -Destination $destinationFilePath -Force
}
