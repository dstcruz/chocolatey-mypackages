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
    checksum       = "90F88A33C8B92714C162B6E78284B84DF4D4306D"
    checksumType   = "sha1"
    url64bit       = $url64
    checksum64     = "AADB931F2C6DC357DAF01ACD2B4B8CD897EE2D7D"
    checksumType64 = "sha1"
}

Install-ChocolateyZipPackage @packageArgs
