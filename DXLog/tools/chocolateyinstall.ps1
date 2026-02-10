$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$filename = 'DXLog.net-2.6.25.msi'
$checksum = 'B0FF811568EE8D7958FAEDEE0083A21987191A6BB2DDC73CA9BDDCC89BC7052A'
$RootURL =  'https://dxlog.net/sw/files/'
$oldUrl =   'https://dxlog.net/sw/files/download/old/'

# Latest version of DXLog is available at https://dxlog.net/sw/files/download/
$url        = $RootURL + $filename
$url64      = $RootURL + $filename

$request = Invoke-WebRequest -Uri $url -Method Head
if (!$request)
{
  # Previous versions of DXLog are available at https://dxlog.net/sw/files/download/old/
  $url        = $oldUrl + $filename
  $url64      = $oldUrl + $filename
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'DXLog*'

  checksum      = $checksum
  checksumType  = 'sha256'
  checksum64    = $checksum
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs