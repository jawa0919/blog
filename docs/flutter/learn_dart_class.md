# 学习Dart 类的概念

## 前置知识

首先记住两个概念

- Dart 不支持 `函数重载`

  ```dart
  void func() {}
  // 报错 无法编译使用
  // void func(String a) {}
  ```

- Dart 的类默认有一个隐形的参数为空的构造器函数

  类里面没有显写构造器函数时，默认有一个隐式的无参构造器函数，会调用父类的无参构造器函数

  ```dart

  class Dto {
    Dto(); // 隐形的，如果不写，也是可以使用的 Dto()
  }

  void main() {
    Dto a = Dto();
  }

  ```

## 类的构造器

### 命名构造器函数

构造器本身是一种函数，Dart 引入了`命名构造器函数`来解决一些需要重载构造的问题，注意使用`命名构造器函数`是也是一种构造函数。

```dart

class Dto {
 // Dto(); // 隐形的，如果不写，也是可以使用的 Dto()

  Dto.def();
  Dto.fromJson(Map<String, dynamic> json); // 常见的json转model就是使用命名构造器函数

  Dto._action(int a);
  // Dto._action(int a, String b); // 同样无法重载

}

void main() {
  // Dto a = Dto(); // 命名构造器函数也是一种构造器函数，所以再使默认构造器函数将报错
  Dto b = Dto.def();
  Dto model = Dto.fromJson("xxx");
}

```

### `factory` 工厂构造函数

用于单例模式

```dart
class Singleton {
  static final Singleton _singleton = Singleton._internal();
  Singleton._internal();
  factory Singleton() {
    return _singleton;
  }
}
```

用于单例模式的多实例缓存

```dart
class SingletonDto {
  static final Map<String, SingletonDto> _cache = <String, SingletonDto>{};
  SingletonDto._internal(String key);
  factory SingletonDto(String key) {
    return _cache.putIfAbsent(key, () => SingletonDto._internal(key));
  }
}
```

用于抽象类构造生成子类实例

参考 flutter 中`Key`抽象类和`ValueKey`类

## 类的成员变量

### 静态变量

```dart
class Dto {
  // 静态变量可随时修改
  static String TYPE1 = "aaa";
  // 静态变量无法修改
  static const String TYPE2 = "bbb";
  // 静态变量生成后无法修改
  static final String TYPE3 = _func("ccc");
  static String _func(args) {
    return args;
  }
}
```

### 实例变量

```dart
class Dto {
  // 实例变量常见有这四种申明,各有好处
  String id; // must be initialized
  final String name; // must be initialized
  String? age;
  late String address;
}
```

#### 解决 must be initialized 初始化实例变量

方法同样适合`final`修饰的实例变量

```dart
// 在声明时初始化实例变量
class DtoA {
  String id = "111";
}
// 在构造函数时初始化实例变量
class DtoB {
  String id;
  DtoB(this.id);
  DtoB.ins(this.id);
}
// 在初始化列表时初始化实例变量
class DtoC {
  String id;
  DtoC({required String args}) : id = args;
  DtoC.ins(String args) : id = args;
}

```

其他综合实例运用

```dart
class Dto {
  final String id; // must be initialized
  final String name; // must be initialized

  Dto({required this.id, required this.name});

  Dto.fromJson(Map<String, dynamic> json)
      : assert(json.isNotEmpty),
        assert(json['id'].isNotEmpty),
        id = json['id'],
        name = json['name'];

  Dto.fromRaw(String raw)
      : assert(raw.isNotEmpty),
        id = _jsonId(raw),
        name = _jsonName(raw);

  static String _jsonId(String raw) {
    return jsonDecode(raw)["id"];
  }

  static String _jsonName(String raw) {
    return jsonDecode(raw)["name"];
  }
}
```
