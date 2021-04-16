$ErrorActionPreference = 'Stop';

$version     = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url         = 'https://github.com/lunaryorn/mdcat/releases/download/mdcat-0.22.4/mdcat-0.22.4-x86_64-pc-windows-msvc.zip'

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    checksumType   = 'sha256'
    checksum       = 'ba883cc61393f1398388b5c378c663e5f48006e78c2ea0ca232195033f34c2b6'
}

Install-ChocolateyZipPackage @packageArgs
