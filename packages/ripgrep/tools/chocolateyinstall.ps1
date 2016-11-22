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
  checksum       = "3D04EA4074C8EB14ECD4B866A4E0A677EEF6BB05"
  checksumType   = "sha1"
  url64bit       = $url64
  checksum64     = "B582D13B690B3BB5D65AEFB4D9564A4981D6BA93"
  checksumType64 = "sha1"
}

Install-ChocolateyZipPackage @packageArgs
