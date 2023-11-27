FROM mcr.microsoft.com/windows/servercore:ltsc2019
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
WORKDIR Dockerimages/.
RUN powershell.exe -File "Chocolatey_Downloader.ps1ChocoRegisterscript.ps1"
RUN choco install -y \ git \ Chocolatey GUI \ ConfigMgr 2012 Toolkit R2 \ CrowdStrike Windows Sensor \ Poweshell 7 -x64 
