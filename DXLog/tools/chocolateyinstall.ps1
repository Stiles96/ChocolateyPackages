$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://dxlog.net/sw/files/DXLog.net-2.6.11.msi'
$url64      = 'https://dxlog.net/sw/files/DXLog.net-2.6.11.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'DXLog*'

  checksum      = '7E1C0343DE33E9572074BBF45280E94BF90A87734362C88B6F9F561500284068'
  checksumType  = 'sha256'
  checksum64    = '7E1C0343DE33E9572074BBF45280E94BF90A87734362C88B6F9F561500284068'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

