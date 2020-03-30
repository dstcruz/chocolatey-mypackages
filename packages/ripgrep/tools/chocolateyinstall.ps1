$ErrorActionPreference = 'Stop';

$version     = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url         = 'https://github.com/BurntSushi/ripgrep/releases/download/12.0.1/ripgrep-12.0.1-x86_64-pc-windows-msvc.zip'
$url64       = 'https://github.com/BurntSushi/ripgrep/releases/download/12.0.1/ripgrep-12.0.1-i686-pc-windows-msvc.zip'

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    checksum       = 'f44d178f37cfb1edb28fa1fffbf203ef64db8470175ae29489720ac2d17bccf0'
    checksumType   = 'sha256'
    url64bit       = $url64
    checksum64     = '8f25fca0c0508ceae8c8d4d427b1ce2c3de4921a1b588261e79ae1f5a30389a4'
    checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
