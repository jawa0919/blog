# note

## nodejs shell

```shell
set-ExecutionPolicy RemoteSigned
get-ExecutionPolicy

pnpm --version
pnpm env use --global 20
node --version
npm --version
npm install -g @pnpm/exe@10
npm outdated -g
npm install -g vite@latest
npm install -g typescript@latest
npm install -g @vue/cli@latest
```

## flutter shell

```shell
flutter doctor -v
flutter create --platforms android,ios app
flutter create -t plugin --platforms android,ios plg
flutter create -t package pkg
flutter create -t module mod
flutter create --org top.men6jia -t plugin --platforms android,ios -a java -i objc plg
flutter create --org top.men6jia --platforms android,ios app

flutter clean
flutter run --release
flutter build apk --target-platform android-arm64 --split-per-abi
flutter build apk --target-platform android-arm --split-per-abi
flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi
flutter build apk --split-per-abi

flutter pub run flutter_flavorizr
flutter run --flavor uat -t lib/main_uat.dart
flutter build apk --flavor pure -t lib/main_pure.dart --target-platform android-arm64 --split-per-abi

pod install --no-repo-update --verbose
flutter build ios

flutter build aar
flutter build ios-framework

dart run
dart run :hi

$Env:http_proxy="http://127.0.0.1:7897";$Env:https_proxy="http://127.0.0.1:7897"
export http_proxy=http://127.0.0.1:7897
export https_proxy=http://127.0.0.1:7897
flutter pub publish --dry-run -v
flutter pub publish --server=https://pub.dev -v
```
