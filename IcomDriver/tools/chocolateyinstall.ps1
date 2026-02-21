$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$checksum = '4022EEAA0164D877C7C4673D189D27D13826BCFFF64C2253123B0B1F586628E5'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file64        = "$toolsDir\IcomDriver\CD-301501-003\Driver\CP210xVCPInstaller_x64.exe"
  file          = "$toolsDir\IcomDriver\CD-301501-003\Driver\CP210xVCPInstaller_x86.exe"
  softwareName  = 'ICOM*'

  silentArgs    = "/S /SE"
  validExitCodes= @(0, 3010, 1641)
}

$zipPackageArgs = @{
  packageName   = "CP210xVCPInstaller_x64"
  unzipLocation = "$toolsDir\IcomDriver"
  url           = 'https://www.icomjapan.com/api/download.php?post_id=2417&fl=JTJGdXBsb2FkcyUyRnN1cHBvcnQlMkZmaXJtd2FyZV9kcml2ZXIlMkZjb21tb24lMkZDRC0zMDE1MDEtMDAzLnppcA=='
  url64bit      = 'https://www.icomjapan.com/api/download.php?post_id=2417&fl=JTJGdXBsb2FkcyUyRnN1cHBvcnQlMkZmaXJtd2FyZV9kcml2ZXIlMkZjb21tb24lMkZDRC0zMDE1MDEtMDAzLnppcA=='
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @zipPackageArgs
Install-ChocolateyInstallPackage @packageArgs

<#
if ([Environment]::Is64BitOperatingSystem)
{
  # x64
  Copy-Item -Path "$toolsDir\IcomDriver\CD-301501-003\Driver\x64\silabser.sys" -Destination "$env:WINDIR\System32\drivers\silabser.sys" -Force
}
else
{
  # x86
  Copy-Item -Path "$toolsDir\IcomDriver\CD-301501-003\Driver\x86\silabser.sys" -Destination "$env:WINDIR\SysWOW64\drivers\silabser.sys" -Force
}
#>