write-host "Mount a volume"

docker run -it --rm -v ${pwd}:c:\data  microsoft/powershell:nanoserver powershell