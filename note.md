# note

## 常用目录

[ssh_id_rsa.pub](./../.ssh/id_rsa.pub)

[ssh_id_rsa](./../.ssh/id_rsa)

[ssh_config](./../.ssh/config)

[git_config](./../.gitconfig)

[npm_rc](./../.npmrc)

[init.gradle](./../.gradle/init.d/init.gradle)

### MAC

[bash_profile](./../.bash_profile)

[bash_history](./../.bash_history)

[.zshrc](./../.zshrc)

[.zsh_history](./../.zsh_history)

### Windows

[ConsoleHost_history.txt](./../AppData/Roaming/Microsoft/Windows/PowerShell/PSReadLine/ConsoleHost_history.txt)

[hosts](./../../../Windows/System32/drivers/etc/hosts)

## node

```shell
set-ExecutionPolicy RemoteSigned
get-ExecutionPolicy

pnpm --version
pnpm env use --global lts
pnpm env use --global 18
node --version
npm --version
pnpm i prettier eslint -g
pnpm i @vue/cli -g
pnpm i yo generator-code vsce -g
```

## flutter

```shell
flutter doctor -v
flutter clean
flutter create --org com.example --platforms android,ios f_app_
flutter create --org com.example -t plugin --platforms android,ios f_plugin_
flutter create --org com.example -t plugin --platforms android,ios -a java -i objc f_plugin_
flutter create --org com.example -t package f_package_
flutter create --org com.example -t module f_module_

flutter run --release
flutter build apk --target-platform android-arm64 --split-per-abi
flutter build apk --target-platform android-arm --split-per-abi
flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi
flutter build apk --split-per-abi

flutter pub run flutter_flavorizr
flutter run --flavor uat -t lib/main_uat.dart
flutter build apk --flavor uat -t lib/main_uat.dart --target-platform android-arm64 --split-per-abi

pod install --no-repo-update
flutter build ios

$Env:http_proxy="http://127.0.0.1:10809";$Env:https_proxy="http://127.0.0.1:10809"
flutter pub publish --dry-run -v
flutter pub publish --server=https://pub.dartlang.org -v
```

# windows11
```
slmgr /ipk QXHTK-RTPT7-DD9KX-VPPPJ-VRHMH
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /ipk RJ94T-HR72Y-7WW6D-DDBK3-XWG23
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms kms.03k.org
slmgr /ato
```

# chrome 浏览器

chrome 最新完整离线版 [chrome 下载页](https://www.google.cn/chrome/?standalone=1&platform=win64)


