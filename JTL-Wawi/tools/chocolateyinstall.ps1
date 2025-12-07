$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url           = 'https://downloads.jtl-software.de/setup-jtl-wawi_1.11.4_1113-0907_57f0e1d82b7.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'JTL-Wawi'
  checksum      = '6195470E59573427710115FB7B86E6DFB29AAC364A0402D101CDA979C4BA666A'
  checksumType  = 'sha256'
  silentArgs	 = "/SP- /SILENT /ALLUSERS /NOCANCEL /NORESTART /LOG /NORESTARTAPPLICATIONS /CLOSEAPPLICATIONS"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
