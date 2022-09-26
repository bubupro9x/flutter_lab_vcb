# Stream

![img](https://lh4.googleusercontent.com/oBO11Plo3kjNkbl5XruKerEaHGmSNmgsGUqWCFh8jfaGxGQsqrMMpY0aygF9Ye0-zfHYTZjxOpU1jvuSmSemohtdJGuR_OJqunedkMmisw2v8bEeEQ9mxs3WEFZ9NOX7ujEgu0DuPYNWUlwEM0FizYEGazOopbzRdPFha9j732ziCM1xp4ClLAvHVr96=nw)

**Stream** hiểu đơn giản là một chuỗi các **events** bất đồng bộ.

Ở hình ảnh bên, **Stream** hiểu đơn giản chính là cái băng truyền kia, thứ để trung chuyển hàng hoá (events).

Những thứ đang trượt trên băng truyền kia chính là các **events**.

Event có thể là một data (kiểu dữ liệu bất kì), cũng có thể là một error, hoặc một trạng thái done

**Stream** có 2 loại:

- Single - Subscription Stream: chỉ có thể được listen 1 lần
- Broadcast Streams: có thể được listen nhiều lần

Nếu 1 Single Stream mà listen nhiều hơn 1 lần sẽ báo lỗi “**Bad state: Stream has already been listened to**”

## **Khởi tạo Stream với value**

- **.value()** sẽ tạo ra 1 stream với giá trị mặc định.
- Khi sử dụng .listen() sẽ nhận được callback thay đổi của giá trị mặc định này.
- **.listen()** chỉ có thể gọi 1 lần, nếu muốn .listen() nhiều stream, cần sử dụng StreamController.
- Áp dụng cho các trường hợp có giá trị khởi tạo ban đầu.

## **Khởi tạo empty Stream**

```dart
Stream stream1 = const Stream.empty();
 stream1.listen((event){
   print("onEvent -> $event");// sẽ chưa in ra gì, chỉ chạy trong tương lai, khi có event được add(emit) vào
 });
```

**.empty()** sẽ tạo ra 1 stream không có giá trị mặc định. Áp dụng cho các trường hợp không có giá trị khởi tạo ban đầu.

## **Khởi tạo Stream từ 1 Future**

**.fromFuture()** sẽ tạo ra 1 stream từ 1 Future. Event sẽ được add (emit) vào mỗi khi 1 future complete. Event có thể là data, error…

```dart
Future testDelayed()async{
   await Future.delayed(const Duration(seconds: 3));
   return 10;
 }

 Stream stream2 =
     Stream.fromFuture(testDelayed());
 stream2.listen((event) {
   print("onEvent -> $event"); // sau khi Future complete (chờ 3s) sẽ in ra: onEvent -> 10
 });
```

## **Khởi tạo Stream từ nhiều Future**

```dart
Future testDelayed(int second)async{
   await Future.delayed(Duration(seconds: second));
   return second;
 }

 Iterable<Future> futures = [testDelayed(1), testDelayed(2), testDelayed(3)];
 Stream stream3 = Stream.fromFutures(futures);
 stream3.listen((event) {
   print("onEvent -> $event");
   /*
     Sau 1s sẽ chạy xong testDelayed(1) và in ra: onEvent -> 1
     Sau 2s sẽ chạy xong testDelayed(2) và in ra: onEvent -> 2
     Sau 3s sẽ chạy xong testDelayed(3) và in ra: onEvent -> 3
   */
 });
```

**.fromFutures()** sẽ tạo ra 1 stream từ nhiều Future. Các event sẽ được add (emit) vào mỗi khi 1 future complete. Event có thể là data, error…

## **Khởi tạo Stream từ 1 Stream khác**

```dart
Stream sourceStream = Stream.periodic(const Duration(seconds: 1), (i) {
     print("i -> $i");
     return i;
});

Stream s = Stream.castFrom(sourceStream);
   s.listen((event) {
     print("onEvent -> $event");
});
```

**.castFrom()** sẽ tạo ra 1 stream từ 1 Stream khác. 

> Chú ý: Stream gốc phải chưa gọi listen().

----

# StreamSubscription

Khi sử dụng `stream.listen` sẽ trả về 1 `instance` của `StreamSubscription`. `StreamSubscription` có các phương thức để điều khiển các events ra, vào stream như:

- onError()
- onData()
- onDone
- pause()
- resume()

## **StreamSubscription.pause(), .resume()**

```dart
Stream stream = Stream.periodic(const Duration(seconds: 1), (i) {
   print("after $i (s)");
   return i;
 });

 late StreamSubscription subscription;
 subscription = stream.listen((event) async {
   print("onEvent -> $event");
   if (event == 3) {
     subscription.pause(); // sẽ dừng lại, không listen nữa
     await Future.delayed(const Duration(seconds: 3));
     subscription.resume(); // sẽ tiếp tục listen
   }
 });
```

**.pause()** sẽ tạm ngưng việc listen các events**. **

**resume()** sẽ tiếp tục việc listen các events.



> Các events sẽ không được push tới hàm onListen() nếu không truyền **resumeSignal**

```dart
StreamController streamController = StreamController();
 StreamSubscription streamSubscription = streamController.stream.listen((event) {
   print("stream onListen: $event");
 });
 streamController.add("event"); // StreamController sẽ giới thiệu ở slide sau
 streamController.add("event1"); // sẽ add "event" vào stream

 /// nếu sử dụng streamSubscription.pause() không truyền params resumeSignal,
 /// toàn bộ events đã add trước đó sẽ không được push to listen()
 /// ở đây ngữ cảnh là đã add events vào stream, sau đó mới call .pause()
 streamSubscription.pause();

 streamController.add("1111");
 streamController.add("2222");
```



> Khi truyền **resumeSignal(),** hàm listen() sẽ được gọi khi **resumeSignal()** thực thi xong.Ở ví dụ là sẽ chờ 5s rồi mới print ra các events đã được add.

```dart
StreamController streamController = StreamController();
 StreamSubscription streamSubscription = streamController.stream.listen((event) {
   print("stream onListen: $event");
 });
 streamController.add("event"); // StreamController sẽ giới thiệu ở slide sau
 streamController.add("event1"); // sẽ add "event" vào stream

 /// nếu sử dụng streamSubscription.pause() không truyền params resumeSignal,
 /// toàn bộ events đã add trước đó sẽ không được push to listen()
 /// ở đây ngữ cảnh là đã add events vào stream, sau đó mới call .pause()
 streamSubscription.pause(Future.delayed(const Duration(seconds: 5)));

 streamController.add("1111");
 streamController.add("2222");
```

## **StreamSubscription.onData()**

```dart
Stream stream = Stream.periodic(const Duration(seconds: 1), (i) {
   print("after $i (s)");
   return i;
 });

 late StreamSubscription subscription;
 subscription = stream.listen((event) async {
   print("onEvent -> $event");
 });

 subscription.onData((data) {
   print("onData $data");
 });
```

- Khi sử dụng StreamSubscription.onData(), sẽ thay thế phần onListen() của stream hiện tại.
- Áp dụng cho việc muốn thay đổi phần callback listen event, nhưng không muốn khởi tạo lại 1 stream mới.
- Trong ví dụ bên, chỉ chạy .onData() chứ không chạy .listen()

---

# StreamController

![img](https://lh4.googleusercontent.com/oBO11Plo3kjNkbl5XruKerEaHGmSNmgsGUqWCFh8jfaGxGQsqrMMpY0aygF9Ye0-zfHYTZjxOpU1jvuSmSemohtdJGuR_OJqunedkMmisw2v8bEeEQ9mxs3WEFZ9NOX7ujEgu0DuPYNWUlwEM0FizYEGazOopbzRdPFha9j732ziCM1xp4ClLAvHVr96=nw)\

Ở hình ảnh trên, **Stream** hiểu đơn giản chính là cái băng truyền kia, thứ để trung chuyển hàng hoá (events). **Stream** chỉ nhận event 1 cách thụ động (từ khi khởi tạo)

Vậy có cách nào để làm cho **Stream** linh hoạt hơn, có thể chủ động nhận, thêm events?

StreamController bao gồm 2 thành phần chính:

- Sink: kiểm soát đầu vào (input)
- Stream: nơi trung chuyển dữ liệu

![img](https://lh6.googleusercontent.com/lC8YzgUXX0j1IhUSnu9nGHUrlKHOkBGgTgA-L7MYyXZob8ih5nwVy4FxSNByQ4E2IpQZi8-0txI-yrlBcGOyjOqbV6c3LZHplSuSA4KlcpCTGVGtzbIeb2OSHwOc8Cq6Gxpm1lcIjFjYr4osFy0bAMhy66MBFUQqEw0nOJr47LO1KT658VKEp0XhnA3g=nw)

.sink.add() tương đương với .add()

```dart
StreamController streamController = StreamController();
 StreamSubscription streamSubscription = streamController.stream.listen((event) {
   print("stream onListen: $event");
 });
 streamController.sink.add("event");
 streamController.sink.add("event1"); // sẽ add "event1" vào stream
 streamController.add("1111");
 streamController.add("2222");
 streamController.addStream(Stream.fromIterable([1,2,3]));
 streamController.addError(Stream.fromIterable([1,2,3]));
```

---

# StreamTransform

StreamTransformer giúp biến đổi data của 1 stream trước khi trả về dữ liệu

Nhớ chú ý các generic in, out.

```dart
import 'dart:async';

void main(List<String> args) {
 Stream<int> s = Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9]);

 StreamTransformer<int, String> streamTransformer =
     StreamTransformer.fromHandlers(
   handleData: (data, sink) => sink.add("_$data"),
 );

 Stream<String> stream = s.transform(streamTransformer);

 stream.listen((event) {
   print(event);
 });
}
```

---

# Các từ khoá async*, sync*, yield, yield*

- **async\*** cũng giống từ khoá **async**, để đánh dấu hàm bất đồng bộ, nhưng variable type trả về là **Stream**.
- **sync\*** để đánh dấu hàm đồng bộ, nhưng variable type trả về là **Iterable**.
- **yield** sử dụng trong function được đánh dấu với từ khoá  **async*** hoặc **sync*** để phát ra 1 giá trị. Nếu dùng với từ khoá  **sync*** sẽ phát ra 1 giá trị được add vào **Iterable**. Nếu sử dụng với từ khoá  **async*** sẽ phát ra 1 giá trị được add vào **Stream**.
- **yield\*** sử dụng trong function được đánh dấu với từ khoá **async*** hoặc **sync***. Nếu dùng với từ khoá **sync*** sẽ phát ra 1 giá trị Iterable, và add toàn bộ giá trị vào Iterable trả về. Dùng để phát ra 1 giá trị **Stream** được add vào **Stream** trả về của function.

## **Ví dụ về async\*, yield**

```dart
import 'dart:async';

Stream<int> countStream(int max) async* {
 for (int i = 1; i <= max; i++) {
   yield i; // lặp từ 1 -> max, mỗi lần lặp add 1 giá trị vào stream
 }
}

Future<int> sumStream(Stream<int> stream) async {
 int sum = 0;
 await for (int i in stream) {
   sum += i;
 }
 return sum;
}

main() async {
 var stream = countStream(20); // sau khi chạy sẽ có stream từ 1 > 20
 var sum = await sumStream(stream);
 print(sum); // sẽ in ra 210
}
/// async* cũng giống từ khoá `async`, để đánh dấu hàm bất đồng bộ, nhưng variable type trả về là Stream.
/// yield sử dụng trong function được đánh dấu với từ khoá `async*` hoặc `sync*` để phát ra 1 giá trị. 
/// Nếu sử dụng với từ khoá `async*` sẽ phát ra 1 giá trị được add vào Stream.
```

## **Ví dụ về async\*, yield\***

```dart
import 'dart:async';

Stream<int> countStream(int max) async* {
 List<int> arrs = [];
 for (var i = 0; i < max; i++) { arrs.insert(i, i); }
 yield* Stream.fromIterable(arrs); // lấy từng giá trị của Stream.fromIterable(arrs) và trả về
 yield* Stream.fromIterable([17, 18, 19, 20]);
}

Future<int> sumStream(Stream<int> stream) async {
 int sum = 0;
 await for (int i in stream) {
   sum += i;
 }
 return sum;
}

main() async {
 var stream = countStream(17);
 var sum = await sumStream(stream);
 print(sum); // sẽ in ra 210
}
/// async* cũng giống từ khoá `async`, để đánh dấu hàm bất đồng bộ, nhưng variable type trả về là Stream.
/// yield* sử dụng trong function được đánh dấu với từ khoá `async*` hoặc `sync*`. 
// Nếu dùng với từ khoá `async*` sẽ phát ra 1 giá trị Stream, và add toàn bộ giá trị của Stream này vào Stream trả về. 
```

## **Ví dụ về sync\*, yield**

```dart
void main(List<String> args) {
 print(testYield()); // sẽ in ra: (1, 2, 3, 4, 5)
}

Iterable testYield() sync* {
 yield 1; // add 1 vào Iterable
 print("xử lý logic ở đây");
 yield 2;
 print("xử lý logic tiếp trước khi yield");
 yield 3;
 yield 4;
 yield 5;
}
/// sync* cũng giống từ khoá `sync`, để đánh dấu hàm đồng bộ, nhưng variable type trả về là Iterable.
/// yield sử dụng trong function được đánh dấu với từ khoá `async*` hoặc `sync*` để phát ra 1 giá trị.
/// Nếu dùng với từ khoá `sync*` sẽ phát ra 1 giá trị được add vào Iterable.
```

## **Ví dụ về sync\*, yield\***

```dart
void main(List<String> args) {
int max = 100;
List<int> arrs = [];
for (var i = 0; i < max; i++) { arrs.insert(i, i); }
print(yieldWay(arrs));
}

Iterable yieldWay(List<int> arrs) sync* {
// yield* Iterable: add toàn bộ data từ Iterable con sang Iterable cha
yield* arrs.where((element) => element % 2 == 0);
yield* arrs.where((element) => element % 3 == 0);
yield* arrs.where((element) => element % 5 == 0);
}
/// sync* cũng giống từ khoá, để đánh dấu hàm đồng bộ, nhưng variable type trả về là Iterable.
/// yield* sử dụng trong function được đánh dấu với từ khoá `async*` hoặc `sync*`. 
/// Nếu dùng với từ khoá `sync*` sẽ phát ra 1 giá trị Iterable, và add toàn bộ giá trị vào Iterable trả về. 

```

## **So sánh với cách viết truyền thống**

 Cách viết cơ bản

```dart
void main(List<String> args) {
 int max = 100;
 List<int> arrs = [];
 for (var i = 0; i < max; i++) { arrs.insert(i, i); }
 print(normalWay(arrs));
}

Iterable normalWay(List<int> arrs) {
 return [
// [...Iterable] dùng cho 1 Iterable, sẽ add toàn bộ data của Iterable con vào Iterable cha
   ...arrs.where((element) => element % 2 == 0), // thêm các phần tử của mảng các số chia hết cho 2
   ...arrs.where((element) => element % 3 == 0), // thêm các phần tử của mảng các số chia hết cho 3
   ...arrs.where((element) => element % 5 == 0), // thêm các phần tử của mảng các số chia hết cho 2
 ];
}
```

Cách viết sử dụng sync*

```dart
void main(List<String> args) {
 int max = 100;
 List<int> arrs = [];
 for (var i = 0; i < max; i++) { arrs.insert(i, i); }
 print(yieldWay(arrs));
}

Iterable yieldWay(List<int> arrs) sync* {
 yield* arrs.where((element) => element % 2 == 0);
 yield* arrs.where((element) => element % 3 == 0);
 yield* arrs.where((element) => element % 5 == 0);
}
```

## **1 vài Ví dụ khác**

```dart
void main() {
 testStream().listen(println, onError: println, onDone: () => println('Done!'));
}

Stream<int> testStream() async* {
 yield 10; // emit ra giá trị 10
 await Future.delayed(const Duration(seconds: 2)); // chờ 2s
 yield* Stream.fromIterable([1, 2, 3]); // add toàn bộ phần tử của 1 stream
 throw const FormatException('FormatException'); // thử throw Exception
 yield 13; // hàm này đã xảy ra Exception nên số 13 không được phát ra
}

void println(Object value) {
 print(value.toString());
}
```

> Sử dụng **yield\*** kết hợp với **sync\*** sẽ dễ dàng viết code hơn, dễ xử lý hơn. 
>
> Thích hợp cho các bài toán xử lý logic nhiều. Không cần tạo Iterable, khi cần phát ra giá trị, chỉ cần **yield\***.

# **Tổng kết**

```dart
Cách nhớ đơn giản:
async* sử dụng cho các hàm bất đồng bộ.
sync* sử dụng cho các hàm đồng bộ.
yield sử dụng trong function với từ khoá async* hoặc sync* kèm 1 giá trị. Giá trị này được add vào Iterable hoặc Stream.
yield* sử dụng trong function với từ khoá async* hoặc sync* kèm 1 Iterable hoặc 1 Stream. Toàn bộ giá trị sẽ được add vào Iterable và Stream trả về của function.
```

----

# StreamBuilder

StreamBuilder là một Widget trong Flutter nhận vào một Stream và trả ra kết quả nhận được mỗi khi stream listen 1 event để người dùng render Widget tương ứng lên màn hình. StreamBuilder gồm 2 thành phần chính:

- stream: là stream sẽ listen
- builder: là widget hiển thị kết quả lên trên giao diện cho người dùng.

```dart
StreamBuilder(
 stream: stream,
 builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
   return Text(snapshot.toString());
 },
);
```

## **AsyncSnapshot**

Khi sử dụng StreamBuilder, có thể sử dụng AsyncSnapshot để kiểm tra các trạng thái của Future:

- ConnectionState.none: khi `future` không được truyền vào
- ConnectionState.waiting: khi `future` đang được thi
- ConnectionState.done: khi `future` hoàn thành. Có thể sử dụng `.hasData`, `.hasError` để kiểm tra dữ liệu trả về có hay không

```dart
 final Stream s = Stream.periodic(const Duration(seconds: 2), (i) => i);

 @override
 Widget build(BuildContext context) {
   return StreamBuilder(
       stream: s,
       builder: (BuildContext _, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){ 
return const Text("Loading, please wait..."); 
}
          if (snapshot.hasData) { return Text("After ${snapshot.data}s"); }
          return Text(snapshot.toString());
     	},
   );
 }
```

