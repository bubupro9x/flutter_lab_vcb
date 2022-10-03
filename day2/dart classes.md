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