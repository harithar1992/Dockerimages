# Here is a script you can run to setup your endpoints to connect to the C4B Server.
# This includes:
#    - Installing Chocolatey
#    - Installing your chocolatey-license
#    - Running the Client Setup, which sets up Nexus repo and CCM acccess

$Repo = 'adw-choco-repo.srv.allianz'
$CCM = 'adw-choco-cm.srv.allianz'
$env:chocolateyUseWindowsCompression = 'true'
$env:chocolateyIgnoreProxy = $true

$ErrorActionPreference = "SilentlyContinue"
$downloader = New-Object -TypeName System.Net.WebClient
$downloader.Proxy = $null
Invoke-Expression ($downloader.DownloadString("http://$($CCM):80/Import-ChocoServerCertificate.ps1"))

$downloader = New-Object -TypeName System.Net.WebClient
$downloader.Proxy = $null
Invoke-Expression ($downloader.DownloadString("https://$($Repo)/repository/choco-install/ClientSetup_AZTec_Prod.ps1"))
