# Xây dựng tư duy thiết kế giao diện

Cơ chế cốt lõi để xây dựng nên layout trong Flutter là Widget. Trong Flutter, hầu như tất cả mọi thứ đều là Widget - thậm chí là model layout cũng là Widget. Ảnh, icon, text bạn thấy trong 1 ứng dụng Flutter tất cả đều là widget. Nhưng những thứ bạn không thấy cũng là widget, ví dụ như rows, columns, và grid,… những widget này giúp cho việc sắp xếp, ràng buộc, căn chỉnh những visible widget (những widget mà bạn thấy nhìn là thấy). ( Từ đây mình sẽ gọi widget nhìn thấy được - visible widget, và widget không nhìn thấy được - invisible widget; để các bạn có thể tiện theo dõi).

Bạn có thể tạo layout bằng cách kết hợp những widget với nhau để tạo nên những widget phức tạp hơn. Ví dụ dưới đây tạo ra 3 icon với nhãn dán nằm dưới:

![img](https://media.techmaster.vn/api/static/bwZ6Np4v/Wvr4FFG3)

Dưới đây là diagram của widget tree cho UI trên:

![img](https://media.techmaster.vn/api/static/bwZ6Np4v/JAKGTzDm)

Hầu như mọi thứ bạn thấy trên ảnh có vẻ giống như bạn hình dung đúng không? Nhưng bạn thử để ý về những hình Container ( màu hồng trong ảnh) xem. Container là 1 widget class cho phép bạn có thể tùy chỉnh widget con bên trong nó. Sử dụng Container khi bạn muốn thêm padding, margin, border, màu nền…

Trong ví dụ này, mỗi Text widget được đặt bên trong 1 Container để chúng ta có thể thêm margin, cách 1 khoảng so với Icon phía trên nó. Toàn bộ Row được đặt trong Container để thêm padding xung quanh Row.

Phần còn lại của UI trong ví dụ này được điều khiển bằng properties. Ví dụ: Thay đổi màu Icon bằng cách sử dụng color property, sử dụng Text.style property để tạo Font chữ, màu, độ đậm nhạt… Column và row có những property cho phép bạn xác định cách những widget con được căn chỉnh dọc hay ngang, hay xác định độ giãn cách giữa các widget con này.

## Làm thế nào để bố trí 1 widget trong Flutter

Làm thế nào để bố trí 1 widget trong Flutter? Bài viết này sẽ chỉ ra cách bạn có thể tạo và hiển thị 1 widget đơn giản và chúng ta sẽ cùng nhau code 1 ví dụ Hello world đơn giản nhất nhé!

Trong Flutter, chúng ta sẽ mất 1 vài bước để đặt text, icon, hoặc Image vào màn hình.

### 1. Cách lựa chọn layout widget

Việc lựa chọn layout widget từ 1 tập rất nhiều layout widget hiện tại dựa trên cách mà bạn muốn căn chỉnh hay ràng buộc visible widget, vì những đặc điểm này thường được chuyển cho widget con.

Ví dụ ta sử dụng widget Center trong trường hợp muốn căn giữa content trong nó theo cả chiều dọc và chiều ngang.

### 2. Tạo 1 visible widget

Ví dụ, để tạo 1 Text widget:

```dart
Text('Hello World'),
```

Tạo 1 Image widget:

```dart
Image.asset(
'images/lake.jpg',
fit: BoxFit.cover,
),
```

Tạo 1 Icon widget:

```dart
Icon(
Icons.star,
color: Colors.red[500],
),
```

### 3. Thêm visible widget vào layout widget

Tất cả những layout widget đều có những thứ sau:

- Một thuộc tính (property) child nếu nó cần 1 widget con, ví dụ: Center, Container,
- Một thuộc tính (property) children nếu nó cần 1 tập danh sách các widget con, ví dụ: Row, Column, ListView, Stack,…

Thêm Text widget vào Center widget:

```vbnet
const Center(
child: Text('Hello World'),
),
```





### 4. Thêm layout widget vào trong trang (page) UI

Bản thân 1 app Flutter cũng là 1 widget, và hầu như đều có method `build()`. Khởi tạo và trả về 1 widget trong method `build()` sẽ giúp hiển thị widget.

#### Material apps

Đối với 1 Material app, bạn có thể sử dụng `Scaffold` widget, widget này cung cấp 1 banner mặc định, màu nền page, và có API cho việc thêm drawer, snackbar, bottom sheet… Sau đó bạn có thể thêm `Center` widget trực tiếp vào `body` property để căn giữa nội dung hiển thị trong page.

```php
class MyApp extends StatelessWidget {
const MyApp({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
}
}
```



> Chú ý: Thư viện `Material` triển khai những widget dựa theo nguyên tắc `Material Design`. Khi thiết kế UI của bạn, bạn có thể sử dụng những thư viện widget tiêu chuẩn, hoặc bạn cũng có thể sử dụng widget từ thư viện `Material`

#### Non-Material apps

Đối với một non-Material app, bạn có thể thêm Center widget vào method `build()`:

```php
class MyApp extends StatelessWidget {
const MyApp({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: const Center(
        child: Text(
          'Hello World',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
      ),
    );
}
}
```



Mặc định, non-Material không bao gồm AppBar, tiêu đề hay màu nền. Nếu bạn muốn những tính năng này trong non-Material, bạn phải tự làm.



## Bố trí các widget theo chiều ngang và dọc

Một trong những layout pattern phổ biến nhất là sắp xếp widget theo chiều dọc và ngang. Bạn có thể sử dụng `Row` widget để sắp xếp widget theo chiều ngang, và dùng `Column` để sắp xếp theo chiều dọc.

> - `Row` và `Column` là 2 trong số những layout pattern được sử dụng phổ biến nhất.
> - `Row` và `Column` cần 1 danh sách các widget con.
> - Mỗi widget con có thể là `Row` hoặc `Column`, hoặc 1 widget phức tạp nào khác.
> - Bạn có thể xác định cách `Row` và `Column` căn chỉnh widget con của nó, theo cả chiều ngang và dọc.
> - Bạn có thể nới rộng hoặc ràng buộc widget con.
> - Bạn có thể xác định cách những widget con sử dụng khoảng trống có sẵn của `Row` hoặc `Column`

Ví dụ sau đây chỉ ra cách 1 `Row` hoặc `Column` nằm trong `Row` hoặc `Column`.

![img](https://media.techmaster.vn/api/static/bwZ6Np4v/1gNpmSj5)

![img](https://media.techmaster.vn/api/static/bwZ6Np4v/5ypF-dck)

> `Row` và `Column` là các widget nguyên thủy cơ bản cho bố cục ngang và dọc — những widget con cấp thấp này cho phép tùy chỉnh tối đa. Flutter cũng cung cấp các widget chuyên biệt, cấp cao hơn có thể đủ cho nhu cầu của bạn. Ví dụ: thay vì `Row`, bạn có thể thích `ListTile`, một tiện ích dễ sử dụng với các thuộc tính cho các biểu tượng đầu và cuối, và tối đa 3 dòng văn bản. Thay vì `Column`, bạn có thể thích `ListView`, một bố cục giống như cột nhưng tự động cuộn nếu nội dung của nó quá dài để phù hợp với không gian có sẵn.



## Aligning widgets ( căn chỉnh widget)

Bạn có thể kiểm soát cách một `Row` hoặc `Column` căn chỉnh con của nó bằng cách sử dụng các thuộc tính `mainAxisAlignment` và `crossAxisAlignment`. Đối với một `Row`, trục chính chạy theo chiều ngang và trục chéo chạy theo chiều dọc. Đối với một `Column`, trục chính chạy theo chiều dọc và trục chéo chạy theo chiều ngang. Bạn có thể nhìn hình vẽ sau để hiểu rõ hơn:

![img](https://media.techmaster.vn/api/static/bwZ6Np4v/rjBherKT)

Một ví dụ khác `Row` và `Column` sử dụng với Image:

```css
Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
	Image.asset(‘images/pic1.jpg’),
	Image.asset(‘images/pic2.jpg’),
	Image.asset(‘images/pic3.jpg’),
],
);
```



|      | ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/W2NBpCZn) |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

```css
Column(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
    Image.asset('images/pic1.jpg'),
    Image.asset('images/pic2.jpg'),
    Image.asset('images/pic3.jpg'),
],
);
```



|      | ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/RdNwKjyS) |
| ---- | ------------------------------------------------------------ |
|      |                                                              |



### Sizing widgets

Khi bố cục quá lớn để vừa với một thiết bị, một hình sọc màu vàng và đen sẽ xuất hiện dọc theo cạnh bị ảnh hưởng. Đây là một ví dụ về `Row` quá rộng:

|      | ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/3bhZ5nxP) |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

Các widget con có thể được định kích thước để vừa với một `Row` hoặc `Column` bằng cách sử dụng `Expanded` widget. Để sửa ví dụ trước trong đó hàng hình ảnh quá rộng đối với mức hiển thị của nó, hãy bọc mỗi hình ảnh bằng một `Expanded` widget.

```css
Row(
crossAxisAlignment: CrossAxisAlignment.center,
children: [
    Expanded(
      child: Image.asset('images/pic1.jpg'),
    ),
    Expanded(
      child: Image.asset('images/pic2.jpg'),
    ),
    Expanded(
      child: Image.asset('images/pic3.jpg'),
    ),
],
);
```



|      | ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/iDIXXQo_) |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

Nếu bạn muốn một widget chiếm không gian gấp đôi so với các widget anh chị em của nó. Để làm điều này, hãy sử dụng thuộc tính `flex` trong `Expanded` widget, một số nguyên xác định hệ số flex cho widget con. Hệ số flex mặc định là 1. Đoạn mã sau đặt hệ số flex của hình ảnh giữa thành 2:

```css
Row(
crossAxisAlignment: CrossAxisAlignment.center,
children: [
    Expanded(
      child: Image.asset('images/pic1.jpg'),
    ),
    Expanded(
      flex: 2,
      child: Image.asset('images/pic2.jpg'),
    ),
    Expanded(
      child: Image.asset('images/pic3.jpg'),
    ),
],
);
```



|      | ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/n8fTBwHU) |
| ---- | ------------------------------------------------------------ |
|      |                                                              |



