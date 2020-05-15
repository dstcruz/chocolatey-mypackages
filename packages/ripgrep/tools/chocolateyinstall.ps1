$ErrorActionPreference = 'Stop';

$version     = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url         = 'https://github.com/BurntSushi/ripgrep/releases/download/12.1.0/ripgrep-12.1.0-x86_64-pc-windows-msvc.zip'
$url64       = 'https://github.com/BurntSushi/ripgrep/releases/download/12.1.0/ripgrep-12.1.0-i686-pc-windows-msvc.zip'

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    checksum       = 'd448ce19f9bfe81a1014f5a46675ef7e26253191786ec86dcdd98da11392ae3f'
    checksumType   = 'sha256'
    url64bit       = $url64
    checksum64     = '8dcca7ca3d498c7e36de50151f97b2c8dd2b7e216638479ecf6323624e50eeb9'
    checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
