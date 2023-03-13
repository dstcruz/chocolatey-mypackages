$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $Env:ChocolateyPackageName
    unzipLocation  = Split-Path $MyInvocation.MyCommand.Definition
    url64          = 'https://github.com/purescript/purescript/releases/download/v0.15.8/win64.tar.gz'
    checksum64     = 'ef3efd52a739aee9073a921736e9f779f6d04337d1b1654e9ed64c9d21719b62' 
    checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $env:ChocolateyInstall\lib\$packageName\tools\ -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $env:ChocolateyInstall\lib\$packageName\tools\
