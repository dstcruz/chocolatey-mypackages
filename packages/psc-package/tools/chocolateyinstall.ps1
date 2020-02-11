$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $Env:chocolateyPackageName
    unzipLocation  = Split-Path $MyInvocation.MyCommand.Definition
    url64          = 'https://github.com/purescript/psc-package/releases/download/v0.6.2/win64.tar.gz'
    checksum64     = 'fdd443a01a83aa13bca1c0e0b3bfadf7311eb14a622528bfcc0154cc3d37c395'
    checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $env:ChocolateyInstall\lib\$packageName\tools\ -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $env:ChocolateyInstall\lib\$packageName\tools\
