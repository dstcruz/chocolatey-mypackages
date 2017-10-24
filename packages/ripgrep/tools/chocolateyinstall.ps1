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
    checksum       = "C0AEF3211C3E64E2770FE174A029E30FD2A042D5"
    checksumType   = "sha1"
    url64bit       = $url64
    checksum64     = "BF52F38DF02BF6E7B7D71220C1691190D41B16B7"
    checksumType64 = "sha1"
}

Install-ChocolateyZipPackage @packageArgs
