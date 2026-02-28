$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file64        = "$toolsDir\JTSyncSetup\Setup.exe"
  file          = "$toolsDir\JTSyncSetup\Setup.exe"
  softwareName  = 'JTSync*'

  silentArgs    = "/SP- /VERYSILENT /SUPPRESSMSGBOXES /NOCANCEL"
  validExitCodes= @(0, 3010, 1641)
}

$zipPackageArgs = @{
  packageName   = "JTSync"
  unzipLocation = "$toolsDir\JTSyncSetup"
  url           = 'https://www.dxshell.com/downloads/JTSyncSetup32.zip'
  url64bit      = 'https://www.dxshell.com/downloads/JTSyncSetup64.zip'
  checksum      = 'CC366F242D8A79A938C03631D424B14157546BD4239C2E444F0DF914589ECFE5'
  checksumType  = 'sha256'
  checksum64    = 'C611604EEB9DF9E66608829757A4B6AB30F1803BF44563C5E36DAD460E2577D9'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @zipPackageArgs
Install-ChocolateyInstallPackage @packageArgs
