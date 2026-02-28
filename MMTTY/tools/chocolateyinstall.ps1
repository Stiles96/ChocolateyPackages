$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'https://wiki.he-it.eu/public-uploads/MMTTY170K.exe'
  url64bit      = 'https://wiki.he-it.eu/public-uploads/MMTTY170K.exe'
  checksum      = 'CF9F9A365AC05E541CC4E1948A8341948598BF3BFC158BAFBEA4DDB5D3426807'
  checksum64    = 'CF9F9A365AC05E541CC4E1948A8341948598BF3BFC158BAFBEA4DDB5D3426807'
  checksumType  = 'sha256'
  checksumType64= 'sha256'
  softwareName  = 'MMTTY*'

  silentArgs    = "/SP- /VERYSILENT /SUPPRESSMSGBOXES /NOCANCEL"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
