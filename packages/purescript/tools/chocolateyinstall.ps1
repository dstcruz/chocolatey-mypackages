$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $Env:ChocolateyPackageName
    unzipLocation  = Split-Path $MyInvocation.MyCommand.Definition
    url64          = 'https://github.com/purescript/purescript/releases/download/v0.15.7/win64.tar.gz'
    checksum64     = 'b7328f5c26b55336ce93d0f23bfa2ad0a3c7c674972bc500c417db93d53ed004' 
    checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $env:ChocolateyInstall\lib\$packageName\tools\ -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $env:ChocolateyInstall\lib\$packageName\tools\
