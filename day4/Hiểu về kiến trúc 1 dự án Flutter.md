# Hiểu về kiến trúc 1 dự án Flutter

Chúng ta sẽ bắt đầu với việc xem qua các thành phần có trong một dự án mặc định của Flutter khi ta tạo project.

![img](https://miro.medium.com/max/592/1*-Tq9GX6lK4dfO04rNOTodQ.png)



## Những thư mục chúng ta không cần quan tâm

### .dart_tool folder

![img](https://miro.medium.com/max/360/1*O0X6_S43ytFvtAaOPok20w.png)

Thư mục này chứa các tệp được sử dụng bởi các công cụ Dart.

### .metadata file

Tệp được kiểm soát bởi công cụ Flutter và không nên được chỉnh sửa theo cách thủ công.

### .packages file

File này chứa thông tin về các gói được sử dụng trong dự án. Chúng ta không thể làm gì với tệp này. Từ sau Dart 2.17 thì chúng ta có thể gỡ bỏ file này. Thường mình sẽ xóa file này để clear cache, tránh việc đã pull lib mới về rồi nhưng project vẫn nhận lib cũ.

### dummy.iml

Tệp này được quản lý bởi Flutter SDK và bạn không nên chỉnh sửa nó theo cách thủ công. Tên luôn khớp với tên dự án của bạn trong quá trình tạo ban đầu.

## Những folder, file mà chúng ta cần quan tâm

### android folder

![img](https://miro.medium.com/max/388/1*xTAwJXqzsujqKeVabyj-Hg.png)

Thư mục này chứa tất cả dữ liệu có liên quan để biên dịch và tạo một ứng dụng Android đang hoạt động (apk hoặc appbundle). Có hai tệp mà bạn có nhiều khả năng sẽ cần chỉnh sửa trong quá trình phát triển:

`build.gradle` trong `android / app` Nó chứa `applicationId` được yêu cầu khi gửi lên Google Play Store. Đảm bảo rằng giá trị này khớp với giá trị bạn chỉ định trong Google Play Console trước khi tải ứng dụng của bạn lên.
Ngoài ra cũng có một tệp `build.gradle` khác trong thư mục con `android`.

`AndroidManifest.xml` trong `android / app / src / main` Tại đây bạn có thể chỉ định ý định hoặc khả năng mà ứng dụng của bạn sẽ sử dụng. Khi sử dụng các gói của bên thứ 3, hướng dẫn cài đặt của họ thường bao gồm thông tin chi tiết về những gì cần được thêm vào đây. Ví dụ `permission` 

Ngoải ra nếu chúng ta cần triển khai `methodChannel` thì chúng ta sẽ viết ở dưới tầng Android này để tạo giao thức trao đổi thông tin giữa tầng Flutter và native.

### build folder

Thư mục `build` sẽ được tạo khi Flutter được thực thi lần đầu tiên. Nó chứa các tệp được tạo cần thiết để chạy ứng dụng trên các nền tảng khác nhau. Mỗi nền tảng có thư mục con riêng của nó.

Tại đây bạn cũng có thể tìm thấy file `apk` của mình khi bạn run dự án.

### ios folder

![img](https://miro.medium.com/max/432/1*5Lt1TxHbcOTQdYhRDhOyaw.png)

Tương tự với thư mục android nhưng dành cho các tệp liên quan đến ios. Các tệp bạn có nhiều khả năng sẽ chỉnh sửa là:

 `AppDelegate.swift` trong `ios / Runner` Điểm vào ứng dụng ios. Các gói của bên thứ 3 có thể cần phải thêm một số logic khởi tạo ở đây. Bạn cũng có thể kiểm tra tài liệu hướng dẫn tích hợp của họ để biết cách triển khai ở đây

`Info.plist` trong `ios / Runner` Chứa tất cả các cài đặt liên quan đến ứng dụng. Các tính năng và khả năng bổ sung có thể yêu cầu mục nhập mới trong tệp này.

### lib folder

![img](https://miro.medium.com/max/222/1*cr511zMP-T1cJ23HD9ESQw.png)

Thư mục lib là nơi chứa mã ứng dụng của bạn. Và chúng ta sẽ làm việc với anh bạn `lib` này nhiều. Chúng ta sẽ triển khai mã nguồn của dự án tại đây.

### test folder

Đây là thư mực chứa các file để chúng ta viết test. Các file test ở đây đều có hậu tố trong tên là `_test.dart`.

### .gitignore file

Chứa thông tin về những tệp và thư mục nào sẽ được loại trừ khỏi kiểm tra phiên bản với git. Ngoài ra, bạn có thể muốn thêm bất kỳ khóa API nào mà ứng dụng của bạn sẽ sử dụng để chúng không bị lộ trong kho lưu trữ công khai.

### analysis_options.yaml file

Ở đây chúng ta sẽ có thể thêm hoặc loại bỏ một số analysis trong dự án của mình. Bạn có thể xem kĩ hơn [tại đây](https://dart.dev/guides/language/analysis-options)

### pubspec.yaml

Pubspec chứa mô tả dự án, khai báo `assets`, `font`, cách `libs` bên thứ 3 mà bận muốn sử dụng. Tất cả các gói bên thứ 3 của bạn sẽ được xác định ở đây để các công cụ Flutter biết phiên bản nào và tải nó về. Bạn có thể tìm thêm thông tin về pubspec.yaml trong [bài viết dưới đây](https://xeladu.medium.com/the-flutter-pubspec-yaml-in-detail-eee5729d9df7).



## main.dart

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Flutter Application',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application.
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Text('Hello World - Vietcombank'),
      ),
    );
  }
}
```

Để bắt đầu với việc thiết kế giao diện, trước tiên bạn cần import một số thư viện liên quan tới giao diện. Ở đây, chúng ta đã import một **Material package** . Package này cho phép bạn tạo giao diện người dùng theo ngôn ngữ thiết kế Material design do Android chỉ định.

Dòng thứ hai là một điểm chạy đầu tiên của các ứng dụng Flutter tương tự như phương thức main trong các ngôn ngữ lập trình khác. Nó gọi hàm **runApp** và chuyển cho nó một đối tượng của **MyApp** Mục đích chính của hàm này là để bạn chạy màn hình nào đó đầu tiên.

Dòng 5 đến 18 là một `widget` được sử dụng để tạo giao diện người dùng. Ở đây, `StatelessWidget` không duy trì bất kỳ trạng thái nào của widget. Class `MyApp` kế thừa `StatelessWidget` và ghi đè phương thức `build` của nó Phương pháp `build` được sử dụng để tạo một phần giao diện người dùng của ứng dụng. Trong khối lệnh này, phương thức `build`  sử dụng `MaterialApp`, một widget cung cấp cho lập trình viên một bộ khung trong quá trình phát triển ứng dụng như `title`, `theme`, `home`,... Mỗi ứng dụng Flutter chỉ nên chứa 1 `MaterialApp`.

Dòng 20-36, class `MyHomePage` cũng tương tự như `MyApp`, ngoại trừ nó sẽ được return về một widget là `Scaffold`. Scaffold Widget cũng là một widget được sử dụng nhiều nhất. Nó cung cấp cho lập trình viên một bộ khung chứa sẵn các thuộc tính quan trong để xây dựng giao diện 1 màn hình như `appBar`, `body`,.. . `AppBar` hiển thị tiêu đề của ứng dụng và thuộc tính `body` hiển thị nội dung thực của ứng dụng. Ở đây dễ thấy, `appBar` đang được định danh là một đối tượng `AppBar` có thuộc tính `title` chính là một `Text` widget. Tương tự với thuộc tính `body` đang được truyền vào là một `Center` widget có thuộc tính `child` là một `Text` widget.