### Packing widgets

Theo mặc định, một `Row` hoặc `Column` chiếm càng nhiều không gian dọc theo trục chính của nó càng tốt, nhưng nếu bạn muốn kéo các widget con lại gần nhau, hãy đặt `mainAxisSize` của nó thành `MainAxisSize.min`. Ví dụ sau sử dụng thuộc tính này để đóng gói các hình ngôi sao lại với nhau.

```scss
Row(
mainAxisSize: MainAxisSize.min,
children: [
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    const Icon(Icons.star, color: Colors.black),
    const Icon(Icons.star, color: Colors.black),
],
)
```



|      | ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/ETLso0p5) |
| ---- | ------------------------------------------------------------ |
|      |                                                              |



### Nesting rows and columns

Layout framework cho phép bạn lồng các hàng và cột vào bên trong các hàng và cột tùy thích. Hãy xem đoạn code cho phần được phác thảo của bố cục sau:

![img](https://media.techmaster.vn/api/static/bwZ6Np4v/KdtDYOS8)

Phần được phác thảo được thực hiện thành hai hàng. Hàng xếp hạng chứa năm sao và số lượng đánh giá. Hàng biểu tượng chứa ba cột biểu tượng và văn bản.

Widget tree cho `Row` chứa năm sao như sau:

|      | ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/o8_U6Yr_) |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

