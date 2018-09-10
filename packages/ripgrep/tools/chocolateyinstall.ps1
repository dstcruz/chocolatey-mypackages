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
    checksum       = "4C3C47455F88183C0D8841BFC8F00699F5A1D978"
    checksumType   = "sha1"
    url64bit       = $url64
    checksum64     = "F55E6355AE050CA0A8FF8DF3FB5D1B80A1CB6500"
    checksumType64 = "sha1"
}

Install-ChocolateyZipPackage @packageArgs
