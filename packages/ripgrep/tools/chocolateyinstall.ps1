$ErrorActionPreference = 'Stop';

$version     = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url         = ("https://github.com/BurntSushi/ripgrep/releases/download/{0}/ripgrep-{0}-i686-pc-windows-msvc.zip" -f $version)
$url64       = ("https://github.com/BurntSushi/ripgrep/releases/download/{0}/ripgrep-{0}-x86_64-pc-windows-msvc.zip" -f $version)

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  checksum       = "C1B9DCC7A6008F8E1DE33A6D396A0CA6F359701D"
  checksumType   = "sha1"
  url64bit       = $url64
  checksum64     = "FADA0E9616DEE21CBBC78871BAE3F7D9A4A89FE6"
  checksumType64 = "sha1"
}

Install-ChocolateyZipPackage @packageArgs