Và mã code cho `Row` chứa năm sao và số lượng đánh giá như sau:

```php
var stars = Row(
mainAxisSize: MainAxisSize.min,
children: [
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    const Icon(Icons.star, color: Colors.black),
    const Icon(Icons.star, color: Colors.black),
],
);

final ratings = Container(
padding: const EdgeInsets.all(20),
child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      stars,
      const Text(
        '170 Reviews',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: 20,
        ),
      ),
    ],
),
);
```



> Để giảm thiểu sự nhầm lẫn trực quan có thể do code các layout lồng nhau nhiều, hãy viết các phần của giao diện người dùng trong các biến và hàm.

Hàng biểu tượng, bên dưới hàng xếp hạng, có 3 cột, mỗi cột chứa một biểu tượng và hai dòng văn bản, như bạn có thể thấy trong widget tree con của nó:

![img](https://media.techmaster.vn/api/static/bwZ6Np4v/WMt7-EDv)

Mã code như sau:

```php
const descTextStyle = TextStyle(
color: Colors.black,
fontWeight: FontWeight.w800,
fontFamily: 'Roboto',
letterSpacing: 0.5,
fontSize: 18,
height: 2,
);

// DefaultTextStyle.merge() allows you to create a default text
// style that is inherited by its child and all subsequent children.
final iconList = DefaultTextStyle.merge(
style: descTextStyle,
child: Container(
    padding: const EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(Icons.kitchen, color: Colors.green[500]),
            const Text('PREP:'),
            const Text('25 min'),
          ],
        ),
        Column(
          children: [
            Icon(Icons.timer, color: Colors.green[500]),
            const Text('COOK:'),
            const Text('1 hr'),
          ],
        ),
        Column(
          children: [
            Icon(Icons.restaurant, color: Colors.green[500]),
            const Text('FEEDS:'),
            const Text('4-6'),
          ],
        ),
      ],
    ),
),
);
```



Ta có mã code cho phần hình bên trái như sau:

```php
final leftColumn = Container(
padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
child: Column(
    children: [
      titleText,
      subTitle,
      ratings,
      iconList,
    ],
),
);
```



Mã code cho toàn bộ UI của chúng ta như sau:

```php
body: Center(
child: Container(
    margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
    height: 600,
    child: Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 440,
            child: leftColumn,
          ),
          mainImage,
        ],
      ),
    ),
),
),
```





## Common layout widgets - Một số widget phổ biến thường gặp



### Standard widgets

- Container: Có thể thêm padding, margins, borders, background color, hoặc decorations vào a widget.
- GridView: Tạo widgets dạng lưới có khả năng scroll.
- ListView: Tạo widgets dạng danh sách có khả năng scroll.
- Stack: Tạo widget có khả năng đè lên trên các widget khác.



### Material widgets

- Card: Tạo 1 widget hình hộp được bo góc và có đổ bóng.
- ListTile: Tạo widget với 3 dang text, có leading và trailing icon trong 1 dòng.



### Container

Rất nhiều layout sử dụng `Container`, `Container` dùng để padding, thêm viền, margin… Bạn có thể thay màu nền của thiết bị bằng cách đổi toàn bộ layout thành `Container` và đổi màu nền hoặc ảnh.

#### Tóm tắt về `Container`

- Thêm padding, margins, borders
- Đổi màu background color hoặc image
- Bao gồm một child widget, nhưng child có thể là Row, Column, hoặc thậm chi là root của một widget tree

|      | ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/fSlcfaol) |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

