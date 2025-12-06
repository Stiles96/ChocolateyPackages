$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://dxlog.net/sw/files/DXLog.net-2.6.23.msi'
$url64      = 'https://dxlog.net/sw/files/DXLog.net-2.6.23.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'DXLog*'

  checksum      = '7CCE5DAFEBEB56FE1E971F32C5F66AA39199ECD3B1DD0D69E93CE01E7A18F338'
  checksumType  = 'sha256'
  checksum64    = '7CCE5DAFEBEB56FE1E971F32C5F66AA39199ECD3B1DD0D69E93CE01E7A18F338'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

