# Hiểu về cách thêm thư viện bên ngoài vào dự án Flutter

Cách mà Dart tổ chức và chia sẻ các chức năng thông package . Dart Package là một thư viện hay mô hình đơn giản có thể chia sẻ. Nhìn chung, Dart package cũng giống như Dart Application ngoại trừ Dart Package không truy cập vào các điểm chính cùa ứng dung

Cấu trúc chung của Package ( ví dụ về package) dưới đây :

 \- **lib/src/\* :** tệp Dart ở dạng priavte 

 \- **lib/my_demo_package.dart :** phần code chính của Dart, có thể thêm một vài ứng dụng 

```dart
import 'package:my_demo_package/my_demo_package.dart'
```

 \- Một vài tệp ở dạng private có thể được xuất sang tệp chính (my_demo_package.dart) :

```dart
export src/my_private_code.dart
```

 \- **lib/\*** : Ta có thể truy cập vào bất kì tệp nào bên trong thư mục :

```dart
import 'package:my_demo_package/custom_folder/custom_file.dart'
```

 **- pubspec.yaml :** Được hiểu là trình quản lý thư mục của Package 

 Để tích hợp được các gói vào dự án thì ta cần phải có file pubspec.yaml 

#### Các kiểu Package :

Kể từ khi Dart package là một collection có chức năng tương tự , nó có thể được phân loại dựa trên chức năng:

###### Dart Package

Chúng ta có thể sử dụng Dart trên cả 2 môi trường là web và android. Ví dụ , english_words là một package chứa khoảng 500 từ và có chức năng tiệng ích cơ bản như danh từ ( list các danh từ trong English), âm tiết (liệt kê ra các từ có âm tiết đặc biệt )

###### Flutter package

Phụ thuộc vào Flutter framework và có thể chỉ sử dụng trong môi trường mobile . 

###### Flutter plugin

Phụ thuộc vào Flutter framework cũng như nền tảng cơ bản (Android SDK hay iOS SDK). Ví dụ Camera là một plugin (có thể hiểu là một phần mềm hỗ trợ) để tương tác với thiết bị camera. Nó sử dụng SDK để có quyền truy cập vào camera 

#### Sử dụng Dart Package :

Dart package được lưu trữ và publish trên các máy chủ, https://pub.dev . Ngoài ra, Flutter cung cấp các tool, pub cơ bản để quản lý các Dart package trong ứng dụng. Các bước cần để sử dụng Package như sau :

-Nhập tên package và phiên bản phù hợp trong file pubspec.yaml như dưới đây :

```yaml
dependencies: english_words: ^3.1.5
```

-Bản mới nhất sẽ được cập nhật trên server

\- Cài đặt package bằng lệnh :

```bash
flutter packages get
```

\- Khi chúng ta đang dùng Android studio, thì Android studio sẽ phát hiện bất kì thay đổi trong file pubspec.yaml và hiện thông báo để lập trình viên có thể biết

\- Dart package có thể được cài đặt hoặc nâng cấp trong Android studio thông qua menu optionsoptions .

\- Thêm các file cần thiết sử dụng lệnh dưới đây và bắt đầu làm việc :

```dart
import 'package:english_words/english_words.dart';
```

\- Sử dụng bất kì phương thức có sẵn

```dart
nouns.take(50).forEach(print);
```

\- Ở trên ta đã dùng hàm nouns để lấy ra 50 từ đầu tiên



---



# Quản lý version của thư viện trong Flutter

Ở bài này chúng ta sẽ cùng nhau đi học cách quản lí version của các package được sử dụng trong dự án của mình.

Có khá nhiều các để `dependency` một package.

Cách 1: `dependency` cứng

```yaml
collection: "1.1.0"
```

Ở cách này thì chúng ta sẽ `dependency` package `collection` ở phiên bản `1.1.0`. Với điều này, `collection` sẽ được pull cố định ở phiên bản `1.1.0`, cho tới khi ta chủ động thay đổi.

Cách 2: `Sematic version`

Khi bạn `dependency` một package nào đó và bạn chỉ định Flutter có thể lấy bất kể phiên bản nào từ phiên bản bạn truyền vào. Trong trường hợp `author` của package bạn đang sử dụng upgrade package của họ vì một số lí do nào đó chẳng hạn như hotfix. Thì Flutter sẽ tự động lấy phiên bản phù hợp đó khi bạn gọi lệnh `Flutter pub get`

```yaml
collection: ^2.3.5	
```

Và dãy version Flutter cho phép tải về là từ 2.3.5 đến dưới 3.0.0

