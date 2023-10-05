
$ErrorActionPreference = 'Stop'


$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url64bit       = 'https://github.com/lapce/lapce/releases/download/v0.2.8/Lapce-windows.msi'
  checksum64     = 'e45ba8c907c340b7ad5c94bff94ecf4340f4a65d6005b868bc35a999b45d4766'
  checksumType64 = 'sha256'

  softwareName   = 'lapce*'

  silentArgs     = "/quiet"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs

















