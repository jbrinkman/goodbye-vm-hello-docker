FROM microsoft/iis:nanoserver
ARG site_root=./website
ADD ${site_root} /inetpub/wwwroot