#### Examples (Container)

Ví dụ dưới tạo 1 `Column` với 2 `Row`, mỗi `Row` lại gồm 2 hình ảnh. `Container` được sử dụng để đổi màu của `Column` thành màu xám.

```php
Widget _buildImageColumn() {
return Container(
    decoration: const BoxDecoration(
      color: Colors.black26,
    ),
    child: Column(
      children: [
        _buildImageRow(1),
        _buildImageRow(3),
      ],
    ),
);
}
```



|      | ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/7AWC_-XH) |
| ---- | ------------------------------------------------------------ |
|      |                                                              |



### GridView

Sử dụng GridView để sắp xếp các widget dưới dạng danh sách hai chiều. GridView cung cấp hai danh sách tạo sẵn hoặc bạn có thể tạo lưới tùy chỉnh của riêng mình. Khi GridView phát hiện thấy nội dung của nó quá dài để vừa với render box, nó sẽ tự động cuộn.

#### Tóm tắt (GridView)

- Đặt các widget trong một danh sách dạng lưới
- Phát hiện khi nội dung vượt quá render box và tự động cung cấp chức năng cuộn
- Tạo lưới tùy chỉnh của riêng bạn hoặc sử dụng một trong các lưới được cung cấp:
  - GridView.count cho phép bạn chỉ định số lượng cột
  - GridView.extent cho phép bạn chỉ định chiều rộng pixel tối đa của một ô

