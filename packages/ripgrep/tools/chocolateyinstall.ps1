$ErrorActionPreference = 'Stop';

$version     = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url         = ("https://github.com/BurntSushi/ripgrep/releases/download/{0}/ripgrep-{0}-i686-pc-windows-msvc.zip" -f $version)
$url64       = ("https://github.com/BurntSushi/ripgrep/releases/download/{0}/ripgrep-{0}-x86_64-pc-windows-msvc.zip" -f $version)

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    checksum       = "950E98808EFCDEB95699BA1A9D1FAE7F118F65E2"
    checksumType   = "sha1"
    url64bit       = $url64
    checksum64     = "37B7A0A1B3524350D73084C857C709105D5DF4C0"
    checksumType64 = "sha1"
}

Install-ChocolateyZipPackage @packageArgs
