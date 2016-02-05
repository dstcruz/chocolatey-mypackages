$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version     = "2.1.0"
$url         = ("https://github.com/monochromegane/the_platinum_searcher/releases/download/v{0}/pt_windows_386.zip" -f $version)
$url64       = ("https://github.com/monochromegane/the_platinum_searcher/releases/download/v{0}/pt_windows_amd64.zip" -f $version)

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64
}

Install-ChocolateyZipPackage @packageArgs
