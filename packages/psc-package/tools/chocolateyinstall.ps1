$ErrorActionPreference = 'Stop';

$version     = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$url64       = ("https://github.com/purescript/psc-package/releases/download/v{0}/win64.tar.gz" -f $version)

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = Split-Path $MyInvocation.MyCommand.Definition
    url64bit       = $url64
    checksum64     = "be6db98856d131bcd04c6e4d38f16b1be4817522"
    checksumType64 = "sha1"
}

Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $env:ChocolateyInstall\lib\$packageName\tools\ -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $env:ChocolateyInstall\lib\$packageName\tools\
