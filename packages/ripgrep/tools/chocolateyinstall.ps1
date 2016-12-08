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
  checksum       = "77783657DB70332E3D95C5A825AB7419B755E3AD"
  checksumType   = "sha1"
  url64bit       = $url64
  checksum64     = "6F543778FDCB2B17F181A1CB9F956FA56D36F4AE"
  checksumType64 = "sha1"
}

Install-ChocolateyZipPackage @packageArgs
