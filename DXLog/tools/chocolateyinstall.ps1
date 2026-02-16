$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$filename = 'DXLog.net-2.6.26.msi'
$checksum = '2ADDD0E1856A76AD9962D12B9897AD21505725C9E6632977425A48D09ECB7882'
$RootURL =  'https://dxlog.net/sw/files/'
$oldUrl =   'https://dxlog.net/sw/files/download/old/'

# Latest version of DXLog is available at https://dxlog.net/sw/files/download/
$url        = $RootURL + $filename
$url64      = $RootURL + $filename

try
{
  $request = Invoke-WebRequest -Uri $url -Method Head -UseBasicParsing
}
catch
{
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