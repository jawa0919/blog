# note

## node shell

```shell
set-ExecutionPolicy RemoteSigned
get-ExecutionPolicy

pnpm --version
pnpm env use --global 14
node --version
npm --version
npm install -g @pnpm/exe@7.33.7
npm outdated -g
npm install -g @vue/cli@latest
npm install -g vite@latest
npm install -g typescript@latest
vue create cli_v2app
vue create cli_v3app
npm create vue@latest
npm create vite@latest html-demo
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

## flutter shell

```shell
gem --version
gem source
gem source -a https://mirrors.tuna.tsinghua.edu.cn/rubygems/
gem source -r https://rubygems.org/
gem install cocoapods -n /usr/local/bin
gem install cocoapods -v 1.11.2 -n /usr/local/bin
git clone https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git tsinghua-git-cocoapods --depth 1
pod repo list --verbose
pod repo update --verbose
pod search Reachability --simple --verbose
pod install --verbose
pod install --repo-update --verbose
pod install --no-repo-update --verbose
sh pod_install_fast.sh
```

## windows11

```
slmgr /ipk QXHTK-RTPT7-DD9KX-VPPPJ-VRHMH
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /ipk RJ94T-HR72Y-7WW6D-DDBK3-XWG23
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms kms.03k.org
slmgr /ato
```

## chrome 浏览器下载

chrome 最新完整离线版 [chrome 下载页](https://www.google.cn/chrome/?standalone=1&platform=win64)
