$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://dxlog.net/sw/files/DXLog.net-2.6.19.msi'
$url64      = 'https://dxlog.net/sw/files/DXLog.net-2.6.19.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'DXLog*'

  checksum      = 'DF7917364FEB242EA8C3FCFF1E8CFEE0D3C6514ED6C9352AF978EAEF5004858F'
  checksumType  = 'sha256'
  checksum64    = 'DF7917364FEB242EA8C3FCFF1E8CFEE0D3C6514ED6C9352AF978EAEF5004858F'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

