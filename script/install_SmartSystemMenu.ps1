#!/usr/bin/env pwsh

# Stop executing script on any error
$ErrorActionPreference = 'Stop'
# Do not show download progress
$ProgressPreference = 'SilentlyContinue'
########################################################################################################################
# 设置代理
# $githubDownloadProxy = "https://mirror.ghproxy.com/https://github.com"
# $githubDownloadProxy = "https://slink.ltd/https://github.com"
$githubDownloadProxy = "https://ghfast.top/https://github.com"
# $githubDownloadProxy = "https://ghproxy.net/https://github.com"
########################################################################################################################
$platform = $null
$architecture = $null
# PowerShell versions before 6.* were only for Windows OS
if ($PSVersionTable.PSVersion.Major -eq 5) {
    $platform = 'win'
}
if ($PSVersionTable.PSVersion.Major -ge 6) {
    if ($PSVersionTable.Platform -eq 'Unix') {
        if ($PSVersionTable.OS -like 'Darwin*') {
            $platform = 'macos'
        }
        if ($PSVersionTable.OS -like 'Linux*') {
            $platform = 'linux'
        }
        # PowerShell does not seem to have normal cmdlets for retrieving system information, so we use UNAME(1) for this.
        $arch = uname -m
        switch -Wildcard ($arch) {
            'x86_64' { $architecture = 'x64'; Break }
            'amd64' { $architecture = 'x64'; Break }
            'armv*' { $architecture = 'arm'; Break }
            'arm64' { $architecture = 'arm64'; Break }
            'aarch64' { $architecture = 'arm64'; Break }
        }
        # 'uname -m' in some cases mis-reports 32-bit OS as 64-bit, so double check
        if ([System.Environment]::Is64BitOperatingSystem -eq $false) {
            if ($architecture -eq 'x64') {
                $architecture = 'i686'
            }
            if ($architecture -eq 'arm64') {
                $architecture = 'arm'
            }
        }
    }
}
if ($platform -eq 'win') {
    if ([System.Environment]::Is64BitOperatingSystem -eq $true) {
        $architecture = 'x64'
    }
    if ([System.Environment]::Is64BitOperatingSystem -eq $false) {
        $architecture = 'i686'
    }
}
if ($null -eq $platform) {
    Write-Error "Platform could not be determined! Only Windows, Linux and MacOS are supported."
}
switch ($architecture) {
    'x64' { ; Break }
    'arm64' { ; Break }
    Default {
        Write-Error "Sorry! software currently only provides pre-built binaries for x86_64/arm64 architectures."
    }
}
Write-Host "platform:$platform" -ForegroundColor Green
Write-Host "architecture:$architecture" -ForegroundColor Green
########################################################################################################################
$appDataFolder = $null
if ($null -eq $appDataFolder) {
    $appDataFolder = $env:APPDATA
}
if ($null -eq $appDataFolder) {
    $appDataFolder = $env:LOCALAPPDATA
}
if ($null -eq $appDataFolder) {
    $appDataFolder = $env:HOMEPATH
}
Write-Host "appDataFolder:$appDataFolder" -ForegroundColor Green
########################################################################################################################
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$githubDownload = "https://github.com"
$repoUser = "AlexanderPro"
$repoName = "SmartSystemMenu"
########################################################################################################################
$latestInfoUrl = "https://api.github.com/repos/$repoUser/$repoName/releases/latest"
Write-Host "load latestVersionInfo form '$latestInfoUrl'" -ForegroundColor Green
########################################################################################################################
$latestInfo = Invoke-WebRequest $latestInfoUrl -UseBasicParsing
$latestInfoJson = $latestInfo.Content | ConvertFrom-Json
$version = $latestInfoJson.tag_name
Write-Host "lastVersion:$version" -ForegroundColor Green
########################################################################################################################
if ('' -ne $githubDownloadProxy) {
    $githubDownload = $githubDownloadProxy
}
Write-Host "Download $repoUser-$repoName-$version from $githubDownload" -ForegroundColor Green
########################################################################################################################
$releasesFileName = "SmartSystemMenu_$version"
$releasesFileNameType = "zip"
########################################################################################################################
Write-Host "releasesFile:$releasesFileName.$releasesFileNameType" -ForegroundColor Green
$archiveUrl = "$githubDownload/$repoUser/$repoName/releases/download/$version/$releasesFileName.$releasesFileNameType"
Write-Host "archiveUrl: '$archiveUrl'" -ForegroundColor Green
########################################################################################################################
Write-Host "Downloading..." -ForegroundColor Green
$tempFile = New-TemporaryFile
Invoke-WebRequest $archiveUrl -OutFile $tempFile -UseBasicParsing
$tempFilePath = $tempFile.FullName
########################################################################################################################
$softwareCompanyFolder = Join-Path $appDataFolder $repoUser
$softwareFolder = Join-Path $softwareCompanyFolder $repoName
Write-Host "softwareFolder '$softwareFolder'" -ForegroundColor Green
if (Test-Path $softwareFolder) {
    Remove-Item $softwareFolder -Recurse
}
$null = New-Item -ItemType Directory -Path $softwareFolder
tar -xf $tempFilePath -C $softwareFolder
Write-Host "Install $repoName Success" -ForegroundColor Green
########################################################################################################################
# # 下载完成后，打开文件夹
Write-Host "Open explorer '$softwareFolder'" -ForegroundColor Green
Invoke-Item -Path "$softwareFolder"
########################################################################################################################
# # 下载完成后，添加到环境变量
# $softwarePath = $softwareFolder
# # 如果压缩文件夹
# $softwarePath = Join-Path $softwareFolder $releasesFileName
# Write-Host "add Path '$softwarePath'" -ForegroundColor Green
# $oldUserPath = (Get-Item -Path "HKCU:\Environment").GetValue("Path", "", [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)
# if ($oldUserPath.EndsWith(";")) {
#     [Environment]::SetEnvironmentVariable('Path', $oldUserPath + $softwarePath , 'User')
# }
# else {
#     [Environment]::SetEnvironmentVariable('Path', $oldUserPath + ';' + $softwarePath , 'User')
# }
########################################################################################################################
# # 下载完成后，添加桌面快捷方式
# $targetPath = "$softwareFolder\$repoName.exe"
# $desktopPath = Join-Path $env:USERPROFILE "Desktop"
# $shortcutName = "$repoName.lnk"
# $shortcutPath = Join-Path $desktopPath $shortcutName
# $wshell = New-Object -ComObject WScript.Shell
# $shortcut = $wshell.CreateShortcut($shortcutPath)
# $shortcut.TargetPath = $targetPath
# $shortcut.IconLocation = $targetPath
# $shortcut.WindowStyle = 1
# $shortcut.Description = "Shortcut to $repoName"
# $shortcut.Save()
# Write-Host "add Shortcut Success"
