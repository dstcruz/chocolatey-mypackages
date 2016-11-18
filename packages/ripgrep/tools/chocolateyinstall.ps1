$ErrorActionPreference = 'Stop';

$version     = "0.2.9"
$packageName = $env:chocolateyPackageName
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url         = ("https://github.com/BurntSushi/ripgrep/releases/download/{0}/ripgrep-{0}-i686-pc-windows-msvc.zip" -f $version)
$url64       = ("https://github.com/BurntSushi/ripgrep/releases/download/{0}/ripgrep-{0}-x86_64-pc-windows-msvc.zip" -f $version)

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  checksum       = "5F82A190A51E203CDA2CFF050B20F425C65CCD5A"
  checksumType   = "sha1"
  url64bit       = $url64
  checksum64     = "4D4866D8F3284F5C7E89470BE1530D6794EDC2CD"
  checksumType64 = "sha1"
}

Install-ChocolateyZipPackage @packageArgs
