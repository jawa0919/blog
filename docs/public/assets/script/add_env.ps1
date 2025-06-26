#!/usr/bin/env pwsh


########################################################################################################################
Get-ChildItem Env:
# Java
[Environment]::SetEnvironmentVariable('JAVA_HOME', "C:\Program Files\Android\Android Studio\jbr" , 'User')
# Android
$LAP = [Environment]::GetEnvironmentVariable('LOCALAPPDATA')
$USP = [Environment]::GetEnvironmentVariable('USERPROFILE')
[Environment]::SetEnvironmentVariable('ANDROID_HOME', $LAP + "\Android\Sdk" , 'User')
[Environment]::SetEnvironmentVariable('ANDROID_SDK_ROOT',  $LAP + "\Android\Sdk" , 'User')
# # Flutter
# [Environment]::SetEnvironmentVariable('PUB_HOSTED_URL', "https://mirrors.tuna.tsinghua.edu.cn/dart-pub" , 'User')
# [Environment]::SetEnvironmentVariable('FLUTTER_STORAGE_BASE_URL', "https://mirrors.tuna.tsinghua.edu.cn/flutter" , 'User')
[Environment]::SetEnvironmentVariable('PUB_HOSTED_URL', "https://pub-web.flutter-io.cn" , 'User')
[Environment]::SetEnvironmentVariable('FLUTTER_STORAGE_BASE_URL', "https://storage.flutter-io.cn" , 'User')
[Environment]::SetEnvironmentVariable('FLUTTER_ROOT', $USP + "\Flutter\flutter3_22_3" , 'User')
[Environment]::SetEnvironmentVariable('PUB_CACHE', $USP + "\Flutter\.pub-cache" , 'User')

$sdk_path = "%JAVA_HOME%\bin;%ANDROID_SDK_ROOT%\tools;%ANDROID_SDK_ROOT%\platform-tools;%FLUTTER_ROOT%\bin;%PUB_CACHE%\bin"
$oldUserPath = (Get-Item -Path "HKCU:\Environment").GetValue("PATH", "", [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)
if ($oldUserPath.EndsWith(";")) {
  [Environment]::SetEnvironmentVariable('PATH', $oldUserPath + $sdk_path , 'User')
} else {
  [Environment]::SetEnvironmentVariable('PATH', $oldUserPath + ';' + $sdk_path, 'User')
}