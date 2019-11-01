$ErrorActionPreference = 'Stop';

$version     = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url         = 'https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep-11.0.2-x86_64-pc-windows-msvc.zip'
$url64       = 'https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep-11.0.2-i686-pc-windows-msvc.zip'

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    checksum       = '0be0279591412e12b0b92d5fda0707ebeceb9c6a51472e99b46fd4d25f13b6ef'
    checksumType   = 'sha256'
    url64bit       = $url64
    checksum64     = '9408d9a49abc38768377378aa70c0d6615c06bbd0fd959048e1bbb7b261c3fdd'
    checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
