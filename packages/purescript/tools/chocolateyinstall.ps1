$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $Env:ChocolateyPackageName
    unzipLocation  = Split-Path $MyInvocation.MyCommand.Definition
    url64          = 'https://github.com/purescript/purescript/releases/download/v0.14.0/win64.tar.gz'
    checksum64     = '58b29ddf55d8aca4a168913bdb43e02817e229d49908783066938b2db4cac249' 
    checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $env:ChocolateyInstall\lib\$packageName\tools\ -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $env:ChocolateyInstall\lib\$packageName\tools\
