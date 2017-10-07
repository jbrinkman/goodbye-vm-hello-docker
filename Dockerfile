FROM microsoft/aspnet

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN New-Item c:\website -Type Directory

RUN Remove-WebSite -Name 'Default Web Site'

RUN New-Website \
    -Name 'mysite' \
    -Port 80 \  
    -PhysicalPath c:\website \
    -ApplicationPool 'DefaultAppPool'