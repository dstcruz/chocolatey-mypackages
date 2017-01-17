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
  checksum       = "B2E896F03255AA019626B3E13322489B3A9EBEE0"
  checksumType   = "sha1"
  url64bit       = $url64
  checksum64     = "D45E125878DEB866A83180058CE645BA6AB17B3F"
  checksumType64 = "sha1"
}

Install-ChocolateyZipPackage @packageArgs
