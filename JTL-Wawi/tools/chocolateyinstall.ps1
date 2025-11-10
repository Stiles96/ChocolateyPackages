$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url           = 'https://downloads.jtl-software.de/setup-jtl-wawi_1.11.2_1029-1110_e35d3397680.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'JTL-Wawi'
  checksum      = '755A30DDA5758CA262E3CBE802E301FB0492D164E1F689DBA8CAB3B34CBD2B77'
  checksumType  = 'sha256'
  silentArgs	 = "/SP- /SILENT /ALLUSERS /NOCANCEL /NORESTART /LOG /NORESTARTAPPLICATIONS /CLOSEAPPLICATIONS"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
