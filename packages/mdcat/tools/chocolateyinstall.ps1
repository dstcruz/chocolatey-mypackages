$ErrorActionPreference = 'Stop';

$version     = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url         = 'https://github.com/lunaryorn/mdcat/releases/download/mdcat-0.30.3/mdcat-0.30.3-x86_64-pc-windows-msvc.zip'

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    checksumType   = 'sha256'
    checksum       = '8cd675b90a4c95d1969616ce0d939c007d06b0624919645804bfe9d9f555d1e3'
}

Install-ChocolateyZipPackage @packageArgs
