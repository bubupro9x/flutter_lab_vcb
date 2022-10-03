# Dart Variables

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
