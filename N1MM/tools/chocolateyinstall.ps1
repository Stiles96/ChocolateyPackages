$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://wiki.he-it.eu/public-uploads/N1MM-Logger-FullInstaller-1.0.11031.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           =  $url
  softwareName  = 'N1MM*'
  checksum      = '5C2F5D20B1A42A3178BA33BC30F5D83CC5215C2F0676059460BCEA789B61DA77'
  checksumType  = 'sha256'
  silentArgs	  = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
