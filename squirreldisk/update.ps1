import-module Chocolatey-AU

$releases = 'https://github.com/adileo/squirreldisk/releases/latest'
$assets = 'https://github.com/adileo/squirreldisk/releases/expanded_assets/v'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url64bit\s*=\s*)('.*')"     = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
        }
        
        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases
    $version_page = $download_page.links | ? href -match '/releases/tag/v' | % href | select -First 1
    $version = (Split-Path $version_page -Leaf).Substring(1)

    $binaries_page = Invoke-WebRequest -Uri $assets$version

    $url   = $binaries_page.links | ? href -match '.msi$' | % href | select -First 1
    $version = (Split-Path ( Split-Path $url ) -Leaf).Substring(1)

    @{
        URL64   = 'https://github.com' + $url
        ReleaseNotes = 'https://github.com' + $version_page
        Version = $version
    }
}

update -ChecksumFor 64
