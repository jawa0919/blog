#!/usr/bin/env pwsh

########################################################################################################################
# Java
[Environment]::SetEnvironmentVariable('JAVA_HOME', "C:\Program Files\Android\Android Studio\jbr" , 'User')
# Android
$oldUserProfile = [Environment]::GetEnvironmentVariable('USERPROFILE')
[Environment]::SetEnvironmentVariable('ANDROID_HOME', $oldUserProfile + "\sdk\androidSDK" , 'User')
[Environment]::SetEnvironmentVariable('ANDROID_SDK_ROOT',  $oldUserProfile + "\sdk\androidSDK" , 'User')
# # Flutter
[Environment]::SetEnvironmentVariable('PUB_HOSTED_URL', "https://pub.flutter-io.cn" , 'User')
[Environment]::SetEnvironmentVariable('FLUTTER_STORAGE_BASE_URL', "https://storage.flutter-io.cn" , 'User')
[Environment]::SetEnvironmentVariable('FLUTTER_ROOT', $oldUserProfile + "\sdk\flutter3_16_9" , 'User')
[Environment]::SetEnvironmentVariable('PUB_CACHE', $oldUserProfile + "\sdk\.pub-cache" , 'User')

$sdk_path = "%JAVA_HOME%\bin;%ANDROID_SDK_ROOT%\tools;%ANDROID_SDK_ROOT%\platform-tools;%FLUTTER_ROOT%\bin;%PUB_CACHE%\bin"
$oldUserPath = (Get-Item -Path "HKCU:\Environment").GetValue("PATH", "", [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)
if ($oldUserPath.EndsWith(";")) {
  [Environment]::SetEnvironmentVariable('PATH', $oldUserPath + $sdk_path , 'User')
}
else {
  [Environment]::SetEnvironmentVariable('PATH', $oldUserPath + ';' + $sdk_path, 'User')
}