$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'ISO_EMBEDDED_IN_PACKAGE'
$url = "https://wiki.he-it.eu/public-uploads/Win11_25H2_German_x64.iso"; #Using MS URL failed of session token, only valid for 24h

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  file          = "setup.exe"
  fileType      = 'exe'
  url           = $url
  isofile       = $fileLocation

  softwareName  = 'Win11Upgrade*'

  checksum      = ''
  checksumType  = 'sha256'

  silentArgs   = '/Auto Upgrade /quiet /eula accept /telemetry disable /diagnosticprompt enable /compat ignorewarning'
  validExitCodes= @(0, 3)
}

Install-ChocolateyIsoPackage @packageArgs

















