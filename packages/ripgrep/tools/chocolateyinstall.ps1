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
    checksum       = "00F8319FA863B69141728AF57543B3D1FD2228F0"
    checksumType   = "sha1"
    url64bit       = $url64
    checksum64     = "6AF5BF5EE7FBE32C49156421C8FF128A543A6DBE"
    checksumType64 = "sha1"
}

Install-ChocolateyZipPackage @packageArgs
