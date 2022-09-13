Import-Module AU

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*FileFullPath\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName32)'"
            "(?i)(^\s*FileFullPath64\s*=\s*)(.*)" = "`$1Join-Path `$toolsDir '$($Latest.FileName64)'"
        }
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
            "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
            "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
            "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
        }
        "ripgrep.nuspec" = @{
            "\d+\.\d+\.\d+" = "$($Latest.Version)"
        }
    }
}

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
    $releases = 'https://github.com/BurntSushi/ripgrep/releases/latest'
    $versionRegex = '\/releases\/tag\/(?:v|V)?(?<version>[\d.]+)'
    Invoke-WebRequest -Uri $releases -UseBasicParsing | Where-Object href -match $versionRegex
    $version = $Matches['version']
    $url_base = "https://github.com/BurntSushi/ripgrep/releases/download/${version}/ripgrep-${version}-"

    $url32 = $url_base + "i686-pc-windows-msvc.zip"
    $url64 = $url_base + "x86_64-pc-windows-msvc.zip"

    @{
        URL32 = $url32
        URL64 = $url64
        Version = $version
    }
}

Update-Package -ChecksumFor None
