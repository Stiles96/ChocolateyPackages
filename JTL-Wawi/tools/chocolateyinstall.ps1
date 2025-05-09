$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url           = 'https://downloads.jtl-software.de/setup-jtl-wawi_1.10.10.4_0506-1209_fd098c5005fb.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'JTL-Wawi'
  checksum      = 'B04B4EFBD3B679BEB94AFF249546A91CFEE462799AEFCCB9E43C69E551A155D6'
  checksumType  = 'sha256'
  silentArgs	 = "/SP- /SILENT /ALLUSERS /NOCANCEL /NORESTART /LOG /NORESTARTAPPLICATIONS /CLOSEAPPLICATIONS"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
