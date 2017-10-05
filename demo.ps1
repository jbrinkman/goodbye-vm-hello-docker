write-host "Running the multi-docker example"

docker run -it --rm -d --name amazon microsoft/powershell:amazonlinux powershell
docker run -it --rm -d --name unknown microsoft/powershell powershell