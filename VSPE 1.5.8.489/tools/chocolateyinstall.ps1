$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  file64        = "$toolsDir\VSPE\SetupVSPE_64.msi"
  file          = "$toolsDir\VSPE\SetupVSPE_32.msi"
  softwareName  = 'Virtual Serial Ports Emulator*'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

$zipPackageArgs = @{
  packageName   = "VSPE"
  unzipLocation = "$toolsDir\VSPE"
  url           = 'https://eterlogic.com/downloads/SetupVSPE_32_1.5.8.489.zip'
  url64bit      = 'https://eterlogic.com/downloads/SetupVSPE_64_1.5.8.489.zip'
  checksum      = '09D9C011BD8E4C3CE70D58E581D7B3E73680FCD194A29E7A2F4BB9894D89CC5F'
  checksumType  = 'sha256'
  checksum64    = '1BE41D62F0D576E91D24B6FC74D4266BE029EB48587FBC056687F61B510C85F5'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @zipPackageArgs
Install-ChocolateyInstallPackage @packageArgs