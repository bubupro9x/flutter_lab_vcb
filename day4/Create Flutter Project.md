# Create Flutter Project

1. Vào **File** -> **New** -> **New Flutter Project** (nó ở dòng thứ 2) -> Chọn cái đầu tiên là **Flutter Application** ->  , chúng ta sẽ được một bảng tùy chọn như này :

![img](https://images.viblo.asia/a28294f5-0001-4d42-ad15-56b2ca0bec3a.png)

Cần phải lưu ý ở chỗ **Flutter SDK path** , các bạn nhớ úc nãy chúng ta đã download file SDK và giải nén nó. Đây là lúc cần dùng, hãy chọn icon [...] và trỏ tới SDK flutter mà chúng ta đã giải nén lúc nãy. Những field còn lại thì tự field theo ý mình thôi.

Và như vậy là đã set up xong, chúng ta cùng bắt đầu viết một project nào !

## 2. Build ứng dụng Flutter đầu tiên : Hello world

Sau khi hoàn thành xong mục 1, ở file main.dart, chúng ta sẽ thấy các line code sample của google, thôi thì tranh thủ chạy thử xem họ code những gì nào. Nhìn trên tool bar thì chúng ta sẽ thấy được một giao diện như sau:

![img](https://images.viblo.asia/341498fa-52aa-46f7-9586-99bd2757f2fe.png)

Nếu đã quen với Android studio thì có thể nhanh chóng hiểu các tác dụng của những option này, từ trái qua phải lần lượt sẽ là các chức năng cần chú ý :

- Target selector: Chọn device để chạy
- Config selector: Chọn file chứa cofig code để chạy
- Run, Debug
- Hot reload: khi có chỉnh sửa bất cứ điều gì trong code, chúng ta có thể dùng Hot-reload để update những thay đổi mà không cần phải chạy là toàn bộ ứng dụng tốn thời gian, ngoài ra dùng Hot-reload thì những thao tác trên ứng dụng vẫn được dữ lại.
- Stop : Dừng ứng dụng đang chạy.

Ok. thử chạy code sample mà Google đã viết sẵn thôi, nhìn qua máy ảo chúng ta sẽ được một giao diện như này:

![img](https://images.viblo.asia/fc99fa36-930e-4fbd-9e0d-2ee2dbc2e0b1.png)

Nhìn sample code khá khó hiểu phải không? xóa nó đi và viết thử chương trình "Hello world" đã đi vào huyền thoại trước đã (yaoming). Xóa hết code ở main.dart và thay thế bằng đoạn code dưới đây.

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
```



Chạy lên và chúng ta sẽ được giao diện như thế này :![img](https://images.viblo.asia/6b0ba8b0-6bba-45d7-b0b1-33fd24f43538.png)

### Phân tích :

- Đầu tiên, chúng ta cần phải làm quen với một khái niệm mới được sử dụng trong Flutter, đó là **Widget** . Ý tưởng chính của Widget là xây dựng lên những giao diện chúng ta nhìn thấy thông qua các trạng thái, cấu hình mà nó định nghĩa. Có vẻ hơi rối đúng không? Như chúng ta thấy ở trên đoạn code `child: Text('Hello World')` , `Text` ở đây chính là một Widget, trong này nó định nghĩa ra một string `'Hello World'` mà chúng ta có thể nhìn thấy. Như ở trong android native thì một Widget tương tự như là một View.

- method **main()** : Đây là nơi bắt đầu của ứng dụng, nơi thực thi tất cả những gì được tạo ra như method, biến, hàm ... Chắc các bạn cũng khá quen với method này rồi. Nó sử dụng ký hiệu arrow (=>). Sử dụng ký hiệu mũi tên cho các hàm hoặc phương thức một dòng. Sau dấu (=>) là những gì method main chạy và trả về .

- Trong example trên

   

  ```dart
  MyApp
  ```

   

  đang kế thừa từ

   

  ```dart
  StatelessWidget
  ```

  , biến bản thân MyApp thành một Widget. Trong Flutter thì hầu như tất cả mọi thứ đều là Widget, bao gồm cả alignment, padding, và layout.

  - `StatelessWidget` là widget không có state. Nó không chấp nhận sự thay đổi bên trong nó. Còn đối với sự thay đổi từ bên ngoài (widget cha) thì nó sẽ thụ động thay đổi theo. Nó chỉ đơn thuần là nhận dữ liệu vào và hiển thị, chúng ta không thể thay đổi bất cứ điều gì, muốn tạo một variable cũng phải là final (ko được thay đổi). Bản thân nó cũng không có hàm createState mà thay vào đó là hàm build(BuildContext)

- `MaterialApp` là điểm khởi đầu của ứng dụng, nó cho Flutter biết rằng chúng ta sẽ sử dụng các thành phần Material và tuân theo thiết kế material design trong ứng dụng của mình. Các định nghĩa ở đây bao gồm màu sắc chủ đạo, dartThem, locale, navigation...

- `Scaffold` cho phép chúng ta triển khai các widget ứng dụng chuẩn material mà hầu hết các ứng dụng đều có. Chẳng hạn như AppBar, BottomAppBar, FloatingActionButton, BottomSheet, Drawer, Snackbar. Scaffold được thiết kế để trở thành vùng chứa cấp cao nhất cho MaterialApp mặc dù không cần thiết phải lồng một Scaffold.

- `Center` : như cái tên, nó đưa mọi thứ nằm bên trong nó vào giữa màn hình.

- `Text` : Hiển thị text, chúng ta có thể thêm slyle cho text này với thuộc tính `TextStyle` .

- Và cuối cùng khi lồng các Widget với nhau hãy chú ý cần phải khai báo đúng những params cho nó với các định nghĩa param như : `title:`, `body:`, ... tương ứng. Sẽ có lỗi compiler nếu thiếu những định nghĩa này.

Đây mới chỉ là những Widget căn bản. Còn rất nhiều Widget mà chúng ta sẽ học trong qua trình build một dự án, mình sẽ không liệt kê toàn bộ chúng mà sẽ giải thích qua nhứng áp dụng thực tế vào code như trên.



** Tham khảo https://flutter.dev/docs