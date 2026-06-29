$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'https://wiki.he-it.eu/public-uploads/AntennaGeniusUtility_v4.1.16.exe'
  checksum      = 'F216E83ECBA0A4959ABB1E3C4B5A667E44DD75C9B41D9CF32B5969864F189736'
  checksumType  = 'sha256'
  softwareName  = 'Antenna*'

  silentArgs    = "/SP- /VERYSILENT /SUPPRESSMSGBOXES /NOCANCEL"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
