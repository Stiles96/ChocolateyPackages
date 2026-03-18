$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url           = 'https://downloads.jtl-software.de/setup-jtl-wawi_1.11.7_0212-1212_45a0e8fc8d7.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'JTL-Wawi'
  checksum      = '8323839FBB97E5E58C41B59CB6430A5CEB7599B977B07BBB5CAB1B913A59D2B1'
  checksumType  = 'sha256'
  silentArgs	 = "/SP- /SILENT /ALLUSERS /NOCANCEL /NORESTART /LOG /NORESTARTAPPLICATIONS /CLOSEAPPLICATIONS"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
