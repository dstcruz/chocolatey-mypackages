$ErrorActionPreference = 'Stop';

$version     = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url         = ("https://github.com/lunaryorn/mdcat/releases/download/mdcat-{0}/mdcat-{0}-x86_64-pc-windows-msvc.zip" -f $version)

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    checksumType   = "sha1"
    checksum       = "FA380B341345BABA9357045F13AE8ADF10A2F76C"
}

Install-ChocolateyZipPackage @packageArgs
