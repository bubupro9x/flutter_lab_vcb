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

---

# Các biến, kiểu dữ liệu trong Dart

```dart
void main(){
// Numbers - (int, double) num
// Strings - "Hello!" (single and doule quotes)
// Booleans - true or false
// Lists - collections of items (like arrays) List<int> 0 indexed
// Maps - collectiosn with associated Key Value Pairs Map<String, int>
// runes - unicode character points
// symbols - #symbol (simbolic metadata)
}
```



### Strings

1. Khái niệm:

Kiểu String trong Dart sử dụng để biểu diễn chuỗi ký tự Unicode(UTF-16) (bạn có thể sử dụng các xâu có kí tự tiếng Việt hoặc bất cứ thứ tiếng nào mà sử dụng được với mã Unicode.

Nhìn chung string trong dart giống các ngôn ngữ khác.

Cách khai báo và sử dụng:

```dart
void main(List<String> args) {
	var s1 = 'Single quotes work well for string literals.';
	var s2 = "Double quotes work just as well.";
	var s3 = 'It\'s easy to escape the string delimiter.';
	var s4 = "It's even easier to use the other delimiter.";
  // Dùng nháy đơn hay kép đều được
}
```

Một vài method cần lưu ý

```dart
void main(List<String> args) {
  /// Có thể sử dụng nháy đơn '' hoặc nháy kép "" để khai báo 1 string
  String s = 'Hello world ';
  String s1 = "Hello world";

  /// Tách kí tự trong 1 chuỗi
  List<String> splittedStrs = s.split(" ");
  print("splittedStrs -> $splittedStrs"); // sẽ in ra: splittedStrs -> [Hello, world]

  /// kiểm tra 1 string có chứa 1 string khác không
  bool hasWorldStr = s.contains("world");
  print("hasWorldStr -> $hasWorldStr"); // sẽ in ra: hasWorldStr -> true

  /// chuyển đổi tất cả kí tự về kí tự viết hoa, viết thường
  String sUpperCase = s.toUpperCase();
  String sLowerCase = s.toLowerCase();
  print("sUpperCase -> $sUpperCase"); // sẽ in ra: sUpperCase -> HELLO WORLD
  print("sLowerCase -> $sLowerCase"); // sẽ in ra: sLowerCase -> hello world
  
  /// lấy vị trí đầu tiên của kí tự 'o'
  int sIndexOf = s.indexOf("o");
  print("sIndexOf -> $sIndexOf"); // sẽ in ra: sIndexOf -> 4

  /// kiểm tra xem string bắt đầu với kí tự 'H'
  bool sStartWith = s.startsWith("H");
  print("sStartWith -> $sStartWith"); // sẽ in ra: sStartWith -> true

  /// thay thế các kí tự trong 1 chuỗi
  String sReplaced = s.replaceAll("world", "everyone");
  print("sReplaced -> $sReplaced"); // sẽ in ra: sReplaced -> Hello everyone

  /// loại bỏ khoảng trắng ở đầu/cuối string
  String sTrimmed = s.trim();
  print("s -> \"$s\""); // sẽ in ra: s -> "Hello world "
  print("sTrimmed -> $sTrimmed"); // sẽ in ra: sTrimmed -> Hello world
}
```


&nbsp;

### int

int là kiểu số nguyên. Tùy thuộc vào bộ nhớ máy, nền tảng máy (32 bit hay 64 bit) mà kiểu số nguyên trong Dart có giá trị từ -2^63 đến 2^63 - 1. Ngoài kiểu số nguyên int, trong Dart còn có kiểu số nguyên BigInt để làm việc với các số nguyên lớn.

BigInt khá giống với BigInteger trong java, phù hợp để lưu trữ các số nguyên lớn, như số tiền lạm phát ở Venezuela

```dart
void main(List<String> args) {
  int a = 10;
  int b = -10;

  print("a = $a"); // sẽ in ra: a = 10
  print("b = $b"); // sẽ in ra: b = -10
}
```


&nbsp;

### double

double là kiểu số thực. Các phiên bản cũ của Dart thì kiểu số thực bắt buộc phải có dấu . ví dụ để khai báo biến số thực a có giá trị 10 chúng ta phải viết rõ double a = 10.0 Tuy nhiên các phiên bản hiện nay đã bỏ phần dấu . này đi, bạn có thể khai báo double a = 10

Trong dart sẽ không có Float như java.

```dart
void main(List<String> args) {
  double a = 10;
  double b = -10.0;

  int c = 10;
  int d = -10;

  int _resultInt = (a + b + c + d).toInt();
  double _resultDouble = (a + b + c + d);

  print("_resultInt -> $_resultInt"); // sẽ in ra: _resultInt -> 0
  print("_resultDouble -> $_resultDouble"); // sẽ in ra: _resultInt -> 0.0
}
```

Một vài phương thức cần nhớ

Chuyển đổi từ int, double sang string:

```dart
void main(List<String> args) {
  int a = 10;
  double b = -10.0;

  String _aStr = a.toString();
  String _bStr = b.toString();

  print("int a toString: $_aStr"); // sẽ in ra: int a toString: 10

  print("double b toString: $_bStr"); // sẽ in ra: double b toString: -10.0
}
```

Chuyển từ int qua double:

```dart
void main(List<String> args) {
  int a = 10;
  double _aDouble = a.toDouble();

  print("int a toDouble: $_aDouble"); // sẽ in ra: int a toDouble: 10.0
}
```

Chuyển từ double qua int:

```dart
void main(List<String> args) {
  double b = -10.0;
  int _bInt = b.toInt();

  print("double b toInt: $_bInt"); // sẽ in ra: double b toDouble: -10
}
```

Chuyển từ String qua double, int:

```dart
void main(List<String> args) {
  String c = "20";

  int _cInt = int.parse(c);
  double _cDouble = double.parse(c);

  print("Parse String c to int: $_cInt"); // sẽ in ra: Parse String c to int: 20
  print("Parse String c to double: $_cDouble"); // sẽ in ra: Parse String c to double: 20.0
}
```


&nbsp;

### bool

Kiểu dữ liệu bool trong Dart có 2 giá trị là true (đúng) và false (sai) được sử dụng để thể hiện kết quả của một mệnh đề logic (các phép toán so sánh, kiểm tra, các hàm…)

```dart
void main(List<String> args) {
  bool a = true;
  bool b = false;

  if (a) { /// các viết tắt khi so sánh bool == true
    print("a is $a"); // sẽ in ra: a is true
  }

  if (a == true) { /// viết kiểu này rõ nghĩa hơn
    print("a == true"); // sẽ in ra: a == true
  }

  if (!b) { /// cách viết tắt khi so sánh bool == false
    print("b is $b"); // sẽ in ra: b is false
  }

  if (a && !b) { /// so sánh nhiều mệnh đề, viết tắt
    print("a == true and b == false"); // sẽ in ra: a == true and b == false
  }

  if (a || b) { /// so sánh nhiều mệnh đề, viết tắt
    print("a == true or b == true"); // sẽ in ra: a == true and b == false
  }
}
```


&nbsp;

### Array

Kiểu dữ liệu array (danh sách - List) trong Dart được sử dụng để biểu diễn cho một tập hợp các đối tượng theo một thứ tự nhất định. Kiểu array trong Dart tương đương với kiểu mảng Array trong các ngôn ngữ khác (java, kotlin).

Cách khai báo

```dart
void main(List<String> args) {
  List strs = ["a", "b", "c"]; /// cách viết tắt
  List<String> strs_1 = <String>["a", "b", "c"]; /// cách viết tắt rõ nghĩa, sử dụng [generic]
}
```

Một vài phương thức cần nhớ

```dart
void main(List<String> args) {
  List strs = ["a", "b", "c"]; /// cách viết tắt
  List<String> strs_1 = <String>["a", "b","c"]; /// cách viết tắt rõ nghĩa, sử dụng [generic]

  strs.add("d");
  print("strs after adding \"d\" -> $strs");
  // sẽ in ra: strs after adding "d" -> [a, b, c, d]

  strs.remove("d");
  print("strs after removing \"d\" -> " + strs.toString()); 
  // sẽ in ra: strs_1 after adding "d" -> [a, b, c, d]

  /// đoạn code trên, nhưng sử dụng [Builder Design Pattern] để viết code ngắn gọn hơn
  print("strs after adding \"d\" then remove \"d\" -> ${strs..add("d")..remove("d")}"); 
  // sẽ in ra: strs after adding "d" then remove "d" -> [a, b, c]
}
```

Thêm 1 array khác:

```dart
void main(List<String> args) {
  List<String> strs_1 = <String>["a", "b","c"]; /// cách viết tắt rõ nghĩa, sử dụng [generic]


  List<String> strs_2 = ["d", "e", "f"];
  strs_1.addAll(strs_2);
  print("strs_1 after addAll str_2 -> $strs_1");
  // sẽ in ra: strs_1 after addAll str_2 -> [a, b, c, d, e, f]
}
```

Tách các phần tử thành 1 array từ 1 array:

```dart
void main(List<String> args) {
  List<String> strs_1 = <String>["a", "b","c"]; /// cách viết tắt rõ nghĩa, sử dụng [generic]
  
  
  List<String> strs_1_subList = strs_1.sublist(2, 4);
  print("strs_1_subList -> $strs_1_subList");
  // sẽ in ra: strs_1_subList -> [c, d]
}
```

Lấy 1 phần tử từ 1 array:

```dart
void main(List<String> args) {
  List<String> strs_1 = <String>["a", "b","c"
  ]; /// cách viết tắt rõ nghĩa, sử dụng [generic]
  

  /// lấy 1 phần tử tại 1 vị trí index trong array
  String _strByIndex = strs_1[0];
  print("_strByIndex -> $_strByIndex");
  // sẽ in ra: _strByIndex -> a
}
```




### map

Kiểu dữ liệu map trong dart là một đối tượng lưu trữ dữ liệu dưới dạng một cặp khóa-giá trị. Mỗi giá trị được liên kết với khóa của nó và nó được sử dụng để truy cập giá trị tương ứng của nó. Cả khóa và giá trị đều có thể là bất kỳ loại nào

Khai báo 1 map

```dart
void main(List<String> args) {
  /// cách viết ngắn gọn
  Map map = {"key": "value"};
  print("map -> $map");
  // sẽ in ra: map -> {key: value}
  
  /// cách viết rõ nghĩa
  Map<String, String> map1 = Map<String, String>();
  map1["key"] = "value";
  print("map1 -> $map1");
  // sẽ in ra: map1 -> {key: value}
}
```

Trong dart cũng có hỗ trợ HashMap như các ngôn ngữ lập trình khác: java, kotlin

&nbsp;

1 vài phương thức cơ bản:

```dart
void main(List<String> args) {
  Map<String, String> map1 = Map<String, String>();
  map1["key"] = "value";
  print("map1 -> $map1"); // sẽ in ra: map1 -> {key: value}

  /// 1 vài phương thức cơ bản
  Map<String, String> map2 = Map.from(map1);
  print("map2 -> $map2"); // sẽ in ra: map2 -> {key: value}

  String key = map1.keys.first;
  print("key from map1 -> $key"); // key from map1 -> key

  String value = map1.values.first;
  print("value from map1 -> $value"); // sẽ in ra: value from map1 -> value

  /// trong map key là duy nhất, không thể có 2 key cùng giá trị
  Map map12 = map1..addAll(map2);
  print("map12 -> $map12"); // sẽ in ra: map12 -> {key: value}
}
```

Map lưu trữ theo key-value. Vậy có thể thêm 1 cặp key-value trùng với cặp key-value đã tồn tại trong map không?

```dart
void main(List<String> args) {
  /// điều gì sẽ xảy ra nếu add 1 map với key mới?
  Map mapWithNewValue = {"key": "value"}..addAll({"key": "newValue"});
  print("mapWithNewValue -> $mapWithNewValue");
  // sẽ in ra: mapWithNewValue -> {key: newValue}
}
```

> :warning: **Cần chú ý**:

- Map lưu trữ dữ liệu theo key-value
- Key trong map không thể trùng. Nếu thêm 1 map khác có cùng key, value sẽ được cập nhật lại.

2. Tổng kết:

- Map lưu trữ dữ liệu theo key-value
- Key trong map không thể trùng. Nếu thêm 1 map khác có cùng key, value sẽ được cập nhật lại.



-----

# dynamic và var



Trong Dart mọi thứ đều là object. Đã là object thì luôn phải là instance của một class nào đó. Vì tất cả là đều là object nên dù là số, chữ hay bất kể loại dữ liệu nào thì giá trị mặc định của nó đều là `null`. Nhờ vậy, mọi biến số trong Dart đều là `reference type`. Cũng chính vì thế mà Dart có một loại biến dynamic chấp nhận mọi kiểu dữ liệu.

Dùng var để khai báo các kiểu dữ liệu:

```dart
void main(List<String> args) {
  /// Khai báo biến var
  /// Ưu điểm: nhanh, và không cần quan tâm tới [runtimeType]
  var intVar = 10;
  print("intVar -> $intVar, loại dữ liệu (variableType) -> ${intVar.runtimeType}");
  // sẽ in ra: intVar -> 10, loại dữ liệu (variableType) -> int

  var doubleVar = 10.0;
  print("doubleVar -> $doubleVar, loại dữ liệu (variableType) -> ${doubleVar.runtimeType}");
  // sẽ in ra: doubleVar -> 10.0, loại dữ liệu (variableType) -> double

  var stringVar = "A";
  print("stringVar -> $stringVar, loại dữ liệu (variableType) -> ${stringVar.runtimeType}");
  // sẽ in ra: stringVar -> A, loại dữ liệu (variableType) -> String

  var boolVar = 10;
  print("boolVar -> $boolVar, loại dữ liệu (variableType) -> ${boolVar.runtimeType}");
  // sẽ in ra: boolVar -> 10, loại dữ liệu (variableType) -> int

  var arrayVar = [1, 2, 3];
  print("arrayVar -> $arrayVar, loại dữ liệu (variableType) -> ${arrayVar.runtimeType}");
  // sẽ in ra: arrayVar -> [1, 2, 3], loại dữ liệu (variableType) -> List<int>

  var mapVar = {"key": "value"};
  print("mapVar -> $mapVar, loại dữ liệu (variableType) -> ${mapVar.runtimeType}");
  // sẽ in ra: mapVar -> {key: value}, loại dữ liệu (variableType) -> _InternalLinkedHashMap<String, String>
}
```

Dùng dynamic để khai báo các kiểu dữ liệu

```dart
void main(List<String> args) {
  /// Khai báo biến dynamic
  /// Giống var, nhưng có thể thay đổi variable type
  dynamic dynamicA = 10;
  print("dynamicA -> $dynamicA, loại dữ liệu (variableType) -> ${dynamicA.runtimeType}");
  // sẽ in ra: dynamicA -> 10, loại dữ liệu (variableType) -> int

  dynamicA = 10.0;
  print("dynamicA -> $dynamicA, loại dữ liệu (variableType) -> ${dynamicA.runtimeType}");
  // sẽ in ra: dynamicA -> 10.0, loại dữ liệu (variableType) -> double

  dynamicA = "A";
  print("dynamicA -> $dynamicA, loại dữ liệu (variableType) -> ${dynamicA.runtimeType}");
  // sẽ in ra: dynamicA -> A, loại dữ liệu (variableType) -> String

  dynamicA = true;
  print("dynamicA -> $dynamicA, loại dữ liệu (variableType) -> ${dynamicA.runtimeType}");
  // sẽ in ra: dynamicA -> true, loại dữ liệu (variableType) -> bool

  dynamicA = [1, 2, 3];
  print("dynamicA -> $dynamicA, loại dữ liệu (variableType) -> ${dynamicA.runtimeType}");
  // sẽ in ra: dynamicA -> [1, 2, 3], loại dữ liệu (variableType) -> List<int>

  dynamicA = {"key": "value"};
  print("dynamicA -> $dynamicA, loại dữ liệu (variableType) -> ${dynamicA.runtimeType}");
  // sẽ in ra: dynamicA -> {key: value}, loại dữ liệu (variableType) -> _InternalLinkedHashMap<String, String>



  /// error khi chạy, vì dynamicA hiện tại là Map, không có phương thức toInt()
  var a = dynamicA.toInt();
  print("a -> $a");
  // sẽ in ra: Class '_InternalLinkedHashMap<String, String>' has no instance method 'toInt'

  /*
   - dynamic đúng với cái tên của nó, có thể sử dụng linh hoạt trong rất nhiều trường hợp
   - Nhưng đây vừa là ưu điểm, vừa là nhược điểm:
      - Trong ví dụ trên, nếu không check [runtimeType] thì khó mà biết được variable type của dynamic,
      điều này dễ dẫn tới việc sử dụng sai phương thức
  */
}
```

Tác dụng của var/dynamic, cùng xem ví dụ sau:

```dart
void main(List<String> args) {
  Test test = Test().instance(); // phải chỉ rõ rằng hàm `instance` trả về đối tượng `Test`
  
  var a = Test().instance(); // không cần quan tâm tới `variable type` của hàm `instance`

  /// sử dụng var/dynamic thích hợp cho việc trung chuyển các `variable`
  /// tức chuyển từ hàm này qua hàm khác, class này qua class khác
}

class Test{
  Test instance(){return this;}
}
```



-----



# Const / final / static

### cost

Từ khoá "const" được dùng khi giá trị của biến được biết tại thời điểm compile time và không đổi.Nói cách khác trình biên dịch sẽ biết trước giá trị nào được lưu vào biến đó.

```dart
const int x = 1;
//Tại thời điểm compile time,  giá trị của biến x là 1 và không đổi.

```

Flutter cũng tự động suy ra kiểu của biến khi bạn chỉ cần khai báo biến và khởi tạo giá trị dưới dạng const.

```dart
const name = "Vietcombank";
```

Việc sử dụng từ khoá này ngoài phục vụ cho việc báo cho trình biên dịch biết biến này sẽ không bao giờ thay đổi trong suốt thời gian tồn tại của nó mà còn tác dụng cải thiện hiệu suất bắng cách khi gọi lại biến này trình biên dịch ko cần phải tạo ra 1 bản sao mới mà chỉ cần tham chiếu lại bản sao mà bạn đã tạo trước đó.

Từ khoá này được sử dụng cho compile time constant, String , number và kể cả Class. Bạn hiểu ý mình chứ, chính là Class. Hãy tưởng tượng chúng ta có 1 class Widget, và nó thực hiện việc gì đó ví dụ như loading hoặc show một dialog gì đó và không có nhu cầu thay đổi. Thì việc bạn sử khai báo class widget đó là một `const` sẽ giúp tiếp kiệm rất nhiều bộ nhớ.

### final

**final** và **const** trên thực tế thì rất giống nhau, đều không thay đổi giá trị của biến, nhưng **final** ít nghiêm ngặt hơn, nó chứa các giá trị không thay đổi nhưng giá trị đó có thể không xác định trong 1 khoảng thời gian ngay cả sau khi biên dịch nhưng một khi đã xác định thì giá trị đó không bao giờ thay đổi.

```dart
final response =
 await http.get(Uri.parse(‘https://jsonplaceholder.typicode.com/albums/1'));

```

Ở ví dụ trên giá trị của biến response chưa được biết đến cho đến khi chúng ta call xong api và api trả về giá trị . Một điều cần lưu ý nữa là một instance variables chỉ có thể là **final** không thể là **const** và static variables chỉ có thể là **const**.

### static

Từ khóa static dùng để khai báo biến lớp và phương thức. Nó thường quản lý bộ nhớ cho biến dữ liệu toàn cục. Các biến và phương thức static là thành viên của class thay vì một cá thể riêng lẻ. Biến hoặc các phương thức static giống nhau đối với mọi thể hiện của lớp, vì vậy nếu chúng ta khai báo thành viên dữ liệu là static thì chúng ta có thể truy cập nó mà không cần tạo một đối tượng. Đối tượng lớp không bắt buộc phải truy cập vào phương thức hoặc biến static, chúng ta có thể truy cập nó bằng cách đặt tên lớp trước biến hoặc phương thức tĩnh. Sử dụng tên lớp, chúng ta có thể gọi phương thức của lớp từ các lớp khác.



-----

## Function

Hàm là một khối lệnh thực hiện một tác vụ, khối lệnh này được dùng nhiều lần nên gom chúng tại thành một hàm. Trong Dart mọi thứ đều là đối tượng nên hàm cũng là một đối tượng (kế thừa Function).

```dart
  /// viết và gọi function (hàm)
  /// cách gọi hàm phổ biến
  test("cách gọi hàm phổ biến"); // sẽ in ra: Đây là hàm test, params test: cách gọi hàm phổ biến

  void test(String test){
    print("Đây là hàm test, params test: $test");
  }
```

Cách viết khác:

```dart
  /// vì trong dart, mọi thứ đều là đối tượng,
  /// và hàm kế thừa Function, nên có thể viết như này
  test.call("gọi qua method call()"); // sẽ in ra: Đây là hàm test, params test: gọi qua method call()

  void test(String test){
    print("Đây là hàm test, params test: $test");
  }
```

Function cũng có thể truyền vào như 1 params:

```dart
void main(List<String> args) {
  /// hoặc có thể truyền vào như 1 parameter....
  functionTest(() => test("function call function"));
  // sẽ in ra: Đây là hàm test, params test: function call function


  var _ret = functionTestCallBack(parseStringFromInt);
  print("Kết quả khi gọi functionTestCallBack -> $_ret");
  // sẽ in ra: Kết quả khi gọi functionTestCallBack -> Kết quả thực thi function: -1


  var _ret1 = functionTestCallBack((intStr) => parseStringFromInt("10"));
  print("Kết quả khi gọi functionTestCallBack -> $_ret1");
  // sẽ in ra: Kết quả khi gọi functionTestCallBack -> Kết quả thực thi function: 10
}

void test(String test){
  print("Đây là hàm test, params test: $test");
}

int parseStringFromInt(String number){
  return int.tryParse(number) ?? -1;
}

void functionTest(Function function){
  function.call();
}

/// [functionTestCallBack] sẽ thực thi như sau:
/// - Yêu cầu truyền vào 1 function với parameter là 1 string
/// - Thực thi function [callback] và trả về dữ liệu kiểu int
/// - Trả về kiểu dữ liệu sau khi thực thi function [functionTestCallBack] dạng String
String functionTestCallBack(int Function(String) callback){
  int result = callback.call(""); // "" là default value

  return "Kết quả thực thi function: $result";
}
```

Params trong function

``` dart
void main(List<String> args) {
  /// function trong dart hỗ trợ optional params,
  /// - nếu không truyền params vào function: params sẽ nhận giá trị mặc định
  /// - nếu truyền params vào function: params sẽ nhận giá trị được truyền vào từ function
  functionWithOptionalParam();
  // sẽ in ra: params a=a, b=b
  
  functionWithOptionalParam(
    b: "không phải giá trị b",
    a: "không phải giá trị a"
  );
  // sẽ in ra: params a=không phải giá trị a, b=không phải giá trị b

  functionWithPositionalParam("a", "b", "c");
  // sẽ in ra: params a=a, b=b, b=c, d=
  /// vì không truyền vào d, nên d=""
}

void functionWithOptionalParam({String a = "a", String b = "b"}){
  print("params a=$a, b=$b");
}
void functionWithPositionalParam(String a, [String b = "", c = "", d = ""]){
  print("params a=$a, b=$b, b=$c, d=$d");
}
```

Inline function: function trong function

```dart
void main(List<String> args) {
  /// Inline function (function lồng function trong dart)
  /// [_inlineFunction2] được định nghĩa bên trong function [_inlineFunction1]
  /// Lúc này chỉ có thể call function [_inlineFunction2] trong function [_inlineFunction2]
  void _inlineFunction1(){
    print("_inlineFunction1");

    void _inlineFunction2(){
      print("_inlineFunction2");
    }

    _inlineFunction2();
  }
  _inlineFunction1();
  // sẽ in ra: _inlineFunction1
  // sẽ in ra: _inlineFunction2
}
```

Mở rộng function từ 1 class

```dart
void main(List<String> args) {
  /// Dart có hỗ trợ extension như kotlin, swift...:
  /// function [test] được viết thêm vào lớp String
  String a = "a";
  a.test();
  // sẽ in ra: Mở rộng function trên lớp String
}

extension stringExt on String{
  void test(){
    print("Mở rộng function trên lớp String");
  }
}
```


2. Tổng kết

- Function cũng là 1 object trong dart.
- Khi tạo inline function, cần chú ý tới việc đặt tên hàm và nên tuân thủ clean code (1 function không dài quá 20 line, 1 line không nên quá 80 kí tự)
- Function với optional params linh hoạt trong hầu hết các trường hợp.
- Function với positioned params sẽ khó mở rộng trong tương lai.
  Ví dụ 1 function với positioned params, sẽ không khả thi khi cần truyền thêm params khác variable type.



----



### Enum

Kiểu enum trong Dart còn gọi là kiểu liệt kê (kiểu liệt kê thứ tự enumerated) được sử dụng để liệt kê các giá trị hằng số. Kiểu liệt kê được khai báo bằng cách sử dụng từ khóa enum. Kiểu liệt kê enum cũng là một kiểu iterable, tức là cũng có thể duyệt tuần tự qua từng phần tử của nó.

Ví dụ khai báo enum và thêm function `getName()`

```dart
enum DayOfWeeks {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday,
}

extension DayOfWeeksExt on DayOfWeeks {
  String getName() {
    switch (this) {
      case DayOfWeeks.Monday:
        return "Thứ 2";
      case DayOfWeeks.Tuesday:
        return "Thứ 3";
      case DayOfWeeks.Wednesday:
        return "Thứ 4";
      case DayOfWeeks.Thursday:
        return "Thứ 5";
      case DayOfWeeks.Friday:
        return "Thứ 6";
      case DayOfWeeks.Saturday:
        return "Thứ 7";
      case DayOfWeeks.Sunday:
        return "Chủ nhật";
      default:
        return "Không xác định";
    }
  }
}

void main(List<String> args) {
  List<DayOfWeeks> dayOfWeeks = DayOfWeeks.values;
  dayOfWeeks.forEach((element) {
    print("day is: ${element.getName()}");
    // sẽ in ra: các ngày từ thứ 2 -> chủ nhật
    // day is: Thứ 2
    // day is: Thứ 3
    // day is: Thứ 4
    // day is: Thứ 5
    // day is: Thứ 6
    // day is: Thứ 7
    // day is: Chủ nhật
  });
}
```



----



## Null safety

Vào ngày 3 tháng 3 năm 2021, team Flutter đã công bố [Flutter 2](https://medium.com/flutter/whats-new-in-flutter-2-0-fe8e95ecc65) and [Dart 2.12](https://medium.com/dartlang/announcing-dart-2-12-499a6e689c87). Trong số đó, có một thay đổi rất quan trọng là **Sound Null Safety**. Bài viết này sẽ hướng dẫn cho bạn mọi thứ căn bản bạn cần phải hiểu rõ để chuyển code của mình sang **Sound Null Safety**.

### Null safety là gì

Null safety còn được biết đến với tên gọi là `Non Nullable By Default` ở các ngôn ngữ lập trình khác. Null safety đảm bảo cho lập trình viên biết rằng, trừ khi họ muốn biến đó `null`, còn lại thì sẽ không có bất kì biến nào `null` cả. Trường hợp lập trình viên muốn biến đó `null` thì họ sẽ tạo nó là một biến `nullable`, trình phân tích và biên dịch sẽ đảm bảo rằng lập trình viên sẽ được nhắc nhở để xử lý các trường hợp mà giá trị của biến có thể `null`.

### Tại sao cần dùng

Trong trường hợp thực tế chúng ta gặp phải là một giá trị của một biến bị null nhưng thực tế thì chúng không nên null trong lúc đang chạy chương trình. Điều này sẽ gây ra lỗi tương tự `... was called on null`.

### Null types

Bạn có thể khai báo giá trị nullable bằng cách thêm `?`, ví dụ sau sẽ giúp bạn hiểu hơn:

```dart
int x = 0; //Can never be null
int? y = 1; //Can have null value
int? z; //Can have null value, currently has null value
x = null; //This line will throw an error as x can never be null
y = null;
z = 2;
z = null;
```

Bây giờ bạn muốn tạo một class có tên là `User`, trong đó biến `name` không bao giờ được null nhưng biến `phone` có thể null.

```dart
class User {
  final String Name = "name";
  String? phone;
}
```

### Null Checking

Giả sử bây giờ ta sử dụng biến `phone` của class `User` và lưu trữ nó ở một biến khác

```dart
String _phone = User().phone;
```

Trình biên dịch lúc này sẽ bảo lỗi

> type of String? cannot be assigned to a variable of type String

Điều này là vì `phone` có thể null nhưng biến bạn vừa tạo là `_phone` thì lại không.

Để xử lí trường hợp này, chúng ta có một vài cách để giải quyết:

- Thay đổi type của `_phone` từ `String` thành `String?`

  ```dart
  String? _phone = User().phone;
  ```

- Kiểm tra null cho `User().phone`

  ```dart
  final User _user = User();
  if(_user.phone != null){
  	String _phone = _user.phone;
  }else{
  	debugPrint("Error");
  }
  ```

### Cẩn thận với biến kiểu var và dynamic

Biến `dynamic` phá vỡ null safety vì biến dynamic có thể là null mà không cần phải chỉ định thêm  `?`. Thí dụ:

```dart
dynamic x;
int y = x; //Will compile but throw an error at runtime
print(y.toString()); //Will compile but throw an error at runtime
```

Tương tự như vậy nếu bạn khai báo một biến với `var` mà không khởi tạo nó và không cung cấp một kiểu rõ ràng, biến đó sẽ suy ra kiểu `dynamic` và phá vỡ toàn bộ null safety.

### Các biến bắt buộc và mặc định

Giả sử bạn không muốn biến `phone` là null, và bạn muốn biến này được khởi tạo khi bất kỳ `User` nào được đăng ký. Chúng ta sẽ làm điều này ở hàm khởi tạo:

```dart
class User {
  final String name;
  final String phone;
  int? age;
  User(this.name, this.phone)
}
```

Ngoài ra chúng ta còn xuất hiện thêm một trường mới là `age`. Như bạn thấy thì `age` là một `nullable`, nên khi khởi tạo chúng ta có thể truyền nó là 1 thông số tùy chọn. Có cũng được mà không cũng được

```dart
class User {
  final String name;
  final String phone;
  int? age;
  User({this.name, this.phone, this.age}) // This will throw an error
}
```

Nếu chúng ta viết như ở trên thì sẽ hiểu `name` và `phone` là một `optinal`, nó có thể là null, nhưng theo khai báo của chúng ta, nó không thể là null được. Vì vậy chúng ta cần thêm từ khóa `required` dành cho `name` và `phone`.

```dart
class User {
  final String name;
  final String phone;
  int? age;
  User({required this.name, required this.phone, this.age}) 
}
```

### Làm việc với !

Nếu bạn chắc chắn rằng một biến `nullable` sẽ không null trong thời gian chạy, bạn có thể thêm `!` để biểu thị điều đó.

```dart
int? x;
x = 5;
int y = x; //Will throw type int? cannot be assigned to a variable of type int
int y = x!; // Will work but you have to me COMPLETELY sure
```

### late

Trường hợp bạn muốn thêm một biến `id` vào class `User`. Và bạn quá mệt mỏi để xử lí `nullable` cho nó trong việc khai báo. Bạn muốn trình biên dịch tin rằng `id` sẽ không bao giờ null. Và hãy cứ kệ nó(`id`) đi. Kiểu gì cũng sẽ truyền data cho nó mà. Thì bạn có thể căn nhắc sử dụng `late`

````dart
class User {
  late String id;
  final String name;
  final String phone;
  int? age;
  User({required this.name, required this.phone, this.age}) 
}
void main(){
  final User _user = User(name: 'vcb', phone: '0900000000');
  print(_user.id); // This won't give you any warning but will throw a LateInitializationException during runtime and crash your app
  
  _user.id = '1';
  print(_user.id); // will print 1
}
````

Nhìn chung thì các bạn căn nhắc kĩ trước khi dùng `late` nhé.

---

## For loop
Trong các ngôn ngữ lập trình, vòng lặp cho phép một khối mã được thực thi lặp đi lặp lại nhiều lần.

Dart cũng như các ngôn ngữ lập trình khác, đều hỗ trợ các vòng lặp
- for
- for in
- while
- do while

For: áp dụng theo các điều kiện
```dart
void main() {
  /// vòng for cơ bản, theo index
  for (int i = 0; i < 10; i = i + 1) {
    print('i= $i');
    // sẽ in ra giá trị của i từ 0 -> 9
    /*
      i= 0
      i= 1
      i= 2
      i= 3
      i= 4
      i= 5
      i= 6
      i= 7
      i= 8
      i= 9
    */
  }
}
```


&nbsp;
For in: áp dụng lặp từng phần tử trong mảng

```dart
void main(List<String> args) {
  List ints = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  /// cũng là vòng lặp nhưng lặp qua từng giá trị trong 1 mảng
  for (int i in ints) {
    print("i = $i"); 
    // sẽ in ra giá trị của i 0 -> 9
    /*
      i = 0
      i = 1
      i = 2
      i = 3
      i = 4
      i = 5
      i = 6
      i = 7
      i = 8
      i = 9
    */
  }
}
```

While: áp dụng cho 1 điều kiện chưa thể xác định, chỉ có thể xác định khi thực thi 1 hoặc nhiều khối lệnh

```dart
void main(List<String> args) {
  int x = 0;
  // trong khi 1 điều kiện đúng, thực thi 1 khối lệnh
  while (x < 10){
    x++;
    print("x -> $x");
    // sẽ in ra các giá trị từ 1 -> 10,
    // khi x = 10, while sẽ dừng, vì điều kiện để chạy while là x < 10
  }
}
```

do while:
```dart
void main(List<String> args) {
  int x = 0;
  /// thực thi khối lệnh trước khi kiểm tra điều kiện trong while
  do {
    x++;
    print("x -> $x"); // sẽ in ra giá trị của x từ 1 -> 10
  } while (x > 0 && x < 10);  
}
```

> :warning: **Chú ý**
> Khi sử dụng vòng lặp, cần chú ý các điều kiện lặp để hạn chế `infinity loop` gây treo, lag ứng dụng.


&nbsp;

Tổng kết:
Vòng lặp trong dart giống các ngôn ngữ lập trình phổ biến khác như: java, kotlin, swift, python....


&nbsp;

## **Decision Making trong dart**

Mệnh đề if trong dart được sử dụng để kiểm tra giá trị dạng boolean của điều kiện.

Mệnh đề này trả về giá trị **True** hoặc **False**.

Có các kiểu của mệnh đề if-else trong dart như sau:

- Mệnh đề if
- Mệnh đề if-else
- Mệnh đề if-else-if

### **Mệnh đề if**

Mệnh đề if được sử dụng để kiểm tra giá trị dạng boolean của điều kiện. Khối lệnh sau if được thực thi nếu giá trị của điều kiện là **True.**

```dart
int a = 10;
if (a == 10) 
{ print("a == 10");}
```

### **Mệnh đề if else**

Mệnh đề if-else cũng kiểm tra giá trị dạng boolean của điều kiện. Nếu giá trị điều kiện là **True** thì chỉ có khối lệnh sau if sẽ được thực hiện, nếu là **False** thì chỉ có khối lệnh sau else được thực hiện.

```dart
int a = 8;
if (a == 10) {
  print("a == 10");
} else {
  print("a != 10");
}
```

### **Mệnh đề if else if**

Mệnh đề if-else-if cũng kiểm tra giá trị dạng boolean của điều kiện.

Nếu giá trị điều kiện if là **True** thì chỉ có khối lệnh sau if sẽ được thực hiện.

Nếu giá trị điều kiện if else nào là **True** thì chỉ có khối lệnh sau else if đó sẽ được thực hiện…

Nếu tất cả điều kiện của if và else if là **False** thì chỉ có khối lệnh sau else sẽ được thực hiện.

```dart
 int a = 8;
 if (a == 1) {
   print("a == 1");
 } else if (a == 2){
   print("a == 2");
 } else {
   print("else");
 }
```



# Feature & Async/await Dart

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

# Dart: Classes

## 1. Classes là những bản vẽ thiết kế

![blueprint](https://200lab-blog.imgix.net/2021/07/banthietke.svg)

Bản vẽ thiết kế là một hướng dẫn nó sẽ chỉ dẫn chúng ta tạo ra một cái gì đó. Trong thực tế, các bản vẽ thiết kế thường là kế hoạch xây dựng các tòa nhà. Bạn có thể tạo ra nhiều tòa nhà bằng cách sử dụng chung một bản thiết kế. Với mỗi tòa nhà là duy nhất nhưng lại có kiến trúc cơ bản giống nhau.

Ví dụ, một bản thiết kế có thể chỉ định số phòng mà một ngôi nhà nên có. Mỗi ngôi nhà được xây chung một bản thiết kế sẽ có số phòng giống nhau, nhưng nội thất, màu sơn, trang trí bên trong sẽ khác nhau. khiến chúng trở nên đa dạng nhưng vẫn giữ được nét liên quan thông qua bản thiết kế.

Classes có thể được coi như là một bản vẽ thiết kếvậy. Nó giúp chúng ta tạo nên một object (đối tượng). Một object là một instance (thể hiện) của class. Chính instance này mới là những thứ được dùng trong chương trình. Tương tự như một ngôi nhà là một instance của bản vẽ thiết kế ở trên. Bản vẽ chỉ là những tờ giấy còn ngôi nhà mới chính là đại diện vật lý của bản vẽ và có thể dùng để ở được.

Bản thiết kế sẽ chỉ định các thuộc tính mà đối tượng sẽ có và cũng sẽ chỉ định các hoạt động/phương thức mà đối tượng có thể sử dụng. Các thuộc tính trong Dart được gọi là các biến instance vì chúng là các biến được khởi tạo khi một đối tượng được tạo ra, tức là một instance của một lớp.

Bạn sẽ dễ hiểu hơn thông qua ví dụ sau đây!

Chúng ta sẽ tạo ra lớp (class) của con người nhé

![class](https://200lab-blog.imgix.net/2021/07/classperson.svg)

Mỗi người đều có một cái tên, giới tính và tuổi đó được gọi là thuộc tính hay là biến. Và con người cũng thực hiện những hoạt động như là đi bộ và nói chuyện,... đó được gọi là phương thức. Class của con người sẽ bao gồm những phương thức và thuộc tính đó. Để tạo ra một người instance thì chúng ta cần thuộc tính và phương thức riêng biệt cho từng người. Ví dụ: Tên: Sarah, tuổi: 25, giới tính: nữ có thể thực hiện những hoạt động như đi lại, nói chuyện,...

## 2. Classes tích hợp sẵn và classes do người dùng tự định nghĩa.

Classes trong Scala được chia thành hai loại: các classes tích hợp sẵn và các classes do người dùng tự định nghĩa.

Bạn có nhớ khi chúng ta thảo luận về `list`? Tất cả các phương thức mà chúng ta đã thảo luận thực sự là một phần của class `List` tích hợp sẵn của ngôn ngữ Dart.

Khi chúng ta định nghĩa một danh sách thực ra chúng ta đang tạo một instance, tức là đối tượng, của lớp `List`.

Mọi đối tượng là một instance của một class và tất cả các class đều đi xuống từ class cao nhất trong hệ thống phân cấp class, class `Object`.

## 3. Tạo một Class trong Dart

Từ khóa `class` sẽ được sử dụng để định nghĩa một class trong ngôn ngữ Dart. Sau từ khóa là một nhận dạng, một cái tên do bạn tự chọn. Nội dung của class sẽ nằm bên trong dấu ngoặc nhọn `{}`

![syntax tạo class trong ngôn ngữ Dart](https://200lab-blog.imgix.net/2021/07/image-95.png)

Nội dung của class sẽ bao gồm các biến instance và các phương thức.

### Các biến instance

Class `Person` của chúng ta có 3 biến instance. Đây là cách mà bạn sẽ khai báo biến instance trong ngôn ngữ Dart.



```dart
class Person{
  String name; // Declare name, initially null.
  String gender; // Declare gender, initially null.
  int age = 0; // Declare age, initially 0.
}
```

Tất cả các biến instance không được gán giá trị đều có giá trị là `null`

### Các phương thức instance

Có rất nhiều kiểu của phương thức mà bạn có thể sử dụng trong class tuy nhiên trong series này chúng ta chỉ tập trung vào các phương thức instance.

Các phương thức instance tập trung vào các đối tượng có thể truy cập các biến instance

Phương thức của chúng ta là walking và talking sẽ chỉ in tên của người đang đi bộ hoặc nói chuyện tương ứng.

```dart
class Person{
  String name; // Declare name, initially null.
  String gender; // Declare gender, initially null.
  int age = 0; // Declare age, initially 0.
  
  walking() => print('$name is walking');
  talking() => print('$name is talking');
}
```

Và chúng ta đã tạo được class đầu tiên với ba biến instance và hai phương thức.

## 4. Đối tượng của một class

Sau khi một class đã được định nghĩa, bạn có thể tạo một đối tượng bằng cách sử dụng từ khóa `new` theo sau là nhận dạng của class

![Đối tượng của một class](https://200lab-blog.imgix.net/2021/07/image-96.png)

Chúng ta tạo ra các đối tượng vì muốn làm việc với chúng theo một cách nào đó. Vì lý do này, chúng ta gán cho đối tượng một biến.

Hãy khởi tạo lớp `Person` nhé!



```dart
class Person{
  String name; 
  String gender; 
  int age = 0; 
  
  walking() => print('$name is walking');
  talking() => print('$name is talking');
}

int main() {
  // Creating an object of the Person class
  var firstPerson = Person();
}
```

### Sử dụng class members

Bây giờ chúng ta đã có đối tượng `firstPerson`. Tiếp theo chúng ta sẽ tìm hiểu cách sử dụng các biến và phương thức instance. Trong ngôn ngữ Dart, hãy sử dụng dấu chấm (`.`) để tham chiếu đến một biến hoặc phương thức instance

![Sử dụng class members](https://200lab-blog.imgix.net/2021/07/image-97.png)

Nếu bạn khởi tạo một biến instance ở nơi nó được khai báo, giá trị sẽ được đặt khi instance được tạo. Vì vậy, ngay sau khi `firstPerson` được tạo, giá trị của `age` đã được đặt bằng 0. Hãy đặt giá trị của `name` và `gender` bằng toán tử dấu chấm trong khi cũng chỉ định lại `age` một giá trị mới.



```dart
class Person{
  String name; 
  String gender; 
  int age = 0; 
  
  walking() => print('$name is walking');
  talking() => print('$name is talking');
}

int main() {
  var firstPerson = Person();

  firstPerson.name = "Sarah";
  firstPerson.gender = "female";
  firstPerson.age = 25;

  print(firstPerson.name);
  print(firstPerson.gender);
  print(firstPerson.age);
}
```



```
Output:
Sarah 
female 
25
```

Khi bạn gọi một phương thức tức là bạn gọi nó trên một đối tượng. Phương thức đó có quyền truy cập vào các phương thức và biến instance của đối tượng đó. Chúng ta hãy gọi phương thức walking và talking và xem điều gì sẽ xảy ra.



```dart
class Person{
  String name; 
  String gender; 
  int age = 0; 
  
  walking() => print('$name is walking');
  talking() => print('$name is talking');
}

int main() {
  var firstPerson = Person();

  firstPerson.name = "Sarah";
  firstPerson.gender = "female";
  firstPerson.age = 25;

  firstPerson.walking();
  firstPerson.talking();
}
```



```
Output:
Sarah is walking 
Sarah is talking
```

`walking()` được gọi trên đối tượng `firstPerson` và in cùng biến name. Vì phương thức được gọi trên một đối tượng nên nó xác định xem biến được sử dụng có phải là một trong các biến instance của đối tượng đó hay không. Vì `name` được định nghĩa trên đối tượng `firstPerson`, phương thức sẽ in ra giá trị của nó.

Trong đoạn code trên, `firstPerson.walking()` lấy giá trị của `Sarah` và in ra `Sarah is walking`. `firstPerson.talking()` cũng thực hiện tương tự và in ra `Sarah is talking`

### Nhiều đối tượng trên cùng một class

Vì các class cung cấp code có thể sử dụng lại, nên có nghĩa là chúng ta có thể tạo nhiều đối tượng bằng cách sử dụng cùng một class. Cùng với `firstPerson`, hãy tạo thêm các đối tượng của class `Person`.



```dart
class Person{
  String name; 
  String gender; 
  int age = 0; 
  
  walking() => print('$name is walking');
  talking() => print('$name is talking');
}

int main() {
  var firstPerson = Person();

  firstPerson.name = "Sarah";
  firstPerson.gender = "female";
  firstPerson.age = 25;

  // Creating an object of the Person class
  var secondPerson = Person();
  secondPerson.name = "Ben";

  // Creating an object of the Person class
  var thirdPerson = Person(); 
  thirdPerson.name = "Martin";

  // Creating an object of the Person class
  var fourthPerson = Person(); 
  fourthPerson.name = "Hannah";

  // Driver Code
  print(firstPerson.name);
  print(secondPerson.name);
  print(thirdPerson.name);
  print(fourthPerson.name);
}
```



```
Output:
Sarah 
Ben 
Martin 
Hannah
```

Mặc dù có nhiều biến `name`, nhưng tất cả chúng đều được tham chiếu bởi các đối tượng khác nhau, do đó, việc sửa đổi một biến sẽ không sửa đổi các biến khác. Đây là lý do tại sao các thuộc tính được gọi là các biến instance, bởi vì mỗi đối tượng có một tập hợp các biến đó riêng của mình.

![Nhiều đối tượng trên cùng một class](https://200lab-blog.imgix.net/2021/07/doituong.svg)

## 5. Constructors

Trong ngôn ngữ Dart, **constructor** là những hàm đặc biệt của một class có nhiệm vụ khởi tạo các biến instance của class đó.

Một constructor phải có cùng tên với class mà nó đang được khai báo và vì nó là một hàm nên nó có thể được tham số hóa.

Tuy nhiên, không giống như các hàm thông thường, các constructor không có giá trị trả về, do đó không thể có kiểu trả về.

Dart cung cấp nhiều loại constructor. Trong series này, chúng ta sẽ tìm hiểu về hai trong số chúng

1. Generative Constructor
2. Named Constructor

#### Generative Constructor

Dạng phổ biến nhất của một constructor đó chính là  generative constructor, tạo ra một instance mới của một class.



```dart
class Person{
  String name; 
  String gender; 
  int age; 
  
  // Generative Constructor
  Person(String nameC, String genderC, int ageC){
    this.name = nameC;
    this.gender = genderC;
    this.age = ageC; 
  }

  walking() => print('$name is walking');
  talking() => print('$name is talking');
}

int main() {
  var firstPerson = Person("Sarah","Female",25);
  print(firstPerson.name);
  print(firstPerson.gender);
  print(firstPerson.age);
}
```

TEXT

copy

```
Output:
Sarah 
Female 
25
```

Như đã thảo luận ở trên, chúng ta có thể tạo nhiều instance của một class duy nhất. Từ khóa `this` đề cập đến instance hiện tại.

Trên dòng 8 (`this.name = nameC;`), chúng ta đang gán giá trị `nameC` cho biến instance `name` của instance hiện tại.

Ở dòng 18, chúng ta đang tạo một instance của class `Person` bằng cách sử dụng generative constructor. Bây giờ thay vì gán riêng từng giá trị cho các biến instance, tất cả những gì chúng ta phải làm là chuyển chúng cho constructor và nó sẽ thực hiện phần còn lại.

Một generative constructor không yêu cầu bất kỳ nội dung hàm nào. Chúng ta có thể gán `this.name` làm tham số. Điều này giúp viết mã ngắn gọn hơn.



```dart
class Person{
  String name; 
  String gender; 
  int age; 
  
  // Generative Constructor
  Person(this.name, this.gender, this.age);

  walking() => print('$name is walking');
  talking() => print('$name is talking');
}

int main() {
  var firstPerson = Person("Sarah","Female",25);
  print(firstPerson.name);
  print(firstPerson.gender);
  print(firstPerson.age);
}
```



```
Output:
Sarah 
Female 
25
```

#### Named Constructor

Chúng ta có thể tạo nhiều constructor trong Dart dựa trên các tình huống khác nhau. Trong những trường hợp như vậy, tốt hơn hết là nên đặt tên cho các constructor để rõ ràng hơn.

Syntax như sau:

![Named Constructor](https://200lab-blog.imgix.net/2021/07/image-98.png)



```dart
class Person{
  String name; 
  String gender; 
  int age; 
  
  // Generative Constructor
  Person(this.name, this.gender, this.age);

  // Named Constructor
  Person.newBorn(){
    this.age = 0;
  }

  walking() => print('$name is walking');
  talking() => print('$name is talking');
}

int main() {
  var firstPerson = Person("Sarah","Female",25);
  var secondPerson = Person.newBorn();
  print(secondPerson.age);
}
```



```
Output: 
0
```

Nếu bạn không khai báo một constructor, một constructor mặc định sẽ được cung cấp cho bạn.

Một constructor mặc định không có tham số. Nó tạo một instance của một class mà không cần khởi tạo các biến instance của nó.

## 6. Getter and Setters

Getters và setters là các phương thức đặc biệt cung cấp quyền truy cập đọc và ghi vào các thuộc tính của một đối tượng. Bạn có nhớ cách chúng ta có thể truy xuất và đặt giá trị của các biến instance bằng toán tử dấu chấm (`.`) không?. Mỗi biến instance có một getter và setter ngầm mà chúng ta đã sử dụng cho đến bây giờ.

#### Getter

Getters là các hàm được sử dụng để truy xuất các giá trị thuộc tính của một đối tượng và được định nghĩa bằng cách sử dụng từ khóa `get`.

Syntax như sau:

![Getter](https://200lab-blog.imgix.net/2021/07/image-99.png)

Hãy xem một ví dụ rất đơn giản về `get`



```dart
class Person{
  String name; 
  String gender; 
  int age; 
  
  Person(this.name, this.gender, this.age);

  Person.newBorn(){
    this.age = 0;
  }

  // Getter function getting the value of name
  String get personName => name;

  walking() => print('$name is walking');
  talking() => print('$name is talking');
}

int main() {
  var firstPerson = Person("Sarah","Female",25);
  print(firstPerson.personName);
}
```



```
Output: 
Sarah
```

Trên dòng `String get personName => name;`, chúng ta đang tạo một hàm getter trả về giá trị  name của phiên bản hiện tại. Trên dòng `print(firstPerson.personName);`, chúng ta đang gọi hàm getter và output sẽ hiển thị `Sarah`.

#### Setters

Setters là các hàm được sử dụng để viết các giá trị thuộc tính của một đối tượng và được định nghĩa bằng cách sử dụng từ khóa `set`

Syntax như sau:

![Setters](https://200lab-blog.imgix.net/2021/07/image-100.png)



```dart
class Person{
  String name; 
  String gender; 
  int age; 

  String get personName => name;

  // Setter function for setting the value of age
  void set personAge(num val){
    if(val < 0){
      print("Age cannot be negative");
    } else {
      this.age = val;
    }
  } 

  walking() => print('$name is walking');
  talking() => print('$name is talking');
}

int main() {
  var firstPerson = Person();
  firstPerson.personAge = -5;
  print(firstPerson.age);
}
```



```
Output:
Age cannot be negative 
null
```

Từ dòng 9 đến dòng 15, chúng ta đang tạo một hàm setter để đặt giá trị cho `age`. Setter có một điều kiện đảm bảo rằng người dùng không nhập độ tuổi âm.

Ở dòng `firstPerson.personAge = -5;`, chúng ta đang đặt giá trị tuổi của `firstPerson` bằng cách sử dụng hàm setter `personAge`.

Hãy xem một ví dụ phức tạp hơn.

Class `Figure` có 4 thuộc tính là `left`, `top`, `width` và `height`. Chúng ta sẽ tạo hai hàm getter tính toán giá trị của hai thuộc tính mới, `right` và `bottom`.

Chúng ta cũng sẽ tạo một hàm setter cho `right`. Các thuộc tính `right` và `left` phụ thuộc lẫn nhau. Có nghĩa là dựa trên giá trị được đặt cho `right`, giá trị của bên `left` cần được sửa đổi. Điều này đang được xử lý bởi hàm setter.

Tương tự như vậy, `bottom` và `height` phụ thuộc lẫn nhau. Do đó, setter cho `bottom` sửa đổi giá trị của `height` theo giá trị của `bottom`.



```dart
class Figure {
  num left, top, width, height;

  Figure(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top - height;
  set bottom(num value) => top = value + height;
}

main() {
  var fig = Figure(3, 4, 20, 15);
  print(fig.left);
  print(fig.right);
  fig.right = 12;
  print(fig.left);
}
```



```
Output: 
3 
23 
-8
```

Trên dòng 15, giá trị của `left` là 3. Tuy nhiên, khi chúng ta gọi hàm setter `right` trên dòng `fig.right = 12;`, giá trị của `left` được sửa đổi thành -8 và được hiển thị trên dòng `print(fig.left);`.

## 7. Inheritance

Bây giờ bạn đã được làm quen với các đối tượng và class, chúng ta hãy nói về inheritance, một trong những khái niệm cốt lõi của lập trình hướng đối tượng.

Inheritance là một khái niệm mà qua đó bạn có thể tạo một class mới từ class đã tồn tại. Class mới kế thừa các thuộc tính (biến instance) và các phương thức của lớp hiện có. Class kế thừa được gọi là subclass, trong khi lớp đang được kế thừa được gọi là superclass.

> *Mỗi class là một subclass của superclass Object. Nó nằm ở đầu của hệ thống phân cấp lớp và không có superclass của chính nó.*

Có thể bạn sẽ đặt ra câu hỏi là khi nào chúng ta sử dụng inheritance?  Câu trả lời là bất cứ khi nào chúng ta bắt gặp mối quan hệ “IS A“ giữa các đối tượng thì chúng ta có thể sử dụng inheritance.

![Inheritance](https://200lab-blog.imgix.net/2021/07/inher.svg)

Trong hình minh họa trên, chúng ta có thể thấy các đối tượng có mối quan hệ “IS A” giữa chúng:

- Circle is a shape
- DART is a programming language
- Car is a vehicle

Class trước “is a” là subclass và class sau “is a” là superclass

| **Superclass**       | **Subclass** |
| -------------------- | ------------ |
| Shape                | Circle       |
| Programming Language | DART         |
| Vehicle              | Car          |



** Tham khảo tại 200lab.io



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