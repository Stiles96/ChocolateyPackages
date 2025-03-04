$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://dxlog.net/sw/files/DXLog.net-2.6.14.msi'
$url64      = 'https://dxlog.net/sw/files/DXLog.net-2.6.14.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'DXLog*'

  checksum      = '8E4348197CC5BBB6EE81510D9A401B1DD38712A0B0184269ADA5E113C3E3F62D'
  checksumType  = 'sha256'
  checksum64    = '8E4348197CC5BBB6EE81510D9A401B1DD38712A0B0184269ADA5E113C3E3F62D'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

