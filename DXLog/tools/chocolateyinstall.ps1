$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://dxlog.net/sw/files/DXLog.net-2.6.12.msi'
$url64      = 'https://dxlog.net/sw/files/DXLog.net-2.6.12.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'DXLog*'

  checksum      = '42C4A09E7BF0F640E46EA75EF81C577779A1328A7D65B7FFA60620D7B9D1B6A8'
  checksumType  = 'sha256'
  checksum64    = '42C4A09E7BF0F640E46EA75EF81C577779A1328A7D65B7FFA60620D7B9D1B6A8'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

