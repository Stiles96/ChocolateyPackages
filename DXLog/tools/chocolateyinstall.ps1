$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://dxlog.net/sw/files/DXLog.net-2.6.20.msi'
$url64      = 'https://dxlog.net/sw/files/DXLog.net-2.6.20.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'DXLog*'

  checksum      = '3D09D58255ACB32C84A505753192052220A191B8A5EA9B50DADD6F6CF4D41233'
  checksumType  = 'sha256'
  checksum64    = '3D09D58255ACB32C84A505753192052220A191B8A5EA9B50DADD6F6CF4D41233'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

