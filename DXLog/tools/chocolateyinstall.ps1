$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://dxlog.net/sw/files/DXLog.net-2.6.15.msi'
$url64      = 'https://dxlog.net/sw/files/DXLog.net-2.6.15.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'DXLog*'

  checksum      = 'DDA59685D21641989A59B8204402E7AC1FDD9A7FF1C3EBA0E299C70A1C5E752D'
  checksumType  = 'sha256'
  checksum64    = 'DDA59685D21641989A59B8204402E7AC1FDD9A7FF1C3EBA0E299C70A1C5E752D'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

