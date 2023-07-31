# Set source and destination folder paths
$sourceFolder = "path/to/source/folder"
$destinationFolder = "path/to/destination/folder"

# Copy files from the source folder to the destination folder
Copy-Item -Path $sourceFolder\* -Destination $destinationFolder -Recurse
