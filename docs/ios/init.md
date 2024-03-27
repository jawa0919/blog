# Mac电脑设置

## ios

USB数据线信任重复断连命令修复

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
# android end
# flutter
export FLUTTER_ROOT="$HOME/sdk/flutter3_13_9"
export PUB_HOSTED_URL="https://pub.flutter-io.cn"
export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
export PUB_CACHE="$HOME/sdk/.pub_cache"
export PATH="$PATH:$FLUTTER_ROOT/bin:$PUB_CACHE/bin"
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

3. 安装 Homebrew

    ```shell
    # 执行下面命令,按照提示选择镜像源,选清华源
    /bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
    # 检查安装
    brew --version
    ```

4. 安装 git

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
    # Ruby换源-腾讯源
    gem sources --add https://cloud.tencent.com/rubygems/ --remove https://rubygems.org/
    # 检查换源
    gem sources -l
    # 检查升级
    sudo gem updates —system
    ```

7.  安装 CocoaPods

    ```shell
    # 执行下面命令
    sudo gem install cocoapods
    # 或者执行下面命令
    sudo gem install -n /usr/local/bin cocoapods
    # 检查安装
    pod --version
    ```

8.  换源 CocoaPods

    CocoaPods有两套源系统,`trunk`（V1.8.0以后成为默认）/`master`（V1.8.0以前）.

    默认使用`trunk`,类似于 npmjs,pubDev,maven.并且默认有cdn加速.也规避了旧的git仓库源拉取的过程

    > 相关文章 [‘Trunk’, 我们的解决方案-cocoapods.org](https://blog.cocoapods.org/CocoaPods-Trunk/#trunk)

    > 只是查找阶段加速,即对第三方包索引目录cdn.第三方包二进制文件还是在github下载.

    ```shell
    cd ~/.cocoapods/repos
    pod repo remove master
    # Specs换源-清华源/腾讯源-选一个
    git clone https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git master
    git clone https://cloud.tencent.com/CocoaPods/Specs.git master
    ```

    然后在 `PodFile` 第一行加上`source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'`或者`source 'https://cloud.tencent.com/CocoaPods/Specs.git'`

    这个克隆的过程比较长。

9.  脚本替换第三方包的github地址

    podGithubFast.sh

    ```shell
    #!/bin/bash

    # 文件夹路径
    DIRECTORY="$HOME/.cocoapods/repos/trunk/Specs"
    # DIRECTORY="$HOME/.cocoapods/repos/master/Specs"
    # 要替换的字符串
    OLD_STRING='"git": "https://github.com/'
    # 替换成的新字符串
    NEW_STRING='"git": "https://githubfast.com/'

    # 第一步：查找所有需要替换的文件并打印它们的路径
    echo "Searching for .podspec.json files under $DIRECTORY..."
    FILES=$(find "$DIRECTORY" -type f -name "*.podspec.json")

    # 如果未找到文件，则打印消息并退出脚本
    if [ -z "$FILES" ]; then
        echo "No .podspec.json files found in $DIRECTORY."
        exit 0
    fi

    # 第二步：对找到的文件执行替换操作
    echo "Replacing strings in the found files..."
    for FILE in $FILES; do
        sed -i '' "s|${OLD_STRING}|${NEW_STRING}|g" "$FILE"
        echo "Updated: $FILE"
    done

    # 替换完成后打印消息
    echo "All occurrences of '${OLD_STRING}' have been replaced with '${NEW_STRING}' in the found .podspec.json files."

    ```