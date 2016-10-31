$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url         = ("https://github.com/BurntSushi/ripgrep/releases/download/{0}/ripgrep-{0}-i686-pc-windows-msvc.zip" -f $env:chocolateyPackageVersion)
$url64       = ("https://github.com/BurntSushi/ripgrep/releases/download/{0}/ripgrep-{0}-x86_64-pc-windows-msvc.zip" -f $env:chocolateyPackageVersion)

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  checksum       = "29B2CDFE3E06B79E216E51705BE15CD62133456F"
  checksumType   = "sha1"
  url64bit       = $url64
  checksum64     = "854273468BA6C02FD06DFB02C81E4E3A30F08E24"
  checksumType64 = "sha1"
}

Install-ChocolateyZipPackage @packageArgs
