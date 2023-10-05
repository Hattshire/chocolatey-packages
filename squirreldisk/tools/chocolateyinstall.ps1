
$ErrorActionPreference = 'Stop'


$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url64bit       = 'https://github.com/adileo/squirreldisk/releases/download/v0.3.4/SquirrelDisk_0.3.4_x64_en-US.msi'
  checksum64     = '82b3bff621aa871e19d5fd2fa25c303cf2d5c0a67b1c1d18df6d51c0e80d27a1'
  checksumType64 = 'sha256'

  softwareName   = 'SquirrelDisk*'

  silentArgs     = "/quiet"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs

