> Lưu ý: Khi hiển thị danh sách hai chiều, trong đó điều quan trọng là hàng và cột mà ô chiếm dùng để chứa dữ liệu, hãy sử dụng Bảng hoặc Bảng dữ liệu.

#### Examples (GridView)

| Sử dụng GridView.extent để tạo danh Sách lưới với các ô có chiều rộng tối đa là 150 pixel. | ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/Nulsnfts) |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| Sử dụng GridView.count để tạo danh sách dạng lưới với 2 ô ở chế độ dọc và 3 ô ở chế độ ngang. Tiêu đề được tạo bằng cách đặt thuộc tính footer cho mỗi GridTile. | ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/e6pn5mvg) |

```php
Widget _buildGrid() => GridView.extent(
    maxCrossAxisExtent: 150,
    padding: const EdgeInsets.all(4),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: _buildGridTileList(30));

// The images are saved with names pic0.jpg, pic1.jpg...pic29.jpg.
// The List.generate() constructor allows an easy way to create
// a list when objects have a predictable naming pattern.
List<Container> _buildGridTileList(int count) => List.generate(
    count, (i) => Container(child: Image.asset('images/pic$i.jpg')));
```





### ListView

ListView, 1 widget giống như Column, nhưng tự có khả năng cuộn khi nội dung quá dài so với render box của nó.

#### Tóm tắt (ListView)

- Một Column được thiết kế cho việc tổ chức 1 danh sách các hộp, tiệm.
- Có thể đặt theo chiều dọc hoặc ngang.
- Phát hiện khi nội dung không vừa và tự động cuộn.
- Ít phải cấu hình hơn Column, nhưng dễ sử dụng và trợ giúp việc scroll.

#### Examples (ListView)

| Sử dụng `ListView` để hiển thị danh sách công việc kinh doanh với `ListTiles`. Một thanh ngăn `Divider` giúp chia tách các rạp phim với danh sách nhà hàng | ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/bbQlXLCC) |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| Sử dụng ListView để hiện danh sách `Colors` từ `Material Design palette`. | ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/LWbTpuRw) |

```css
Widget _buildList() {
return ListView(
    children: [
      _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
      _tile('The Castro Theater', '429 Castro St', Icons.theaters),
      _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
      _tile('Roxie Theater', '3117 16th St', Icons.theaters),
      _tile('United Artists Stonestown Twin', '501 Buckingham Way',
          Icons.theaters),
      _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
      const Divider(),
      _tile('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant),
      _tile('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
      _tile(
          'Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
      _tile('La Ciccia', '291 30th St', Icons.restaurant),
    ],
);
}

ListTile _tile(String title, String subtitle, IconData icon) {
return ListTile(
    title: Text(title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(subtitle),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
);
}
```





### Stack

Sử dụng `Stack` để sắp xếp các widget ở phía trên các widget khác - thường là 1 `Image`. `Stack` có thể chiếm toàn bộ widget phía dưới nó.

#### Tóm tắt (Stack)

- Sử dụng cho việc chổng các widget lên nhau.
- Widget đầu tiên trong danh sách của `Stack` gọi là widget base, các widget tiếp sau trong danh sách widget sẽ được đặt đè lên trên widget Base.
- Content của `Stack` không thể cuộn.
- Bạn có thể chọn cách cắt bớt các widget con để hiển thị quá render box.

#### Examples (Stack)

| ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/2iFwZukh) | Sử dụng `Stack` để đè 1 `Container` ( Hiện 1 `Text` với background màu đen trong suốt) lên phía trên của một `CirlceAvatar`. Vị trí của `Text` sử dụng `alignment` property hoặc `Alignments` widget . |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/TPuj-x_S) | Sử dụng ‘Stack` để đè 1 gradient lên phía trên hình ảnh. Gradient này đảm bảo cho việc hiển thị icon của toolbar phân tách rõ với hình ảnh bên dưới. |

```php
Widget _buildStack() {
return Stack(
    alignment: const Alignment(0.6, 0.6),
    children: [
      const CircleAvatar(
        backgroundImage: AssetImage('images/pic.jpg'),
        radius: 100,
      ),
      Container(
        decoration: const BoxDecoration(
          color: Colors.black45,
        ),
        child: const Text(
          'Mia B',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ],
);
}
```





### Card

`Card`, từ thư viện `Material`, chứa các thông tin liên quan và có thể được tạo từ hầu hết các widget, nhưng thường được sử dụng với `ListTile`. `Card` có một widget con, nhưng widget con của nó có thể là một ‘Colum `, ‘Row`, `ListView`, `GridView` hoặc các widget con khác hỗ trợ list widget. Theo mặc định, một `Card` thu nhỏ kích thước của nó thành 0 x 0 pixel. Bạn có thể sử dụng `SizedBox` để giới hạn kích thước của thẻ.

Trong Flutter, `Card` có các góc bo tròn và bóng đổ, tạo hiệu ứng 3D. Thay đổi thuộc tính `elevation` của `Card` cho phép bạn kiểm soát hiệu ứng đổ bóng. Ví dụ: đặt `elevation` lên 24, trực quan nâng `Card` lên khỏi bề mặt và làm cho bóng trở nên phân tán hơn. Để biết danh sách các giá trị độ cao được hỗ trợ, hãy xem `Elevation` trong nguyên lý `Material`. Việc chỉ định một giá trị không được hỗ trợ sẽ vô hiệu hóa hoàn toàn bóng đổ.

#### Tóm tắt (Card).

- Triển khai `Material card`
- Được sử dụng để trình bày các thông tin liên quan
- Chấp nhận một widget con, nhưng phần tử đó có thể là `Colum`, `Row`, `ListView`, `GridView` hoặc các widget con khác hỗ trợ list widget
- Được hiển thị với các góc bo tròn và bóng đổ
- Nội dung của `Card` không thể cuộn
- Từ thư viện `Material`

#### Examples (Card)

| ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/sF9-JdF_) | Một `Card` bao gồm 3 `ListTiles` và giới hạn kích thước bằng các bọc trong một `SizedBox`. Một thanh ngăn `Divider` giúp phân tách 2 `ListTiles` với nhau. |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/TH0GUev-) | Một `Card` bao gồm hình ảnh và text.                         |

```php
Widget _buildCard() {
return SizedBox(
    height: 210,
    child: Card(
      child: Column(
        children: [
          ListTile(
            title: const Text(
              '1625 Main Street',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: const Text('My City, CA 99984'),
            leading: Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500],
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text(
              '(408) 555-1212',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            leading: Icon(
              Icons.contact_phone,
              color: Colors.blue[500],
            ),
          ),
          ListTile(
            title: const Text('costa@example.com'),
            leading: Icon(
              Icons.contact_mail,
              color: Colors.blue[500],
            ),
          ),
        ],
      ),
    ),
);
}
```





### ListTile

Sử dụng `ListTile`, một widget giống `Row` từ thư viện `Material`, để dễ dàng tạo một hàng chứa tối đa 3 dòng văn bản và các biểu tượng đầu và cuối tùy chọn. `ListTile` được sử dụng phổ biến nhất trong `Card` hoặc `ListView`, nhưng có thể được sử dụng ở những nơi khác.

#### Tóm tắt (ListTile)

- Một widget giống `Row` chứa tối đa 3 dòng văn bản và các biểu tượng tùy chọn
- Ít cấu hình hơn `Row`, nhưng dễ sử dụng hơn
- Từ thư viện `Material`



### Examples (ListTile)

| ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/sF9-JdF_) | Một `Card` bao gồm 3 `ListTiles`.                            |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![img](https://media.techmaster.vn/api/static/bwZ6Np4v/6iOQuiWX) | Sử dụng `ListTile` để tạo danh sách gồm 3 button dạng dropdown. |





** Tham khảo tài liệu tại Techmaster.vn