$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://dxlog.net/sw/files/DXLog.net-2.6.10.msi'
$url64      = 'https://dxlog.net/sw/files/DXLog.net-2.6.10.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'DXLog*'

  checksum      = '0c030d0dd4034b09d67e6ec91cd33dd284011204113740d019cc0fb0df2748e5'
  checksumType  = 'sha256'
  checksum64    = '0c030d0dd4034b09d67e6ec91cd33dd284011204113740d019cc0fb0df2748e5'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

