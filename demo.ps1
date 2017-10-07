write-host "Build DNN Image with tags"

docker build -t jbrinkman/dnn:9.1.1 -t jbrinkman/dnn:latest .

docker run --rm -d -p 80:80 --name dnnsite jbrinkman/dnn

$ip = docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" dnnsite
start-process "http://$ip"