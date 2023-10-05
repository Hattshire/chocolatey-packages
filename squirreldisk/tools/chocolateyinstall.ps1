
$ErrorActionPreference = 'Stop'


$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url64bit       = 'https://github.com/adileo/squirreldisk/releases/download/v0.3.0/SquirrelDisk_0.3.0_x64_en-US.msi'
  checksum64     = ''
  checksumType64 = 'sha256'

  softwareName   = 'SquirrelDisk*'

  silentArgs     = "/quiet"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs

















