# note

## node shell

```shell
set-ExecutionPolicy RemoteSigned
get-ExecutionPolicy

pnpm --version
pnpm env use --global 20
node --version
npm --version
npm install -g @pnpm/exe@8
npm outdated -g
npm install -g @vue/cli@latest
npm install -g vite@latest
npm install -g typescript@latest
```

## flutter shell

```shell
flutter doctor -v
flutter create --platforms android,ios app
flutter create -t plugin --platforms android,ios plg
flutter create -t package pkg
flutter create -t module mod
flutter create --org top.wj0919 -t plugin --platforms android,ios -a java -i objc plg
flutter create --org top.wiz --platforms android,ios flutter_wiz_app

flutter clean
flutter run --release
flutter build apk --target-platform android-arm64 --split-per-abi
flutter build apk --target-platform android-arm --split-per-abi
flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi
flutter build apk --split-per-abi

flutter pub run flutter_flavorizr
flutter run --flavor uat -t lib/main_uat.dart
flutter build apk --flavor pure -t lib/main_pure.dart --target-platform android-arm64 --split-per-abi

pod install --no-repo-update
flutter build ios

flutter build aar
flutter build ios-framework

dart run
dart run :aar
dart run :framework

$Env:http_proxy="http://127.0.0.1:10809";$Env:https_proxy="http://127.0.0.1:10809"
flutter pub publish --dry-run -v
flutter pub publish --server=https://pub.dev -v
```

## windows11

```shell
slmgr /ipk QXHTK-RTPT7-DD9KX-VPPPJ-VRHMH
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /ipk RJ94T-HR72Y-7WW6D-DDBK3-XWG23
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms kms.03k.org
slmgr /ato
```

## chrome 浏览器下载

chrome 最新完整离线版 [chrome 下载页](https://www.google.cn/chrome/?standalone=1&platform=win64)

## clash 订阅

```shell
https://fastly.jsdelivr.net/gh/ermaozi/get_subscribe@main/subscribe/clash.yml
https://fastly.jsdelivr.net/gh/zhangkaiitugithub/passcro@main/speednodes.yaml
```

## v2ray 订阅

```shell
https://proxy.v2gh.com/https://raw.githubusercontent.com/Pawdroid/Free-servers/main/sub
https://proxy.v2gh.com/https://raw.githubusercontent.com/aiboboxx/v2rayfree/main/v2
```
