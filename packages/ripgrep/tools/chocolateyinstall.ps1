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
  checksum       = "2CBCAEE8203BEB5368E389E599CB2C5DBA002F34"
  checksumType   = "sha1"
  url64bit       = $url64
  checksum64     = "F20012260C07CA7CBE8E8C0AB19580A61FDE2D0D"
  checksumType64 = "sha1"
}

Install-ChocolateyZipPackage @packageArgs
