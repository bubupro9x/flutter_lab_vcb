# Bài tập Dart



```dart
void main(List<String> args) {
 String str = " đây là kết quả của buổi học thứ 2 về dart: dart basics (phần 1)...";
 /// hãy viết code bằng tất cả các cách có thể để in ra:
 /// `Đây là kết quả buổi học thứ 2 về Dart: DART BASIC (phần 1)`
 /// gợi ý: sử dụng hàm subString()
}
```

```dart
void main(List<String> args) {
 List arr = [
   1,
   2,
   3,
   "đây",
   "kết",
   "là",
   true,
   false,
   {true: "buổi", 1: "học", 10.2: ":", false: "dart basics"},
   ['thứ', 'quả', 'về'],
   "(phần 1)",
   {"flutter": "dart"},
 ];

 /// Lấy data từ array trên và tạo ra 1 String với giá trị sau:
 /// Đây là kết quả buổi học thứ 2 về Dart: DART BASIC (phần 1)
```

```dart
void main(List<String> args) {
  /*
    Ví dụ dưới đây có 3 lỗi. Hãy tìm và sửa hết 3 lỗi này.
    Nhớ đọc ví dụ về ... nhé mọi người.
  */

  var arrs = ["-1", "1", "2", null, "3", "4", "5", "6", "7"];
  Map<dynamic, List<String?>?>? sMap = {
    1: null,
    2: [],
    3: ["x", "y", "z"]
  };
  Map<dynamic, List<dynamic>?>? map = {
    "first": ["a", "b", "c", "d"]
  };
  map.addAll(sMap);

  List<int> arrsToInt = arrs.map((e) => int.parse(e)).toList();

  map["second"] = arrsToInt;
  map["third"] = sMap.values.last.sublist(1);

  /*
  Ví dụ về ...
  Cách sử dụng: [...Iterable]
  Khi sử dụng ... sẽ lấy toàn bộ phần tử của Iterable add vào trong []

  ví dụ: 
  var a = [1,2,3];
  var b = [4,5,6];
  var result = [...a, ...b] // sẽ cho ra result = [1,2,3,4,5,6]
  */

  map["fourth"] = [
    ...arrs.map((e) => int.parse(e)).where((e) => e % 2 == 1),
    ...arrs.where((e) => e == null),
    ...sMap[3].sublist(0,2)
  ];

  print(map);
}
```

```dart
Viết chương trình in ra số nguyên tố từ 0 đến 100
```