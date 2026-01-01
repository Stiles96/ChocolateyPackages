$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://dxlog.net/sw/files/DXLog.net-2.6.24.msi'
$url64      = 'https://dxlog.net/sw/files/DXLog.net-2.6.24.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'DXLog*'

  checksum      = '876D537863F58BFC734361ADA2D719C0E8446533F677866A3EF5E518364AD792'
  checksumType  = 'sha256'
  checksum64    = '876D537863F58BFC734361ADA2D719C0E8446533F677866A3EF5E518364AD792'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

