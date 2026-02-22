$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$filename = 'SetupVSPE.msi'
$checksum = '066BCA36D1F07FA84B3AFE82313E67F6AB8941F3C9B24D0FC1826A1F780054E2'
$RootURL =  'https://wiki.he-it.eu/public-uploads/'

$url        = $RootURL + $filename
$url64      = $RootURL + $filename

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Virtual Serial Ports Emulator'

  checksum      = $checksum
  checksumType  = 'sha256'
  checksum64    = $checksum
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs