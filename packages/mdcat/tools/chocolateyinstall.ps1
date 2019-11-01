$ErrorActionPreference = 'Stop';

$version     = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url         = 'https://github.com/lunaryorn/mdcat/releases/download/mdcat-0.13.0/mdcat-0.13.0-x86_64-pc-windows-msvc.zip'

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    checksumType   = 'sha256'
    checksum       = '66d970f35bb1c40f0bf93d45177e3f946e362e935d7e44bb93a3c252d2784ad1'
}

Install-ChocolateyZipPackage @packageArgs
