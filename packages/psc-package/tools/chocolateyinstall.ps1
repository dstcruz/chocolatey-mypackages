$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $Env:chocolateyPackageName
    unzipLocation  = Split-Path $MyInvocation.MyCommand.Definition
    url64          = 'https://github.com/purescript/psc-package/releases/download/v0.6.0/win64.tar.gz'
    checksum64     = 'b117b5898fff4f36c28666851705e9d94cbb7bb935512877e6e37b2c158b8b50'
    checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $env:ChocolateyInstall\lib\$packageName\tools\ -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $env:ChocolateyInstall\lib\$packageName\tools\
