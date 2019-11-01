Import-Module AU

$releases = 'https://github.com/BurntSushi/ripgrep/releases'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^[$]url64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
        "ripgrep.nuspec" = @{
            "\d+\.\d+\.\d+" = "$($Latest.Version)"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url_base = 'https://github.com'
    $urls =  $download_page.Links | Where-Object href -match 'pc-windows-msvc' | ForEach-Object href | Select-Object -First 2
    $url32 = $url_base + $urls.Where({ $_ -match 64 })
    $url64 = $url_base + $urls.Where({ $_ -match 686 }) 
    $version = $url32 -split '/' | Select-Object -Last 1 -Skip 1

    @{
        URL32 = $url32
        URL64 = $url64
        Version = $version
    }
}

Update-Package