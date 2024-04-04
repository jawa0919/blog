#!/usr/bin/env pwsh

########################################################################################################################
# Java
[Environment]::SetEnvironmentVariable('JAVA_HOME', "C:\Program Files\Android\Android Studio\jbr" , 'User')
# Android
$USP = [Environment]::GetEnvironmentVariable('USERPROFILE')
[Environment]::SetEnvironmentVariable('ANDROID_HOME', $USP + "\sdk\androidSDK" , 'User')
[Environment]::SetEnvironmentVariable('ANDROID_SDK_ROOT',  $USP + "\sdk\androidSDK" , 'User')
# # Flutter
[Environment]::SetEnvironmentVariable('PUB_HOSTED_URL', "https://pub.flutter-io.cn" , 'User')
[Environment]::SetEnvironmentVariable('FLUTTER_STORAGE_BASE_URL', "https://storage.flutter-io.cn" , 'User')
[Environment]::SetEnvironmentVariable('FLUTTER_ROOT', $USP + "\sdk\flutter3_13_9" , 'User')
[Environment]::SetEnvironmentVariable('PUB_CACHE', $USP + "\sdk\.pub-cache" , 'User')

$sdk_path = "%JAVA_HOME%\bin;%ANDROID_SDK_ROOT%\tools;%ANDROID_SDK_ROOT%\platform-tools;%FLUTTER_ROOT%\bin;%PUB_CACHE%\bin"
$oldUserPath = (Get-Item -Path "HKCU:\Environment").GetValue("PATH", "", [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)
if ($oldUserPath.EndsWith(";")) {
  [Environment]::SetEnvironmentVariable('PATH', $oldUserPath + $sdk_path , 'User')
}
else {
  [Environment]::SetEnvironmentVariable('PATH', $oldUserPath + ';' + $sdk_path, 'User')
}