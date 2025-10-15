#!/usr/bin/env pwsh


########################################################################################################################
Get-ChildItem Env:
# 这个路径一般是C:\Users\Administrator\AppData\Local
# $LAP = [Environment]::GetEnvironmentVariable('LOCALAPPDATA')
# 这个路径一般是C:\Users\Administrator
# $USP = [Environment]::GetEnvironmentVariable('USERPROFILE')
$sdkHome = "D:\sdkHome"
$sdkCache = "D:\sdkCache"
# Java
Write-Host "Set Java Environment" -ForegroundColor Green
[Environment]::SetEnvironmentVariable('JAVA_HOME', "C:\Program Files\Android\Android Studio\jbr" , 'User')
# [Environment]::SetEnvironmentVariable('JAVA_HOME', $sdkHome + "\.jdks\" , 'User')
# Android
Write-Host "Set Android Environment" -ForegroundColor Green
[Environment]::SetEnvironmentVariable('ANDROID_HOME', $sdkHome + "\AndroidSdk" , 'User')
[Environment]::SetEnvironmentVariable('ANDROID_SDK_ROOT',  $sdkHome + "\AndroidSdk" , 'User')
[Environment]::SetEnvironmentVariable('GRADLE_USER_HOME',  $sdkCache + "\.gradle" , 'User')
# Flutter
Write-Host "Set Flutter Environment" -ForegroundColor Green
[Environment]::SetEnvironmentVariable('PUB_HOSTED_URL', "https://pub.flutter-io.cn" , 'User')
[Environment]::SetEnvironmentVariable('FLUTTER_STORAGE_BASE_URL', "https://storage.flutter-io.cn" , 'User')
[Environment]::SetEnvironmentVariable('FLUTTER_ROOT', $sdkHome + "\Flutter\flutter3_27_4" , 'User')
[Environment]::SetEnvironmentVariable('PUB_CACHE', $sdkCache + "\.pub-cache" , 'User')
# Path
Write-Host "Add Path" -ForegroundColor Green
$sdk_path = "%JAVA_HOME%\bin;%ANDROID_SDK_ROOT%\tools;%ANDROID_SDK_ROOT%\platform-tools;%FLUTTER_ROOT%\bin;%PUB_CACHE%\bin"
$oldUserPath = (Get-Item -Path "HKCU:\Environment").GetValue("PATH", "", [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)
$newUserPath = if ($oldUserPath.EndsWith(";")) { $oldUserPath + $sdk_path } else { $oldUserPath + ';' + $sdk_path }
[Environment]::SetEnvironmentVariable('PATH', $newUserPath , 'User')
Write-Host "add env success" -ForegroundColor Green