> **Lưu ý:** Ví dụ này sử dụng *cú pháp dấu mũ* để thể hiện một loạt các phiên bản. Chuỗi `^2.3.5`có nghĩa là "phạm vi của tất cả các phiên bản từ 2.3.5 đến 3.0.0, không bao gồm 3.0.0." Để biết thêm thông tin, hãy xem [Cú pháp con dấu](https://dart-dev.translate.goog/tools/pub/dependencies?_x_tr_sl=en&_x_tr_tl=vi&_x_tr_hl=vi&_x_tr_pto=wapp#caret-syntax) .

Cách 3: Version constraints

```yaml
dependencies:
  collection: '>=2.3.5 <2.4.0'
```

Ở cách này, bạn cho Flutter biết là phạm vi mà Flutter có thể pull package `collection` về là từ 2.3.5 cho đến nhỏ hơn 2.4.0. Trong trường hợp `collection` có một phiên bản hotfix là `2.3.6` thì hiển nhiên nó sẽ nằm trong dự án của bạn.

Cách 4: Vạn sự tùy duyên

Ngoài các cách ở trên. Bạn cũng có thể sử dụng cách này

```yaml
dependencies:
	love:
	// or
	love: any
```

Khi mà bạn dùng cách này, mình biết bạn đã cố gắng rất nhiều. Bạn chán đời, bạn thất vọng, bạn mệt mỏi khi mãi vẫn không tìm ra được một version phù hợp. Nghĩ mà xem, điều này giống như cuộc đời bạn vậy. Tìm mãi, tìm mãi vẫn không thể tìm được một nửa bạn cần. Đến cuối cùng, bạn thở dài và nghĩ trong đầu là :"Thôi thì vạn sự tùy duyên", giống như cách bạn phó mặt cho Flutter tự tìm cho bạn một version phù hợp vậy.

Nhưng đây cũng là cách mình không khuyến cáo các bạn sử dụng vì không tương minh.



# Hiểu về Dependencu Injection trong Flutter

## Cài đặt

Như các library khác, bạn cần thêm nó vào file `pubspec.yaml` trong project của bạn, sau đó chạy `flutter packages get` để cài đặt.

```yaml
dependencies:
  ...
  get_it: ^4.0.4
```



Sau đó trong project chúng ta sẽ tạo ra một file mới, mình đặt tên là `injection.dart`. Trong file này hãy tạo một hàm để lát sau chúng ta sẽ đăng kí các dependency trong đó. Nội dung file tương tự như sau:

```dart
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() async {
    // TODO: đăng kí các dependency trong này
}
```



Và cuối cùng mở file `main.dart`, gọi hàm mà chúng ta vừa tạo trước khi render UI:

```dart
import 'injection.dart';

void main() async {
  await configureDependencies();

  runApp(MyApp()));
}
```



## Tạo các instances

`get_it` cung cấp cho chúng ta gần như đầy đủ các pattern để tạo ra instance:

#### Factory

*Factory* được hiểu như một nhà máy sản xuất object. Mỗi khi bạn gọi đến để lấy object thì sẽ có một instance mới được tạo ra và trả về cho bạn.Cú pháp như sau:

```dart
// Dùng khi instance có thể khởi tạo được ngay
getIt.registerFactory<HomeBloc>(() => HomeBloc());

// Dùng khi instance bắt buộc phải tạo dưới dạng bất đồng bộ (asynchronous)
// hàm createAsync của HomeBloc trả về một Future<HomeBloc>
getIt.registerFactoryAsync<HomeBloc>(() => HomeBloc.createAsync());
```



Chúng ta dùng *Factory* khi luôn muốn nhận về một instance mới mỗi khi sử dụng mà không liên quan gì đến instance trước để tránh trường hợp dùng lại các data cũ đã init từ instance trước hoặc pointer cũ (điều này thể hiện rất rõ nếu như bạn đã từng sử dụng redux, phải luôn trả về một object mới để có thể render lại được).

*Factory* không nên dùng nếu như object của bạn có chứa các logic code quá phức tạp dẫn đến việc làm chậm quá trình khởi tạo và lãng phí tài nguyên do luôn phải tạo lại mới mỗi khi cần đến.

#### Singleton

*Singleton* trái ngược với *factory*, chỉ tạo ra một instance duy nhất kể từ khi app khởi động, sau đó nếu bất kì chỗ nào có dùng dến thì sẽ chỉ trả về instance đã tạo trước đó. Do đó xuyêt suốt app, bạn sẽ chỉ sử dụng một instance của object đó mà thôi.

```dart
// Dùng khi instance có thể khởi tạo được ngay
getIt.registerSingleton<CounterRepository>(CounterRepository());

// Dùng khi instance bắt buộc phải tạo dưới dạng bất đồng bộ (asynchronous)
// hàm createAsync của CounterRepository trả về một Future<CounterRepository>
getIt.registerSingletonAsync<CounterRepository>(() => CounterRepository.createAsync());
```



Trái ngược với *factory*, nên dùng *singleton* khi bạn chỉ muốn khởi tạo object một lần và dùng ở nhiều chỗ, tránh lãng phí tài nguyên. Không nên dùng nếu như nó phụ thuộc quá nhiều về mặt giá trị và pointer, dễ gây lỗi app về mặt logic nếu không xử lí cẩn thận.

#### Lazy-singleton

*Lazy-singleton* thì giống như *singleton*, chỉ khác là nó sẽ được khởi tạo vào **lần gọi lấy instance đầu tiên**, chứ không phải khi app khởi động. Sử dụng nó nếu như việc tạo instance này mất thời gian, bạn không muốn app dừng ở màn hình splash quá lâu để chờ khởi tạo instance, dẫn đến việc UX của app không tốt.

Ngoài ra nếu bạn nghĩ object này ở một trường hợp nào đó có thể sẽ không sử dụng thì cũng có thể dùng cách này để tránh lãng phí tài nguyên.

> Ví dụ như khi mất mạng, user sẽ không cần gọi api, dẫn đến không cần instance network. Chỉ khi user có mạng, api được gọi lần đầu tiên thì instance được khởi tạo và sử dụng bình thường

```dart
getIt.registerLazySingleton<CounterRepository>(() => CounterRepository());
```



## Sử dụng

Rất đơn giản, bạn chỉ cần dùng `getIt.get<T>()` với trường hợp instance cần lấy là synchronous, `getIt.getAsync<T>()` với trường hợp là asynchronous

## Giải quyết dependency

Có những trường hợp object A cần cung cấp object B mới có thể hoạt động (A depends on B), vậy thì chúng ta sẽ phải làm như nào?

#### Factory/singleton A phụ thuộc vào factory/singleton B

```dart
class A {
    final B b;
    
    const A(this.b);
}

class B {

}
```



```dart
// đăng kí B trước tiên
getIt.registerSingleton<B>(B());

getIt.registerFactory<A>(() {
    // lấy object B bên trên...
    final b = getIt.get<B>();
    
    // ...truyền vào constructor của A
    return A(b);
});
```



#### Factory/singleton A phụ thuộc vào asynchronous factory/singleton B

Lúc này phải chuyển hàm khởi tạo A thành asynchronous chứ không còn dùng được synchronous nữa, cụ thể là phải dùng:

- `registerFactoryAsync` thay vì `registerFactory`
- `registerSingletonAsync` thay vì `registerSingleton`

```dart
class A {
    final B b;
    
    const A(this.b);
}

class B {
    static Future<B> createAsync() {
        // ... khởi tạo B
    }
}
```



```dart
// đăng kí B trước tiên
getIt.registerSingletonAsync<B>(() => B.createAsync());

getIt.registerFactoryAsync<A>(() async {
    // chờ và lấy object B bên trên...
    final b = await getIt.getAsync<B>();
    
    // ...truyền vào constructor của A
    return A(b);
});
```



#### Asynchronous factory/singleton A phụ thuộc vào factory/singleton B

Phần này cũng khá giống với `Factory/singleton A phụ thuộc vào factory/singleton B`

```dart
class A {
    final B b;
    
    const A(this.b);
    
    static Future<A> createAsync(B b) {
        // ... khởi tạo A
    }
}

class B {

}
```



```dart
// đăng kí B trước tiên
getIt.registerSingleton<B>(B())

getIt.registerFactoryAsync<A>(() async {
    // lấy object B bên trên...
    final b = getIt.get<B>();
    
    // ...truyền vào hàm khởi tạo của A
    return await A.createAsync(b);
});
```



#### Asynchronous factory/singleton A phụ thuộc vào asynchronous factory/singleton B

Phần này cũng khá giống với `Factory/singleton A phụ thuộc vào asynchronous factory/singleton B`

```dart
class A {
    final B b;
    
    const A(this.b);
    
    static Future<A> createAsync(B b) {
        // ... khởi tạo A
    }
}

class B {
    static Future<B> createAsync() {
        // ... khởi tạo B
    }
}
```



```dart
// đăng kí B trước tiên
getIt.registerSingletonAsync<B>(() => B.createAsync())

getIt.registerFactoryAsync<A>(() async {
    // lấy object B bên trên...
    final b = await getIt.getAsync<B>();

    // ...truyền vào hàm khởi tạo của A
    return await A.createAsync(b);
});
```



## Truyền params vào factory

Với một số trường hợp, bạn muốn truyền tham số vào constructor khi khởi tạo object, ví dụ như `User(age: 12, name: 'Kevin')`, `get_it` cũng cho phép bạn truyền param với số lượng tối đa là 2 params.

```dart
class User {
    final int age;
    final String name;
    
    const User({this.age, this.name});
}
```



```dart
// Khởi tạo
getIt.registerFactoryParam<User, int, String>((age, name) => User(age: age, name: name));
```



```dart
// Sử dụng
getIt.get<User>(param1: 5, param2: 'Kevin');
```



Nếu bạn muốn truyền nhiều hơn 2 params, có thể tạo một class đại diện cho các params và truyền vào như một param bình thường:

```dart
class UserParams {
    final int age;
    final String name;
    final String address;
    
    const UserParams({this.age, this.name, this.address});
}

class User {
    final int age;
    final String name;
    final String address;
  
    const User({this.age, this.name, this.address});
  
    User.withParams(UserParams params) : this(age: params.age, name: params.name, address: params.address);
}
```



```dart
// Khởi tạo
getIt.registerFactoryParam<User, UserParams>((params) => User.withParams(params));
```



```dart
// Sử dụng
getIt.get<User>(param1: UserParams(age: 5, name: 'Kevin', address: 'Hanoi'));
```



## Tự động đăng kí dependency với `injectable`

Mình đã từng code Java Spring và thấy cơ chế inject dependency của nó khá hay, chỉ cần thêm annotation trên đầu class cần inject và nó sẽ tự động tìm và inject luôn cho mình chứ không phải declare ra như bên trên.

Thật may là với `build_runner` và `injectable`, chúng ta có thể hoàn toàn tự động được công việc nhàm chán này.

#### Cài đặt

Đầu tiên chúng ta cần thêm vào `pubspec.yaml`, chạy `flutter packages get` để cài đặt.

```yaml
dependencies:
    ...
    injectable: ^1.0.4

dev_dependencies:
    ...
    injectable_generator: ^1.0.4
    build_runner: ^1.10.2
```



Bây giờ hãy mở file `injection.dart`, sửa lại thành như sau:

```dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => await $initGetIt(getIt);
```



Bạn sẽ thấy báo lỗi ở `import 'injection.config.dart';` và `$initGetIt`. Đừng lo, hãy mở terminal lên, cd đến project và chạy lệnh sau:

```
flutter packages pub run build_runner build
```

Sau khi terminal chạy hoàn tất, bạn sẽ thấy có một file mới tên `injection.g.dart` tạo bởi `injectable`, nằm cùng vị trí với `injection.dart` và lỗi bên trên cũng đã hết. Vậy là chúng ta đã setup xong.

#### Sử dụng

Giờ thì thay vì chúng ta viết mọi thứ ở trong `configureDependencies()`, hãy tạm quên nó đi và chuyển qua object bạn cần khởi tạo.

Giả sử mình có 2 class A và B, mình muốn thêm nó vào DI dưới dạng factory, A phụ thuộc vào B thì mình chỉ cần import và thêm annotation `@injectable` phía trên 2 class đó:

```dart
import 'package:injectable/injectable.dart';

@injectable
class A {
    final B b;
    
    const A(this.b);
}

@injectable
class B {

}
```



Bạn chạy lại lệnh `flutter packages pub run build_runner build` và mở file `injection.config.dart` lên xem, nếu nó trông tương tự như này tức là chúng ta đã thành công rồi đó ![😄](https://twemoji.maxcdn.com/2/72x72/1f604.png)

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'models.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<B>(() => B());
  gh.factory<A>(() => A(get<B>()));
  return get;
}
```



Trong quá trình code, chúng ta có thể thay lệnh `flutter packages pub run build_runner build` bằng `flutter packages pub run build_runner watch`, và chỉ việc save lại file là `injectable` sẽ tự build lại file cho bạn luôn.

Tất nhiên ngoài factory ra, chúng ta cũng có thể dùng singleton và lazy-singleton bằng các annotation `@singleton` và `@lazySingleton`.

Với asynchronous factory bạn có thể dùng `@injectable` trên class và `@factoryMethod` trên hàm khởi tạo như sau:

```dart
import 'package:injectable/injectable.dart';

@injectable
class A {
    @factoryMethod
    static Future<A> createAsync() {
        ...
    }
}
```



`injectable` còn giúp chúng ta tách các dependency theo các môi trường khác nhau để sử dụng, dễ dàng viết unit test, mock data,... Ví dụ như bạn có thể tạo riêng `DevRepository` với dev url, config riêng so với `StgRepository` hay `ProdRepository` để tránh việc dev nhầm môi trường, hay `TestRepository` gồm các sample data để tiện cho việc mock, unit test.

Vì bài này khá dài rồi nên tính năng này và các tính năng nâng cao khác bạn hãy tham khảo document của `injectable` để tìm hiểu thêm nhé, rất hay đó



** Tham khảo tài liệu tại viblo.asia



# Làm việc với Listview & cách truyền data vào listview widget

Nếu bạn muốn có một giải pháp để hiển thị một danh sách các Widget và thậm chí có thể cuộn được theo chiều ngang hay dọc thì ListView chính là một lựa chọn vô cùng hiệu quả.

Dưới đây là một số cách để xây dựng một ListView:

## Sử dụng List<Widget> cho thuộc tính children

Đây là cách xây dựng dựng mặc định của một ListView. Bằng cách xây dựng từng Widget cụ thể và đặt trong children của ListView, các Widget sẽ được hiển thị lần lượt theo trên giao diện người dùng.

Cách xây dựng này phù hợp với việc hiển thị một số lượng ít các Widget vì việc xây dựng một List yêu cầu cần phải làm việc với tất cả các thành phần con có thể được hiển thị kể cả khi các Widget chưa hiển thị lên màn hình.

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04112814/image-8.png?resize=746%2C549&ssl=1)

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04112642/image-7.png?resize=484%2C238&ssl=1)

## Sử dụng ListView.builder

Đây là cách xây dựng ListView được áp dụng cho trường hợp cần hiển thị một lượng lớn (hay vô hạn) các Widget con vì builder chỉ được gọi cho những Widget thực sự được hiển thị lên màn hình.

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04122108/image-9.png?resize=769%2C48&ssl=1)Giả sử ta có một mảng dữ liệu 100 phần tử từ 1 đến 100

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04124135/image-14.png?resize=724%2C289&ssl=1)Ta có thể thay đổi số lượng item được hiển thị qua thuộc tính itemCount

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04123309/image-12.png?resize=487%2C227&ssl=1)

## Sử dụng ListView.separated

Đây là cách xây dựng ListView được áp dụng cho trường hợp khi cần hiển thị một số lượng lớn các Widget con và các Widget dùng để ngăn cách giữa các Widget đó vì builder chỉ được gọi cho những Widget thực sự được hiển thị lên màn hình.

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04122108/image-9.png?resize=769%2C48&ssl=1)Giả sử ta có một mảng dữ liệu 100 phần tử từ 1 đến 100

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04125102/image-15.png?resize=721%2C310&ssl=1)Ta có thể thêm Widget dùng để tách các Widget con qua separatorBuilder

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04125236/image-16.png?resize=484%2C269&ssl=1)

## Sử dụng ListView.custom

Đây là cách xây dựng ListView giúp bạn có thể tùy chỉnh nhiều hơn cho các model con. Ví dụ: một model con tùy chỉnh có thể kiểm soát thuật toán được sử dụng để ước tính kích thước của các mô hình con không thực sự hiển thị.

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04122108/image-9.png?resize=769%2C48&ssl=1)Giả sử ta có một mảng dữ liệu 100 phần tử từ 1 đến 100

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04135202/image-17.png?resize=722%2C304&ssl=1)Sử dụng SliverChildBuilderDelegate để xây dựng Widget con

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04135416/image-18.png?resize=475%2C223&ssl=1)

## Một số thuộc tính thường được sử dụng

### padding

ListView có khoảng cách với Widget cha. Ví dụ: padding: const EdgeInsets.all(8).

### scrollDirection

Thuộc tính scrollDirection xác định hướng cuộn của ListView, mặc định của ListView sẽ là vertical. Ví dụ: scrollDirection: Axis.horizontal.

### reverse

ListView sẽ được hiển thị ngược chiều, đây là thuộc tính có kiểu bool, mặc định là false.

### physics

Thuộc tính physics giúp bạn cài đặt ListView được cuộn như thế nào. Ví dụ: physics: const NeverScrollableScrollPhysics(),

## Tài liệu tham khảo

ListView class trong Flutter: [ListView class – widgets library – Dart API](flutter.dev)

### 

# Làm việc với ListTile Widget

Sử dụng `ListTile`, một widget giống `Row` từ thư viện `Material`, để dễ dàng tạo một hàng chứa tối đa 3 dòng văn bản và các biểu tượng đầu và cuối tùy chọn. `ListTile` được sử dụng phổ biến nhất trong `Card` hoặc `ListView`, nhưng có thể được sử dụng ở những nơi khác.

#### Tóm tắt (ListTile)

- Một widget giống `Row` chứa tối đa 3 dòng văn bản và các biểu tượng tùy chọn
- Ít cấu hình hơn `Row`, nhưng dễ sử dụng hơn
- Từ thư viện `Material`



### Examples (ListTile)

| ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/sF9-JdF_) | Một `Card` bao gồm 3 `ListTiles`.                            |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/6iOQuiWX) | Sử dụng `ListTile` để tạo danh sách gồm 3 button dạng dropdown. |





# Tích hợp thư viện **firebase_core** vào dự án



# Tạo project Firebase:



Điều này là dĩ nhiên rồi không có nó làm sao mà liên kết được =)). Click vào **New project**.

![img](https://images.viblo.asia/5d01a3d3-f7d0-4b14-b8c2-972ee08babdf.png)![img](https://images.viblo.asia/5d01a3d3-f7d0-4b14-b8c2-972ee08babdf.png)

Nhập tên project mới và chọn **continue**.

![img](https://images.viblo.asia/0751489d-1ec0-444b-81d3-458eb4b6a259.png)

Ở phần này anh em có thể enable hoặc không chế độ Analys project của Google và sau đó nhấn chọn **Create project**. Đơn giản phải không anh em, tiếp theo mình sẽ tiến hành thêm Android và iOS vào trong project.



## Thêm Android vào project Firebase:



Anh em chọn vào icon Android để thêm Android vào project Firebase mới tại nhé.

![img](https://images.viblo.asia/8f8335ff-c44f-4379-a42f-aece5a439136.png)

Sau đó điền các thông tin lấy ra từ project Flutter và điền vào thôi.

![img](https://images.viblo.asia/c936f8df-52b9-4708-95f0-ea51b153f3fa.png)

Bao gồm các thông tin về package, SHA1 và nick name của Project sau khi hoàn thành thì click vào Register app. Bước tiếp theo thì anh em sẽ phải tải file google-services.json và import vào trong project Flutter như ảnh bên dưới.

![img](https://images.viblo.asia/7a3a3837-ba2f-44c1-a9cf-077f14f14777.png)

Tiếp đến là cấu hình build.gradle theo hướng dẫn.

![img](https://images.viblo.asia/06cf54b7-8252-482d-986b-49714bf5d74b.png)

Chọn **Next** và **Continue** ở màn hình sau đó, thế là xong phần cấu hình cho Android.



## Thêm iOS vào project Firebase:



Ở bước đầu cũng giống như Android anh em cũng click vào icon iOS thay vì icon Android.

![img](https://images.viblo.asia/69b56806-7229-4336-ba4e-ec9f4f9459ef.png)

Để lấy Bundle id app anh em làm như sau: vào Android studio (nếu đang dùng để code Flutter) chuột phải vào folder iOS và chọn **Flutter** -> **Open moduleinXcode**

![img](https://images.viblo.asia/64684ce7-c125-4b99-9e3f-813e1ffb53f9.png)

Ở Xcode, chọn thư mục Runner ở Root -> trong General, các bạn sẽ tìm thấy bundle identifier, nó chính là bundle id. Sau đó quay lại Firebase console, nhập bundle Id và tìm được -> click **Register app** Tiếp theo tải file GoogleService-Info.plist ở bước kế tiếp.

![img](https://images.viblo.asia/b696881c-74cd-42b6-8824-c9dd1c34c2a9.png)

File tải về phải được bỏ vào thư mục Runner/Runner.

![img](https://images.viblo.asia/2c2a86fa-3820-4aa2-ac54-9cfc26e21a3d.png)

Anh em tiến hành cấu hình như hình trên.

Ở bước add SDK anh em nên build App lên điện thoại để quá trình kết nối giữa iOS và Firebase diễn ra, nếu thành công thì sẽ hiển thị theo bên dưới.

![img](https://images.viblo.asia/b6038e91-1619-4e0f-85c8-61ee209676aa.png)



** Tham khảo tài liệu viblo.asia



# Textfield & Nắm cách sử dụng Textfield

Một widget TextField cho phép thu thập thông tin từ người dùng. Code cho TextField cơ bản đơn giản như:

```dart
TextField()
```



Điều này tạo ra một TextField cơ bản:

![img](https://images.viblo.asia/74e336b6-b43c-4391-94a0-dba7b32be57c.png)

## Lấy thông tin từ TextField

Vì TextField không có ID như trong Android, văn bản không thể được truy xuất theo yêu cầu và thay vào đó phải được lưu trữ trong một biến khi thay đổi hoặc sử dụng bộ điều khiển.

1. Cách dễ nhất để làm điều này là sử dụng phương thức onChanged và lưu trữ giá trị hiện tại trong một biến đơn giản. Đây là mã mẫu cho nó:

```dart
String value = "";
TextField(
  onChanged: (text) {
    value = text;
  },
)
```



1. Cách thứ hai để làm điều này là sử dụng `TextEditingController`. Bộ điều khiển được gắn vào TextField và cũng cho phép chúng tôi nghe và điều khiển văn bản của TextField.

```dart
TextEditingController controller = TextEditingController();
TextField(
  controller: controller,
)
```



Và chúng ta có thể lắng nghe những thay đổi bằng cách sử dụng

```dart
controller.addListener(() {
  // Do something here
});
```



Và nhận hoặc đặt giá trị bằng cách sử dụng

```dart
print(controller.text); // Print current value
controller.text = "Demo Text"; // Set new value
```



## Các Callback khác từ TextField

Tiện ích TextField cũng cung cấp các callback khác như

1. onEditingCompleted
2. onSubmitted

```dart
onEditingComplete: () {},
onSubmitted: (value) {},
```



> Đây là các callback được gọi trên các hành động như khi người dùng nhấp vào nút "Done" button trên bàn phím iOS.

## Làm việc với focus trong TextFields

Có một TextField được `focus` có nghĩa là có một TextField hoạt động và mọi đầu vào từ bàn phím sẽ dẫn đến dữ liệu được nhập vào TextField đã `focus` đó.

### 1. Làm việc với autofocus

Để `autofocus` trên TextField khi tiện ích được tạo, hãy đặt trường `autofocus` thành `true`.

```dart
TextField(
  autofocus: true,
),
```



Điều này đặt focus vào TextField theo mặc định.

![img](https://images.viblo.asia/4815dfa1-1973-4433-a529-ae4ab20161a4.gif)

### 2. Làm việc với các thay đổi focus tùy chỉnh

Điều gì sẽ xảy ra nếu chúng ta muốn thay đổi `focus` theo nhu cầu và không chỉ `autofocus`? Vì chúng ta cần một số cách để `focus` TextField tiếp theo mà chúng ta muốn, chúng ta đính kèm `FocusNode` vào TextField và sử dụng nó để chuyển `focus`.

```dart
// Initialise outside the build method
FocusNode nodeOne = FocusNode();
FocusNode nodeTwo = FocusNode();
// Do this inside the build method
TextField(
  focusNode: nodeOne,
),
TextField(
  focusNode: nodeTwo,
),
RaisedButton(
  onPressed: () {
    FocusScope.of(context).requestFocus(nodeTwo);
  },
  child: Text("Next Field"),
),
```



Chúng ta tạo hai nút `focus` và đính kèm chúng vào TextFields. Khi nhấn nút, chúng tôi sử dụng `FocusScope` để yêu cầu `focus` cho TextField tiếp theo.

![img](https://images.viblo.asia/c705d937-0442-421d-a69b-04eca2ef9745.gif)

## Thay đổi thuộc tính bàn phím cho TextFields

TextField trong Flutter cũng cho phép bạn tùy chỉnh các thuộc tính liên quan đến bàn phím.

### 1. Loại Keyboard

TextField cho phép bạn tùy chỉnh loại bàn phím hiển thị khi TextField được đưa vào tiêu điểm. Chúng tôi thay đổi thuộc tính keyboardType cho điều này.

```dart
TextField(
  keyboardType: TextInputType.number,
),
```



Các loại là:

1. **TextInputType.text** (Normal complete keyboard)
2. **TextInputType.number** (A numerical keyboard)
3. **TextInputType.emailAddress** (Normal keyboard with an “@”)
4. **TextInputType.datetime** (Numerical keyboard with a “/” and “:”)
5. **TextInputType.numberWithOptions** (Numerical keyboard with options to enabled signed and decimal mode)
6. **TextInputType.multiline** (Optimises for multi-line information)

### 2. TextInputAction

Thay đổi `textInputAction` của TextField cho phép bạn thay đổi nút hành động của chính bàn phím. Ví dụ:

```dart
TextField(
  textInputAction: TextInputAction.continueAction,
),
```



Trường hợp này nút "Done" được thay thế bằng nút "Continue".

![img](https://images.viblo.asia/ced2f306-8739-4c28-bca2-f75936ef7930.png)

hoặc:

```dart
TextField(
  textInputAction: TextInputAction.send,
),
```



kết quả:

![img](https://images.viblo.asia/a6653fad-ea5c-4b3a-98e3-fa0efcabc841.png)

### 3. Autocorrect

Bật hoặc tắt tự động sửa cho TextField cụ thể. Sử dụng trường tự động sửa để đặt cái này.

```dart
TextField(
  autocorrect: false,
),
```



Điều này cũng sẽ vô hiệu hóa các đề xuất.

### 4. Text Capitalization

TextField cung cấp một vài tùy chọn về cách viết hoa chữ cái trong đầu vào từ người dùng.

```dart
TextField(
  textCapitalization: TextCapitalization.sentences,
),
```



Các loại là:

**1. TextCapitalization.sentences**

Đây là loại viết hoa bình thường mà chúng tôi mong đợi, chữ cái đầu tiên của mỗi câu được viết hoa.

![img](https://images.viblo.asia/e96377fa-75d6-41a4-8009-a824b170501c.png)

**2. TextCapitalization.characters**

Viết hoa tất cả các ký tự trong câu.

![img](https://images.viblo.asia/47040ba0-96d9-4225-8a51-bc50525861e4.png)

**3. TextCapitalization.words**

Viết hoa chữ cái đầu tiên của mỗi từ.

![img](https://images.viblo.asia/74a58a6a-ef7b-4236-9f17-957c7b3b4ee2.png)

## Tùy chọn kiểu văn bản, căn chỉnh và con trỏ

Flutter cho phép tùy chỉnh liên quan đến kiểu dáng và căn chỉnh văn bản bên trong TextField cũng như con trỏ bên trong TextField.

### Căn chỉnh text bên trong TextField

Sử dụng thuộc tính `textAlign` để điều chỉnh vị trí con trỏ bên trong TextField.

```dart
TextField(
  textAlign: TextAlign.center,
),
```



Điều này khiến con trỏ và văn bản bắt đầu ở giữa TextField.

![img](https://images.viblo.asia/4e866973-2996-4956-b00e-b9125c8623f0.png)

Điều này có các thuộc tính căn chỉnh thông thường: **start, end, left, right, center, justify.**

### Tạo kiểu văn bản bên trong TextField

Chúng ta sử dụng thuộc tính kiểu để thay đổi cách văn bản bên trong TextField. Sử dụng nó để thay đổi màu sắc, kích thước phông chữ, v.v ... Điều này tương tự với thuộc tính kiểu trong tiện ích Văn bản, vì vậy chúng tôi sẽ không mất quá nhiều thời gian để khám phá nó.

```dart
TextField(
  style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300),
),
```



![img](https://images.viblo.asia/73310563-1600-4337-93a3-092673c06bc7.png)

### Thay đổi con trỏ trong TextField

Con trỏ được tùy chỉnh trực tiếp từ tiện ích TextField.

Bạn được phép thay đổi màu con trỏ, chiều rộng và bán kính của các góc. Ví dụ, ở đây tôi tạo một con trỏ màu đỏ hình tròn mà không có lý do rõ ràng.

```dart
TextField(
  cursorColor: Colors.red,
  cursorRadius: Radius.circular(16.0),
  cursorWidth: 16.0,
),
```



![img](https://images.viblo.asia/c102ae0a-3824-4ed6-9d5a-1ebccf5b45ba.png)

## Kiểm soát kích thước và độ dài tối đa trong TextField

TextFields có thể kiểm soát số lượng ký tự tối đa được viết bên trong nó, số lượng dòng tối đa và mở rộng khi văn bản được nhập.

### Kiểm soát ký tự tối đa

```dart
TextField(
  maxLength: 4,
),
```



![img](https://images.viblo.asia/b9cc52ff-4e13-471e-a02c-e27218c6e397.png)

Bằng cách đặt thuộc tính maxLạng, độ dài tối đa được thi hành và bộ đếm được thêm theo mặc định vào TextField.

### Tạo một TextField có thể mở rộng

Đôi khi, chúng ta cần một TextField mở rộng khi một dòng kết thúc. Trong Flutter, nó hơi kỳ lạ (nhưng dễ) để làm. Để làm điều này, chúng tôi đặt `maxLines` thành `null`, theo mặc định là 1. Cài đặt thành `null` không phải là điều mà chúng tôi rất quen thuộc nhưng tuy nhiên nó rất dễ thực hiện.

![img](https://images.viblo.asia/0e714083-95e5-4401-ac10-ab654e7f153f.png)

> Lưu ý: Đặt maxLines thành giá trị trực tiếp sẽ mở rộng nó thành số dòng đó theo mặc định.

![img](https://images.viblo.asia/6ea103aa-7359-4b5b-b86c-981b53e26020.png)

## Văn bản che khuất

Để che khuất văn bản trong TextField, hãy đặt `obscureText` thành `true`. Thuộc tính này dùng cho các TextField nhập password

![img](https://images.viblo.asia/e2e33f76-f38c-403e-8c2e-bedfee6c3da3.png)

## Và cuối cùng, trang trí TextField

Cho đến bây giờ chúng ta tập trung vào các tính năng Flutter cung cấp cho đầu vào. Bây giờ chúng ta sẽ chuyển sang thực sự thiết kế một TextField ưa thích và không nói không với nhà thiết kế của bạn. Để trang trí TextField, chúng ta sử dụng thuộc tính trang trí cần lấy InputDecoration. Vì lớp `InputDecoration` là rất lớn, chúng ta sẽ cố gắng nhanh chóng vượt qua hầu hết các thuộc tính quan trọng.

### Sử dụng các thuộc tính gợi ý và nhãn để cung cấp thông tin cho người dùng

Cả gợi ý và nhãn là các chuỗi giúp người dùng hiểu thông tin được nhập vào TextField. Sự khác biệt là một gợi ý sẽ biến mất khi người dùng bắt đầu nhập trong khi nhãn nổi trên TextField.

![img](https://images.viblo.asia/6fd53de5-1536-4915-a552-e9611cc3c990.png)

Hint

![img](https://images.viblo.asia/06640c3c-8037-4e84-a9a3-71a7921a1a36.png)

Label

### Bạn có thể thêm các “icon”, “prefixIcon” and “suffixIcon”

Bạn có thể thêm các biểu tượng trực tiếp vào TextFields. Bạn cũng có thể sử dụng `prefixText` và hậu tố cho văn bản thay thế.

```dart
TextField(
  decoration: InputDecoration(
    icon: Icon(Icons.print)
  ),
),
```



![img](https://images.viblo.asia/44be28f5-ff58-42c7-bc22-55bbcf73f43b.png)

Icon using the icon property

```dart
TextField(
  decoration: InputDecoration(
    prefixIcon: Icon(Icons.print)
  ),
),
```



![img](https://images.viblo.asia/3126e07b-faa4-4f8d-bca5-09918cd58dd6.png)

Icon using the prefixIcon property

### Tương tự cho bất kỳ widget nào khác, dùng “prefix” thay thế cho “prefixIcon”

Để sử dụng tiện ích chung thay vì biểu tượng, hãy sử dụng trường tiền tố. Một lần nữa, không có lý do rõ ràng, hãy để Thêm một chỉ báo tiến trình vòng tròn trong TextField.

```dart
TextField(
  decoration: InputDecoration(
    prefix: CircularProgressIndicator(),
  ),
), 
```



![img](https://images.viblo.asia/521e5a3a-50bc-48f3-893f-4c3b5d20dd23.png)

### Mỗi thuộc tính như gợi ý, nhãn, v.v đều có các trường kiểu tương ứng

Để tạo kiểu cho một gợi ý, hãy sử dụng một gợi ý. Để tạo kiểu cho nhãn, hãy sử dụng nhãnStyle.

```dart
TextField(
  decoration: InputDecoration(
    hintText: "Demo Text",
    hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.red)
  ),
),
```



![img](https://images.viblo.asia/29c619d9-a9d9-405f-94cc-acb1c869a3ff.png)

> Lưu ý: Mặc dù tôi đã thực hiện nó trong ví dụ này, nhưng nhìn chung không thay đổi màu gợi ý vì nó gây nhầm lẫn cho người dùng.

#### Sử dụng helperText của người dùng nếu bạn không muốn có nhãn nhưng bạn muốn có một thông điệp bền bỉ cho người dùng.

```dart
TextField(
  decoration: InputDecoration(
    helperText: "Hello"
  ),
),
```



![img](https://images.viblo.asia/9263f2a4-a58b-4ef4-9e41-7f574b27dce3.png)

#### Sử dụng “decoration: null” hoặc InputDecoration.collapsed để loại bỏ underline mặc định của TextField

Sử dụng chúng để xóa phần gạch chân mặc định trên TextField.

```dart
TextField(
  decoration: InputDecoration.collapsed(hintText: "")
),
```



![img](https://images.viblo.asia/8685be75-d68a-4bda-8ac6-7a79052c6724.png)

#### Thêm border vào TextField

```dart
TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder()
  )
),
```



![img](https://images.viblo.asia/1a773677-317c-421e-81f2-07ee5b812acf.png)

Có một số lượng lớn trang trí bạn có thể làm hơn nữa, nhưng chúng ta có thể đi sâu vào mọi thứ trong một bài viết. Nhưng tôi hy vọng điều này làm cho nó rõ ràng để hiểu cách dễ dàng tùy chỉnh Flutter TextFields.



** tham khảo tài liệu tại viblo.asia

