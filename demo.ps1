write-host "Run IIS with port mapping"

docker run --rm -d -p 80:80 --name iis microsoft/iis:nanoserver

$ip = docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" iis
start-process "http://$ip"