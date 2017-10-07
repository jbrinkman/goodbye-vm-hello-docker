write-host "Add local content for real"

docker build -t jbrinkman/simple-site .

docker run --rm -d -p 80:80 -v ${pwd}\website:c:\webiste --name mysite jbrinkman/simple-site

$ip = docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" mysite
start-process "http://$ip"