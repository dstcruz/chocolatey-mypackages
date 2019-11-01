Import-Module AU

$releases = 'https://github.com/lunaryorn/mdcat/releases'

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
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url_part = $download_page.Links | Where-Object href -match 'windows' | ForEach-Object href | Select-Object -First 1
    $url = 'https://github.com' + $url_part
    $version = $url -split '/' | Select-Object -Last 1 -Skip 1 | ForEach-Object { $_ -split '-' } | Select-Object -Last 1

    @{
        URL32 = $url
        Version = $version
    }
}

Update-Package