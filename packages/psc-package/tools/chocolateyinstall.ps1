$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $Env:chocolateyPackageName
    unzipLocation  = Split-Path $MyInvocation.MyCommand.Definition
    url64          = 'https://github.com/purescript/psc-package/releases/download/v0.5.1/win64.tar.gz'
    checksum64     = '52288bfa0586de6187ea057488467f809e15a1df6db2d1609271a711753cc062'
    checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $env:ChocolateyInstall\lib\$packageName\tools\ -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $env:ChocolateyInstall\lib\$packageName\tools\
