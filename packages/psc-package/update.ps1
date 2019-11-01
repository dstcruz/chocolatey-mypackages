Import-Module AU

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*url64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
        "$($Latest.PackageName).nuspec" = @{
            "\d+\.\d+\.\d+" = "$($Latest.Version)"
        }
    }
}

function global:au_GetLatest {
    $json = Invoke-RestMethod "http://api.github.com/repos/purescript/psc-package/releases/latest"

    @{
        Version = $json.name.Replace('v', '')
        # ReleaseNotes = $json.body
        URL64 = $json.assets | Where-Object browser_download_url -match win64.tar.gz | ForEach-Object browser_download_url | Select-Object -First 1
    }
}

Update-Package -ChecksumFor 64