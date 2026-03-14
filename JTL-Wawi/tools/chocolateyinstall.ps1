$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url           = 'https://downloads.jtl-software.de/setup-jtl-wawi_2.0.0_2026-03-06_20-00_e01a5a0.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'JTL-Wawi'
  checksum      = 'B96FF3F6101EAAAF39D4D2638CF498779A1FE1EBDD276B1114161AFFE00B9530'
  checksumType  = 'sha256'
  silentArgs	 = "/SP- /SILENT /ALLUSERS /NOCANCEL /NORESTART /LOG /NORESTARTAPPLICATIONS /CLOSEAPPLICATIONS"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
