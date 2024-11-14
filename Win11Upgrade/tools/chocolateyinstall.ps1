
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = '\\Zuhause.local\data\GPO\Programme\Win11\setup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64
  file         = $fileLocation

  softwareName  = 'Win11Upgrade*'

  checksum      = ''
  checksumType  = 'sha256'
  checksum64    = ''
  checksumType64= 'sha256'

  silentArgs   = '/Auto Upgrade /quiet /eula accept /telemetry disable /diagnosticprompt enable /compat ignorewarning'
  validExitCodes= @(0, 3)
}

Install-ChocolateyInstallPackage @packageArgs

















