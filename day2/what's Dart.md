# Dart là gì

`Dart` là một ngôn ngữ lập trình được phát triển bởi `Google`. `Dart` khá giống với java nên đa phần các lập trình viên `Android` chuyển dịch sang làm `Flutter` khá thuận tiện vì sự giống nhau này.

Điểm đặt biệt ở `dart` đó là hỗ trợ biển dịch cả `Just in time(JIT)` và `Ahead of time(AOT)`.

- `Ahead Of Time (AOT)`: Với `AOT` thì trình biên dịch chuyển ngôn ngữ `Dart` thẳng sang Native Code giúp hiệu năng tốt nhất có thể (tức là khi chạy chương trình, nó sẽ biên dịch từ đầu đến cuối)
- `Just In Time (JIT)`: Còn với `JIT` cho phép **hot reloading** hoạt động, giúp phát triển sản phẩm nhanh và tiện dụng hơn (được hiểu như việc debug trong ngôn ngữ khác là debug hàm nào chạy hàm đó thì ở đây nó sẽ viết đến đâu biên dịch ngay đến đấy)

### Để học Flutter, chúng ta phải học Dart

Dart là một ngôn ngữ thuần OOP (hướng đối tượng)

Ngôn ngữ Dart giông giống Java, là cải tiến lên từ Javascript, cũng là hệ C nên cú pháp tương tự nhau (tương tự cả C#)

Để nắm được ngôn ngữ Dart, chúng ta phải làm quen và ghi nhớ một số **CONCEPTS** (khái niệm) quan trọng:

- Do Dart là ngô ngữ thuần OOP nên tất cả những thứ bạn gán cho biến đều là **object**, mọi **object** đều là **instance** (thể hiện) của một **class**.
- Kể cả **số, method (hàm) và null** cũng đều là **object**. Tất cả các object đều ***kế thừa\*** từ Object class.
- **Type** của 1 **variable** (biến) là **optional** bởi vì Dart có thể tự suy ra type dựa trên giá trị truyền vào cho biến.
- Biến **number** được hiểu là **kiểu int**. Khi bạn muốn khai báo 1 variable mà type của nó không được xác định, hãy sử dụng **type dynamic**
- Như các ngôn ngữ khác, **Dart** hỗ trợ **generic type**, ví dụ như **List** (1 danh sách kiểu số nguyên) hoặc **List** (1 danh sách các object mà type không xác định, Dart có thể chấp nhận mọi loại type).
- **Dart** hỗ trợ **top-level function** (giống như **main()**), đồng nghĩa bạn cso thể sử dụng hàm đó ở bất cứ đâu mà không cần thông qua tên **class** hay bất kì **instance** của class nào cả.
- Bạn cũng có thể tạo một hàm bên trong hàm (còn gọi là **nested** **function** hoặc **local function**).
- Tương tự **Dart** cũng hỗ trợ **top-level variable**.
- Không giống với **Java**, **Dart** không hỗ trợ **public**, **protected** và **private**. Nếu như **identifier** (tên biến, hàm,... ) bắt đầu với dấu gạch dưới ( **_** ), thì nó **private** trong **library** của nó.
- Mỗi file **.dart** được coi là 1 **library**. Identifier có thể bắt đầu bằng một chữ cái hoặc dấu gạch dưới ( **_** ).
- **Dart tools** có thể báo cho bạn 2 loại vấn đề: **warning** và **errors**.

Một chương trình Dart cơ bản:

```typescript
// Định nghĩa 1 hàm (function)
printInteger(int aNumber) {
  print('The number is $aNumber.'); // Print to console.
}

// Khi chương trình được excute, hàm main sẽ được thực thi đầu tiên
main() {
  var number = 42; // Khai báo và gán giá trị cho biến.
  printInteger(number); // Gọi hàm printInteger()
}
```

Một số keyword thường dùng trong Dart: [link](https://dart.dev/guides/language/language-tour#keywords)

Để tìm hiểu sâu hơn về ngôn ngữ Dart và Flutter, mời các bạn đón đọc các bài viết tiếp theo.

