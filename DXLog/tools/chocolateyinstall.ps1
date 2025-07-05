$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://dxlog.net/sw/files/DXLog.net-2.6.18.msi'
$url64      = 'https://dxlog.net/sw/files/DXLog.net-2.6.18.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'DXLog*'

  checksum      = 'DAB50841CD2B970673E084562F600D5905924042FCD71AEF1972EB41B6CA6F28'
  checksumType  = 'sha256'
  checksum64    = 'DAB50841CD2B970673E084562F600D5905924042FCD71AEF1972EB41B6CA6F28'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

