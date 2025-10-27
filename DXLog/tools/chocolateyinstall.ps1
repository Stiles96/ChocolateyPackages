$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://dxlog.net/sw/files/DXLog.net-2.6.21.msi'
$url64      = 'https://dxlog.net/sw/files/DXLog.net-2.6.21.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'DXLog*'

  checksum      = '103D0AA967F646E5324895B66783C3CDEC7F42B1322E44E23F846035FF9931D5'
  checksumType  = 'sha256'
  checksum64    = '103D0AA967F646E5324895B66783C3CDEC7F42B1322E44E23F846035FF9931D5'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

