write-host "Using docker-compose with dockerfile"

docker-compose up -d

# Note: This nodename and network name may change for your particular machine
$ip = docker inspect -f "{{ .NetworkSettings.Networks.goodbyevmhellodocker_webnet.IPAddress }}" goodbyevmhellodocker_web_1

start-process "http://$ip"