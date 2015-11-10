$ErrorActionPreference = 'Stop';

$packageName= $env:chocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/monochromegane/the_platinum_searcher/releases/download/v1.7.9/pt_windows_386.zip'
$url64      = 'https://github.com/monochromegane/the_platinum_searcher/releases/download/v1.7.9/pt_windows_amd64.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64
}

Install-ChocolateyZipPackage @packageArgs
