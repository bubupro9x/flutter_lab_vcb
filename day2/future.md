# Tìm hiểu về lập trình bất đồng bộ trong Dart/Flutter

Bài viết được dịch và viết lại từ ngữ cho dễ hiểu từ nguồn bài gốc: [Exploring Asynchronous Programming In Dart & Flutter](https://medium.com/flutterdevs/exploring-asynchronous-programming-in-dart-flutter-25f341af32f)

### Asynchronous Programming (Lập trình bất đồng bộ):

Lập trình bất đồng bộ (**Asynchronous Programming**) giúp bạn có thể thực hiện nhiều action trong cùng 1 lúc mà không cần theo tuần tự (xem hình phía dưới). Lập trình đồng bộ (**Synchronous Programming**) mất khoảng thời gian lâu hơn để ứng dụng phản hồi kết quả. Tuy nhiên, việc lập trình bất đồng bộ cũng có một số đánh đổi, đặc biệt là phần hiệu năng ứng dụng. Do đó, chúng ta không nên sử dụng lập trình bất đồng bộ trong tất cả các trường hợp.

![img](https://200lab-blog.imgix.net/2021/07/image-111.png)

Mặc dù Dart chạy single-threaded, nhưng nó có thể kết hợp với các code khác trong các thread chạy song song, riêng biệt.

### Tại sao chúng ta nên sử dụng lập trình bất đồng bộ

Cải thiện hiệu năng: Một trong những lí do lớn nhất mà chúng ta cần căn nhắc sử dụng lập trình bất đồng bộ. Trường hợp chúng ta cần tính toán và xử lý mà không phải chặn việc running app hiện tại. Trong trường hợp này nếu sử dụng lập trình bất đồng bộ, bạn có thể thực hiện công việc khác và ngồi đợi tác vụ đó hoàn thành.

Code clean hơn: Hãy nhiều qua các ngôn ngữ khác mà xem. Việc bạn muốn làm việc với bất đồng bộ, bạn phải tự tạo thread riêng theo tiêu chuẩn được đặt ra.

### Future

Future trong dart có 2 trạng thái. `Uncompleted` và `Completed`. `Completed Future` sẽ cho chúng ta giá trị trả về hoặc lỗi xảy ra. Với `Uncompleted Future`, nó là trạng thái chờ đợi hoạt động bất đồng bộ của hàm sẽ hoàn thành hoặc xảy ra lỗi.

### Future với async và await

Hàm bất đồng bộ được đánh dấu bằng từ khoá  **async**

Để chờ 1 hàm bất đồng bộ, ta có thể sử dụng từ khoá `**await**`, tuy nhiên `**await**` phải đặt trong function được khai báo với từ khoá **async**.

```dart
void main(List<String> args) {
 test();
}
void test() async {
 Future<String> testAsync() async {
   await Future.delayed(const Duration(seconds: 3)); // sẽ chờ 3s trước khi chạy phương thức tiếp theo
   return "testAsync has been done!";
}

 print("begin");
 await testAsync(); // sẽ chờ testAsync thực thi xong mới thực thi phương thức tiếp theo
 print("end");
}

```

### Lấy dữ liệu trả về từ Future

Có thể sử dụng `await` hoặc`Future.then`, để lấy kết quả khi Future hoàn thành.

```dart
String result = await testAsync(); // use await

String result;
 await testAsync().then((value) => result = value); // use then
```

### Xử lý lỗi trong Future

Có thể sử dụng try catch bọc ngoài Future, hoặc sử dụng `Future.catchError`, `Future.onError`**onError** trong then sẽ được ưu tiên xử lý lỗi từ Future.Nếu không dùng **onError**, **catchError** sẽ xử lý toàn bộ lỗi.Nếu dùng **onError**, **catchError** sẽ xử lý lỗi trong **onError**.

```dart
Future<String> testAsync() async {
   int.parse("source");
   await Future.delayed(const Duration(
       seconds: 3)); // sẽ chờ 3s trước khi chạy phương thức tiếp theo
   return "testAsync has been done!";
 }

 print("begin");
 await testAsync().then((value) => null, onError: (error) {
   print("onError -> $error");
   throw Exception("from onError");
 }).catchError((catchError) {
   print("catchError -> $catchError");// catchError sẽ bắt được exception
 }).whenComplete(() => print('onCompleted'));
 // sẽ chờ testAsync thực thi xong mới thực thi phương thức tiếp theo
 print("end");


```

### **Future.foreach**

Cách thức hoạt động khá đơn giản: for từng phần tử và thực thi future.Future.foreach trả về `null` sau khi hoàn thành.

```dart
Future delayed(int second) async {
  await Future.delayed(Duration(seconds: second));
  return second;
}

List<int> steps = [1, 2, 3, 4, 5];
 var result = await Future.forEach<int>(steps, (step) async {
   print("current step: $step");

   /// in ra step và chờ `step` second trước khi tiếp tục print
   return await delayed(step);
 });

 print("result -> $result"); // result -> null


```

### **Future.wait**

Future.wait sẽ thực thi 1 list future, và trả về 1 list object tương ứngCó trả về kết quả khi hoàn thành, tuỳ trường hợp mà ta nên áp dụng `Future.foreach` hay `Future.wait`.

```dart
Future delayed(int second) async {
   await Future.delayed(Duration(seconds: second));
   return second;
 }

Future noDelay() async { return true; }

List result = await Future.wait([
   delayed(1), delayed(2), delayed(3),
   noDelay(), noDelay(),
 ]);

print("result -> $result"); // result -> [1, 2, 3, true, true]


```

### **Future.timeout**

Giới hạn thời gian 1 Future được hoạt động.Cũng giống Future.**onError**. Nếu truyền vào Future.**onTimeout** thì sẽ ưu tiên xử lý lỗi tại **onTimeout**(). Nếu **onTimeout** có lỗi sẽ xử lý exception tại **catchError**

```dart
Future delayed(int second) async {
   await Future.delayed(Duration(seconds: second));
   return second;
 }

var result = await
     delayed(10).timeout(const Duration(seconds: 2)).catchError((error) {
   return error.toString();
 });
 print("result -> $result"); // sẽ in ra: result -> TimeoutException after 0:00:02.000000: Future not completed


```

```dart
var result =
     await delayed(10).timeout(const Duration(seconds: 2), onTimeout: () {
   return "onTimeout";
 }).catchError((error) {
   return error.toString();
 });
 print(
     "result -> $result"); // sẽ in ra: result -> onTimeout

```

### Future.whenComplete

Cũng giống như finally, Future.whenComplete() luôn được gọi kể cả Future timeout, error….

```dart
Future delayed(int second) async {
   await Future.delayed(Duration(seconds: second));
   return second;
 }

var result =
     await delayed(2).whenComplete(() => print("Future has been completed!"));
print("result -> $result"); // will print 2


```



