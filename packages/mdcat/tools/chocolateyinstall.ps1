$ErrorActionPreference = 'Stop';

$version     = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url         = 'https://github.com/lunaryorn/mdcat/releases/download/mdcat-0.25.1/mdcat-0.25.1-x86_64-pc-windows-msvc.zip'

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    checksumType   = 'sha256'
    checksum       = 'ea5e9abfe9c92e95e7ac411ae68af6e234f0f17a10db597838a0f82e016f58e4'
}

Install-ChocolateyZipPackage @packageArgs
