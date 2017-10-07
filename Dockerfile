FROM microsoft/aspnet

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]


# DNN Default Download Link
ARG dnn_install_url=http://bit.ly/dnn911-install
ENV dnn_url ${dnn_install_url}

RUN New-Item c:\website -Type Directory

RUN Remove-WebSite -Name 'Default Web Site'

RUN New-Website \
    -Name 'mysite' \
    -Port 80 \  
    -PhysicalPath c:\website \
    -ApplicationPool 'DefaultAppPool'

RUN Invoke-WebRequest -Method Get -Uri $env:dnn_url -OutFile c:\DNN.zip
RUN Expand-Archive -Path c:\DNN.zip -DestinationPath c:\website ; \
	Remove-Item c:\DNN.zip -Force

RUN icacls C:\website /grant Everyone:F /t /q