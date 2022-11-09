Import-Module AU

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
        "mdcat.nuspec" = @{
            "\d+\.\d+\.\d+" = "$($Latest.Version)"
        }
    }
}

function global:au_GetLatest {
    $latest = 'https://github.com/lunaryorn/mdcat/releases/latest'
    $versionRegex = 'releases/tag/mdcat-(.*)'
    $download_page = Invoke-WebRequest -Uri $latest -UseBasicParsing
    $version = `
        $download_page.Links`
        | Where-Object href -match $versionRegex `
        | Select-Object -First 1 @{ Name="Version"; Expression={ [regex]::Match($_.href, $versionRegex).Groups[1].Value }} `
        | Select-Object -ExpandProperty Version
    $url = "https://github.com/lunaryorn/mdcat/releases/download/mdcat-${version}/mdcat-${version}-x86_64-pc-windows-msvc.zip"

    @{
        URL32 = $url
        Version = $version
    }
}

Update-Package
