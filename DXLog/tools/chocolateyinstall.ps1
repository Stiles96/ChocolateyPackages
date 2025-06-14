$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://dxlog.net/sw/files/DXLog.net-2.6.16.msi'
$url64      = 'https://dxlog.net/sw/files/DXLog.net-2.6.16.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'DXLog*'

  checksum      = '1B2165E8D6BA4F6DEE10145A32E983FC8ABCAF36BC32AE5D5CEFE9274FC6E29B'
  checksumType  = 'sha256'
  checksum64    = '1B2165E8D6BA4F6DEE10145A32E983FC8ABCAF36BC32AE5D5CEFE9274FC6E29B'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

