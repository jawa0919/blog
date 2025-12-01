#!/usr/bin/env pwsh


########################################################################################################################
Get-ChildItem Env:
# 这个路径一般是C:\Users\Administrator\AppData\Local
# $LAP = [Environment]::GetEnvironmentVariable('LOCALAPPDATA')
# 这个路径一般是C:\Users\Administrator
$USP = [Environment]::GetEnvironmentVariable('USERPROFILE')
$sdkHome = "D:\.sdkHome"
# Java
Write-Host "Set Java Environment" -ForegroundColor Green
[Environment]::SetEnvironmentVariable('JAVA_HOME', "C:\Program Files\Android\Android Studio\jbr", 'User')
# [Environment]::SetEnvironmentVariable('JAVA_HOME', $USP + "\.jdks\" , 'User')
# Android
Write-Host "Set Android Environment" -ForegroundColor Green
[Environment]::SetEnvironmentVariable('ANDROID_HOME', $sdkHome + "\AndroidSdk" , 'User')
[Environment]::SetEnvironmentVariable('ANDROID_SDK_ROOT',  $sdkHome + "\AndroidSdk" , 'User')
[Environment]::SetEnvironmentVariable('GRADLE_USER_HOME',  $sdkHome + "\.gradle" , 'User')
# Flutter
Write-Host "Set Flutter Environment" -ForegroundColor Green
[Environment]::SetEnvironmentVariable('PUB_HOSTED_URL', "https://pub.flutter-io.cn" , 'User')
[Environment]::SetEnvironmentVariable('FLUTTER_STORAGE_BASE_URL', "https://storage.flutter-io.cn" , 'User')
[Environment]::SetEnvironmentVariable('FLUTTER_SDK_ROOT', $sdkHome + "\FlutterSdk\flutter3_27_4" , 'User')
[Environment]::SetEnvironmentVariable('PUB_CACHE', $sdkHome + "\.pub-cache" , 'User')
# Path
Write-Host "Add Path" -ForegroundColor Green
$sdk_path = "%JAVA_HOME%\bin;%ANDROID_SDK_ROOT%\tools;%ANDROID_SDK_ROOT%\platform-tools;%FLUTTER_SDK_ROOT%\bin;%PUB_CACHE%\bin;"
[Environment]::SetEnvironmentVariable("PATH", [Environment]::GetEnvironmentVariable("PATH", "User") + $sdk_path, "User")

Get-ChildItem Env:
Write-Host "add env Success" -ForegroundColor Green