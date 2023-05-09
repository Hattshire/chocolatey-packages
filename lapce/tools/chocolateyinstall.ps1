
$ErrorActionPreference = 'Stop'


$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url64bit       = 'https://github.com/lapce/lapce/releases/download/v0.2.7/Lapce-windows.msi'
  checksum64     = 'b9738f4dea88394f62c6a97b9ba0ccaef8e39ecfa175a3d57e2b1ba82bdc46d0'
  checksumType64 = 'sha256'

  softwareName   = 'lapce*'

  silentArgs     = "/quiet"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs

















