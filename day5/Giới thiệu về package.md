# Giới thiệu về package

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



# Packages versioning

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