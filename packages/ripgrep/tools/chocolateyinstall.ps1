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
    checksum       = "E47D4AB05F909150D1C96FE4EAB04409DA71319F"
    checksumType   = "sha1"
    url64bit       = $url64
    checksum64     = "E57A4D334FAFAA11A6A94875994F74E01F5FC782"
    checksumType64 = "sha1"
}

Install-ChocolateyZipPackage @packageArgs
