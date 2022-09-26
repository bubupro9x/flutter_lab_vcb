# FutureBuilder

FutureBuilder là một Widget trong Flutter nhận vào một function Future và trả ra kết quả nhận được để người dùng render Widget tương ứng lên màn hình.FutureBuilder gồm 2 thành phần chính:

future: là future cần thực thi

builder: là widget hiển thị kết quả lên trên giao diện cho người dùng.



```dart
FutureBuilder(
     future: testDelay(),
     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
         return Text(snapshot.data.toString());
     },
);
```





## Khởi tạo FutureBuilder

```dart
 @override
 Widget build(BuildContext context) {
   return MaterialApp(home: Scaffold( appBar: AppBar(title: const Text("FutureBuilder")),
       body: Center(
         child: FutureBuilder(
           future: testDelay(),
           builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
             return Text(snapshot.data.toString());
           },
         ),
       ),
     ),
   );
 }

 Future testDelay() async {
   await Future.delayed(const Duration(seconds: 3));
   return 1;
 }
```



## **AsyncSnapshot** là gì

Khi sử dụng FutureBuilder, có thể sử dụng AsyncSnapshot để kiểm tra các trạng thái của Future:

- ConnectionState.none: khi `future` không được truyền vào
- ConnectionState.waiting: khi `future` đang được thi
- ConnectionState.done: khi `future` hoàn thành. Có thể sử dụng `.hasData`, `.hasError` để kiểm tra dữ liệu trả về có hay không

## **Ví dụ về AsyncSnapshot**

```dart
FutureBuilder(
 future: testDelay(),
 builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
   if (snapshot.connectionState == ConnectionState.active) {
     return const Text("Please wait...");
   } else {
     if (snapshot.hasData) {
       return Text("Success: ${snapshot.data}");
     } else {
       return Text("Error: ${snapshot.data}");
     }
   }
 },
);
```

## **Tổng kết Future**

Future thích hợp sử dụng cho 1 tác vụ bất đồng bộ

Có thể sử dụng FutureBuilder để cập nhật tiến độ, kết quả của 1 future lên giao diện người dùng.