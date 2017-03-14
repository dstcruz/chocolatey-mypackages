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
  checksum       = "13E05C4E6422E7E04A4F239B4617B1DEE7F38CC3"
  checksumType   = "sha1"
  url64bit       = $url64
  checksum64     = "FBDE330AA8FCF81827B3DB9EF120DB47314D3373"
  checksumType64 = "sha1"
}

Install-ChocolateyZipPackage @packageArgs
