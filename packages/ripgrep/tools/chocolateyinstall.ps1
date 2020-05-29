﻿$ErrorActionPreference = 'Stop';

$version     = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url         = 'https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep-12.1.1-x86_64-pc-windows-msvc.zip'
$url64       = 'https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep-12.1.1-i686-pc-windows-msvc.zip'

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    checksum       = 'a74d23c8c52a7cfddab029e3217cd7aad49e970ab3ee45fa72fa5f5536230088'
    checksumType   = 'sha256'
    url64bit       = $url64
    checksum64     = '0256451a21cf5cf88dcd1823ffd2acd5e89d6b5dc9c2c8ad1324fd0e1f9ff61e'
    checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
