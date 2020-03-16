$ErrorActionPreference = 'Stop';

$version     = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url         = 'https://github.com/BurntSushi/ripgrep/releases/download/12.0.0/ripgrep-12.0.0-x86_64-pc-windows-msvc.zip'
$url64       = 'https://github.com/BurntSushi/ripgrep/releases/download/12.0.0/ripgrep-12.0.0-i686-pc-windows-msvc.zip'

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    checksum       = '4909fd1624a17eb4918334821bfb73ce52bd7448ad5e0e6f6a17605031f6c5d5'
    checksumType   = 'sha256'
    url64bit       = $url64
    checksum64     = 'adca09b661ea76b8cf51c8ebd4adf6bd831303a41fcc7dc9320fb405b69f025b'
    checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
