write-host "Add local content"

docker run --rm -d -p 80:80 -v ${pwd}\website:c:\inetpub\wwwroot --name iis microsoft/iis:nanoserver

$ip = docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" iis
start-process "http://$ip"