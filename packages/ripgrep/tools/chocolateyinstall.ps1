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
  checksum       = "DE2642814AA91F6A12616039E23EF7C808D7F4F5"
  checksumType   = "sha1"
  url64bit       = $url64
  checksum64     = "1816CCAE668AEA5DBA07C657458A016406697069"
  checksumType64 = "sha1"
}

Install-ChocolateyZipPackage @packageArgs
