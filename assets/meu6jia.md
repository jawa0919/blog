# Android 签名信息

```shell
keytool -list -v -keystore meu6jia.jks
```

```shell
别名: meu6jia
创建日期: 2025年9月18日
条目类型: PrivateKeyEntry
证书链长度: 1
证书[1]:
所有者: C=CN, O=top.meu6jia, OU=gh.jawa0919
发布者: C=CN, O=top.meu6jia, OU=gh.jawa0919
序列号: 1
生效时间: Thu Sep 18 10:53:47 CST 2025, 失效时间: Mon Sep 12 10:53:47 CST 2050
证书指纹:
  SHA1: 8B:CE:B5:0A:21:48:06:EF:3D:B4:E0:EB:78:18:7E:4C:22:7E:1C:EA
  SHA256: DC:7B:61:0B:CA:8F:CA:B8:D9:C8:6A:5A:AF:93:39:FC:0C:2A:24:E8:3C:4E:37:08:9C:4F:66:44:9A:FA:0E:9E
签名算法名称: SHA256withRSA
主体公共密钥算法: 2048 位 RSA 密钥
版本: 1
```

```shell
//wx
4b784ca00fa6341745d48b7e5853ee58
```

```groovy
    signingConfigs {
        release {
            def uh = System.getProperty("user.home")
            def ps = System.getenv("meu6jia_ps")
            storeFile file("$uh/blog/assets/meu6jia.jks")
            storePassword ps
            keyAlias 'meu6jia'
            keyPassword ps
        }
    }
    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
        }
    }
```

```kts
    signingConfigs {
        create("release") {
            val uh = System.getProperty("user.home")
            val ps = System.getenv("meu6jia_ps")
            storeFile = file("$uh/blog/assets/meu6jia.jks")
            storePassword = ps
            keyAlias = "meu6jia"
            keyPassword = ps
        }
    }
    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
        }
    }
```
