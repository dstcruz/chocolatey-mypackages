$ErrorActionPreference = 'Stop';

$version     = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url         = 'https://github.com/lunaryorn/mdcat/releases/download/mdcat-0.22.3/mdcat-0.22.3-x86_64-pc-windows-msvc.zip'

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    checksumType   = 'sha256'
    checksum       = '0a89a5c2bf693f6ae9d9d30bdfb5e02394e3b613af65b7356a024fa8e0f283b4'
}

Install-ChocolateyZipPackage @packageArgs
