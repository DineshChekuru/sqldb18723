# Set source and destination folder paths
$sourceFolder = ".\dev"
$destinationFolder = ".\prod"

# Copy files from the source folder to the destination folder
Copy-Item -Path $sourceFolder\* -Destination $destinationFolder -Recurse
