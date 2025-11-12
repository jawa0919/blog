# Mac 电脑设置

## ios

USB 数据线信任重复断连命令修复

```shell
sudo killall -STOP -c usbd
```

## 环境变量

```shell
# java
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home"
export PATH="$PATH:$JAVA_HOME/bin"
# java end
# android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools"
# export GRADLE_USER_HOME="$HOME/.sdkCache/.gradle"
# android end
# flutter
# export FLUTTER_SDK_ROOT="$HOME/.sdkHome/FlutterSdk/flutter3_27_4"
export FLUTTER_SDK_ROOT="$HOME/.sdkHome/FlutterSdk/flutter3_32_8"
export PUB_HOSTED_URL="https://pub.flutter-io.cn"
export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
export PATH="$PATH:$FLUTTER_SDK_ROOT/bin"
# export PUB_CACHE="$HOME/.sdkCache/.pub_cache"
# export PATH="$PATH:$PUB_CACHE/bin"
# flutter end
# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
```

## Mac

1. 显示隐藏文件夹

   ```shell
   defaults write com.apple.finder AppleShowAllFiles -bool true;\
   KillAll Finder
   ```

2. ssh 文件权限提升

   ```shell
   chmod 700 ~/.ssh
   chmod 600 ~/.ssh/id_rsa
   ```

3. 【可选】安装 Homebrew

   ```shell
   # 执行下面命令,按照提示选择镜像源,选清华源
   /bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
   # 检查安装
   brew --version
   ```

4. 【可选】安装 git

   安装 xcode 自动安装

   ```shell
   # 执行下面命令
   brew install git
   # 检查安装
   git --version
   ```

5. 【可选】安装 rvm

   ```shell
   # 执行下面命令
   curl -L https://get.rvm.io | bash -s stable
   # 检查安装
   rvm --version
   ```

6. 【可选】安装换源升级 Ruby

   ```shell
   # 执行下面命令
   brew install ruby
   # 检查安装
   ruby --version
   gem --version
   # Ruby换源-清华源
   gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/
   # 检查换源
   gem sources -l
   # 检查升级
   sudo gem updates —system
   ```

7. 安装 CocoaPods

   ```shell
   # 执行下面命令
   sudo gem install cocoapods
   # 或者执行下面命令
   sudo gem install -n /usr/local/bin cocoapods
   # 检查安装
   pod --version
   ```

8. 换源 CocoaPods

   CocoaPods 有两套源系统,`trunk`（V1.8.0 以后成为默认）/`master`（V1.8.0 以前）.

   默认使用`trunk`,类似于 npmjs,pubDev,maven.并且默认有 cdn 加速.也规避了旧的 git 仓库源拉取的过程

   > 相关文章 [‘Trunk’, 我们的解决方案-cocoapods.org](https://blog.cocoapods.org/CocoaPods-Trunk/#trunk)
   > 只是查找阶段加速,即对第三方包索引目录 cdn.第三方包二进制文件还是在 github 下载.

   ```shell
   cd ~/.cocoapods/repos
   pod repo remove master
   # Specs换源-清华源/腾讯源-选一个
   git clone https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git master
   ```

   然后在 `PodFile` 第一行加上`source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'`

   这个克隆的过程比较长。

9. 脚本替换第三方包的 github 地址

   pod_install_fast.sh

   <<< ./pod_install_fast.sh
