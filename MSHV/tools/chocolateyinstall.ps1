$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$checksum = '05CFFDE7A45D51EA4E3089FE365F90D719DEBF1E35815A6A34CDE1FFE3FB223C'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'https://deac-riga.dl.sourceforge.net/project/mshv/MSHV_2764_Installer_32_and_64bit.exe?viasf=1'
  url64bit      = 'https://deac-riga.dl.sourceforge.net/project/mshv/MSHV_2764_Installer_32_and_64bit.exe?viasf=1'

  softwareName  = 'MSHV*'

  checksum      = $checksum
  checksumType  = 'sha256'
  checksum64    = $checksum
  checksumType64= 'sha256'

  silentArgs    = "/S /D=C:\Program Files\MSHV"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs