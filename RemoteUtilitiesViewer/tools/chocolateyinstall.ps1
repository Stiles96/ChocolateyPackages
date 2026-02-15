$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$checksum = '89109e67cf25f1be4b1097f9cb98b201247d40b471364612f8fa7d4c2e947648'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'https://www.remoteutilities.com/download/viewer-7.7.3.0.exe'
  url64bit      = 'https://www.remoteutilities.com/download/viewer-7.7.3.0.exe'

  softwareName  = 'Remote Utilities - Viewer'

  checksum      = $checksum
  checksumType  = 'sha256'
  checksum64    = $checksum
  checksumType64= 'sha256'

  silentArgs    = "/S /v`"LAUNCHPROGRAM='' /qn`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs