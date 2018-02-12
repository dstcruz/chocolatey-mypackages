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
    checksum       = "975959F5B5054B9CF59196F818DAAEDC9CFBBC9C"
    checksumType   = "sha1"
    url64bit       = $url64
    checksum64     = "4E44E3D19D762A4B9B9AB57C4B5B9F4EE57E266D"
    checksumType64 = "sha1"
}

Install-ChocolateyZipPackage @packageArgs
