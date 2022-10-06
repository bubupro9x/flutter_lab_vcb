# Example các widget trong Flutter

# Container

Trước tiên là khởi tạo một container.

```dart
main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.green,
      ),
    );
  }
}
```



## width & height

Định nghĩa kích thước của container

```dart
      child: Container(
        color: Colors.green,
        width: 200,
        height: 300,
      )
```



## child

Nếu không có child thì container sẽ có kích thước lớn nhất có thể. Nếu có child thì container sẽ theo kích thước child của nó.

### Container không có child

```dart
      child: Container(
        color: Colors.green,
      ),
```



![img](https://images.viblo.asia/771edfdd-921f-489d-a637-7db28b2e701e.png)

### Container có child

```dart
    return Center(
      child: Container(
        color: Colors.green,
        child: Text(
          'Hello container',
          textDirection: TextDirection.ltr,
        ),
      ),
    );
```



![img](https://images.viblo.asia/73921935-a2df-46d8-9376-6311c592cd1b.png)

một ví dụ khác nhé

```dart
    return Center(
      child: Container(
        color: Colors.green,
        child: SizedBox(
          width: 200,
          height: 300,
        ),
      ),
    );
```



![img](https://images.viblo.asia/49e94322-4c11-433e-b802-96d992f4b87b.png)

## color

Sử dụng [Color class](https://api.flutter.dev/flutter/dart-ui/Color-class.html) hoặc [Colors class](https://api.flutter.dev/flutter/material/Colors-class.html) để thêm **background color** cho container.

```dart
      child: Container(
        color: Colors.green,
        child: SizedBox(
          width: 200,
          height: 300,
        ),
      )
```



hoặc

```dart
      child: Container(
        color: Color.fromARGB(255, 0, 0, 255),
        child: SizedBox(
          width: 200,
          height: 300,
        ),
      )
```



## aligment

Sử dụng thuộc tính aligment để đặt vị trí cho child widget của container

Các class có thể dùng làm giá trị của aligment là:

- [Aligment](https://api.flutter.dev/flutter/painting/Alignment-class.html) sử dụng hệ tọa độ với điểm gốc (0, 0) là center của container
- [AlignmentDirectional](https://api.flutter.dev/flutter/painting/AlignmentDirectional-class.html) sử dụng hệ tọa độ với điểm gốc (0, 0) là center của container, tuy nhiên phụ thuộc vàochiều viết, ví dụ ltr thì start ở bên trái và end bên phải, rtl thì start ở bên phải và end ở bên trái
- [FractionalOffset](https://api.flutter.dev/flutter/painting/FractionalOffset-class.html) sử dụng hệ tọa độ với điểm gốc (0, 0) là top left của container

### Aligment

Bạn có thể tạo mới Aligment với giá trị x, y mong muốn hoặc sử dụng các hằng số có sẵn.

```dart
      child: Container(
        color: Colors.green,
        child: Text(
          'Hello container',
          textDirection: TextDirection.ltr,
        ),
        alignment: Alignment(-1, -1),
      )
```



```dart
      child: Container(
        color: Colors.green,
        child: Text(
          'Hello container',
          textDirection: TextDirection.ltr,
        ),
        alignment: Alignment.centerLeft,
      )
```



Chi tiết về giá trị x, y của `Aligment` các bạn có thể xem tương ứng như trong hình bên dưới

![img](https://images.viblo.asia/6e5dfccc-d296-472a-a222-ca132445a271.jpg)

### AlignmentDirectional

Tương tự aligment chúng ta cũng có 2 cách là tạo mới AlignmentDirectional với giá trị x, y mong muốn hoặc sử dụng các hằng số có sẵn.

```dart
      child: Container(
        color: Colors.green,
        child: Text(
          'Hello container',
          textDirection: TextDirection.ltr,
        ),
        alignment: AlignmentDirectional(-1, -1).resolve(TextDirection.ltr),
      )
```



```dart
      child: Container(
        color: Colors.green,
        child: Text(
          'Hello container',
          textDirection: TextDirection.ltr,
        ),
        alignment: AlignmentDirectional.centerStart.resolve(TextDirection.ltr),
      )
```



Chi tiết về giá trị x, y của `AlignmentDirectional` với `TextDirection.ltr` và `TextDirection.ltr` các bạn có thể xem tương ứng như trong hình bên dưới

![img](https://images.viblo.asia/53d17e24-55b8-4d98-a666-5b9f3ff50cfb.jpg)

### FractionalOffset

Tương tự aligment chúng ta cũng có 2 cách là tạo mới FractionalOffset với giá trị x, y mong muốn hoặc sử dụng các hằng số có sẵn.

```dart
      child: Container(
        color: Colors.green,
        child: Text(
          'Hello container',
          textDirection: TextDirection.ltr,
        ),
        alignment: FractionalOffset(0.5, 0),
      )
```



```dart
      child: Container(
        color: Colors.green,
        child: Text(
          'Hello container',
          textDirection: TextDirection.ltr,
        ),
        alignment: FractionalOffset.bottomCenter,
      )
```



Chi tiết về giá trị x, y của `FractionalOffset` các bạn có thể xem tương ứng như trong hình bên dưới

![img](https://images.viblo.asia/d22737c5-0325-429f-a700-7e9adc3aac8e.jpg)

## constraints

Thuộc tính `constraints` định nghĩa ràng buộc về kích thước của `container`. Thường chúng ta sẽ sử dụng `BoxConstraints`.

Như phần trên chúng ta đã nói thì khi không có child thì container sẽ có kích thước lớn nhất có thể, tuy nhiên khi thêm thuộc tính maxHeight và maxWidth thì nó sẽ bị giới hạn lại.

```dart
      child: Container(
        color: Colors.green,
        alignment: AlignmentDirectional.centerStart.resolve(TextDirection.ltr),
        constraints: BoxConstraints(
          maxHeight: 400,
          maxWidth: 300,
        ),
      )
```



![img](https://images.viblo.asia/1bf2479e-b32b-48ed-bc51-337f7564bf4b.png)

Giờ tạo child widget thì child sẽ không thể vượt quá size của container và bị cắt

```dart
      child: Container(
        color: Colors.green,
        child: Text(
          'Hello container',
          style: TextStyle(fontSize: 140),
          textDirection: TextDirection.ltr,
        ),
        alignment: AlignmentDirectional.centerStart.resolve(TextDirection.ltr),
        constraints: BoxConstraints(
          maxHeight: 400,
          maxWidth: 300,
        ),
      )
```



![img](https://images.viblo.asia/ed684a67-2b4d-45ba-9b3c-b061c0a7a519.png)

## margin & padding

Định nghĩa khoảng cách giữa biên của container với parent bằng margin và với child bằng padding

![img](https://images.viblo.asia/ce6e000b-a4de-4385-8447-2d5d7c3490a5.png)

Có nhiều cách để định nghĩa margin và padding với EdgeInsets nên mình sẽ nêu ví dụ một số case hay dùng

```dart
        margin: EdgeInsets.symmetric( // margin theo direction
          vertical: 20,
          horizontal: 30,
        ),
        margin: EdgeInsets.fromLTRB(left, top, right, bottom) // margin cả 4 biên với giá trị chỉ định
        padding: EdgeInsets.all(20), // padding tất cả các biên
        padding: EdgeInsets.only(left: 20) // padding biên chỉ định
```



![img](https://images.viblo.asia/cf1b322f-c498-4f25-b0af-0cc4fa189ffc.png)

## decoration & foregroundDecoration

Gán một số thuộc tính về UI cho container, thứ tự ưu tiên của decoration và child được mô tả như hình vẽ dưới.

![img](https://images.viblo.asia/e107a876-bfea-4a97-92ac-135ae7d0f654.png)

Thông thường chúng ta sẽ dùng `BoxDecoration` ở đây nên mình sẽ giới thiệu các bạn một số thuộc tính của `BoxDecoration` mà chúng ta sẽ hay sử dụng đến.

### BoxDecoration

#### color

Sử dụng để set color cho box, dùng Color class hoặc Colors class giống như container

```dart
        decoration: BoxDecoration(
            color: Colors.blue,
        )
```



#### image

Dùng image để làm background cho box, image sẽ nằm trên color

```dart
      child: Container(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(
              'https://flutter.io/images/catalog-widget-placeholder.png',
            ),
          ),
        ),
      )
```



![img](https://images.viblo.asia/86d2c9cc-d8e7-4eb9-af3e-27217adfdc73.png)

#### border

Set border cho box

```dart
      child: Container(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(
              'https://flutter.io/images/catalog-widget-placeholder.png',
            ),
          ),
          border: Border.all(
            width: 10,
            color: Colors.green,
          ),
        ),
      )
```



![img](https://images.viblo.asia/82dc73eb-efbe-43bd-8f51-b2e8f29c4d87.png)

#### borderRadius

Set radius cho border của box

```dart
      child: Container(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(
              'https://flutter.io/images/catalog-widget-placeholder.png',
            ),
          ),
          border: Border.all(
            width: 10,
            color: Colors.green,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      )
```



#### shape

Set shape cho box, nhận giá trị `BoxShape.rectangle` hoặc `BoxShape.circle`

![img](https://images.viblo.asia/4e7610d0-a9e7-4c8c-8ef4-1d2ebab6dc82.png)

#### boxShadow

Set shadow cho box

#### gradient

Set gradient background cho box

#### backgroundBlendMode

Chế độ trộng background ảnh hưởng tới decoration, foregroundDecoration, child của Container đó

## transform

Sử dụng thuộc tính này để thực hiện chuyển đổi container, truyền vào là Matrux class

```dart
      child: Container(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.blue,
        ),
        transform: Matrix4.rotationX(pi/4),
      )
```



![img](https://images.viblo.asia/8a60db1a-974f-4b59-a5d0-6f4a9a6c9e62.png)





----



# Row và Column



## Row

Row là một widget được sử dụng để hiển thị các child widget theo chiều ngang. Mặc định Row widget không thể scroll được. Nếu bạn có một dòng widget và muốn chúng có thể scroll nếu không đủ chỗ, hãy xem xét sử dụng ListView Class.

Nếu chúng ta muốn hiển thị ba widget trong một hàng, chúng ta có thể tạo một Row widget như dưới đây:

![img](https://200lab-blog.imgix.net/2021/07/CC680361-5CBE-4FBE-9D65-D86C0BED0AE5.png)

## Column

Cột là một widget được sử dụng để hiển thị các child widget theo chiều dọc. Mặc định Column widget không scroll được. Nếu bạn có một cột widget và muốn chúng có thể scroll nếu chiều cao thiết bị không đủ, hãy xem xét sử dụng ListView.

Nếu chúng ta muốn hiển thị ba widget trong một cột, chúng ta có thể tạo một Column widget như bên dưới:

DART

copy

```dart
Row(
  children: [
    Container(
      color: Colors.orange,
      child: FlutterLogo(
        size: 60.0,
      ),
    ),
    Container(
      color: Colors.blue,
      child: FlutterLogo(
        size: 60.0,
      ),
    ),
    Container(
      color: Colors.purple,
      child: FlutterLogo(
        size: 60.0,
      ),
    ),
  ],
)
```

![img](https://200lab-blog.imgix.net/2021/07/F5AC5D78-3363-46F6-A673-5ED86C1B9055.png)

**Column** và **Row** có cùng thuộc tính. Vì vậy, trong các ví dụ dưới đây, chúng ta đang làm việc cùng lúc với cả hai widget.

CrossAxis trong **Column** và **Row** là gì?

```dart
Column(
  children: [
    Container(
      color: Colors.orange,
      child: FlutterLogo(
        size: 60.0,
      ),
    ),
    Container(
      color: Colors.blue,
      child: FlutterLogo(
        size: 60.0,
      ),
    ),
    Container(
      color: Colors.purple,
      child: FlutterLogo(
        size: 60.0,
      ),
    ),
  ],
)
```

![img](https://200lab-blog.imgix.net/2021/07/0DEFEDE2-22A0-474A-95B5-578DD7B641A7.jpeg)

## CrossAxisAlignment 

Chúng ta có thể sử dụng crossAxisAlignment property để căn chỉnh child widget theo hướng mong muốn, ví dụ: crossAxisAlignment.start sẽ đặt các children với cạnh bắt đầu của chúng được căn chỉnh với cạnh bắt đầu của trục chéo.

```dart
Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      color: Colors.blue,
      height: 50.0,
      width: 50.0,
    ),
    Icon(Icons.adjust, size: 50.0, color: Colors.pink),
    Icon(Icons.adjust, size: 50.0, color: Colors.purple,),
    Icon(Icons.adjust, size: 50.0, color: Colors.greenAccent,),
    Container(
      color: Colors.orange,
      height: 50.0,
      width: 50.0,
    ),
    Icon(Icons.adjust, size: 50.0, color: Colors.cyan,),
  ],
);
```

![img](https://200lab-blog.imgix.net/2021/07/ED217F97-8769-455A-B2ED-2F644A911823.png)



```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      color: Colors.blue,
      height: 50.0,
      width: 50.0,
    ),
    Icon(Icons.adjust, size: 50.0, color: Colors.pink),
    Icon(Icons.adjust, size: 50.0, color: Colors.purple,),
    Icon(Icons.adjust, size: 50.0, color: Colors.greenAccent,),
    Container(
      color: Colors.orange,
      height: 50.0,
      width: 50.0,
    ),
    Icon(Icons.adjust, size: 50.0, color: Colors.cyan,),
  ],
);
```

![img](https://200lab-blog.imgix.net/2021/07/34653EAB-ABEB-421E-9823-C3637285D01A.png)

**CrossAxisAlignment.center**

Đặt các children sao cho tâm của chúng thẳng hàng với giữa trục chéo (cross axis).

![img](https://200lab-blog.imgix.net/2021/07/1A796892-7274-457D-B17B-E8E19007DD77.jpeg)

**CrossAxisAlignment.end**

Đặt các children càng gần cuối trục chéo (cross axis) càng tốt.

![img](https://200lab-blog.imgix.net/2021/07/EA1306DF-9F73-4A08-B673-ABE0DCF685F8.jpeg)

**CrossAxisAlignment.stretch**

Yêu cầu children để fill ra full chiều dọc hoặc chiều ngang.

![img](https://200lab-blog.imgix.net/2021/07/D847DC02-FB1A-4163-847F-5F45909447CE.jpeg)

**CrossAxisAlignment.baseline**

Đặt các children dọc theo trục chéo sao cho các baseline của chúng khớp với nhau.

Bạn nên sử dụng TextBaseline Class với CrossAxisAlignment.baseline.



```dart
Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Flutter',
      style: TextStyle(
        color: Colors.yellow,
        fontSize: 30.0
      ),
    ),
    Text(
      'Flutter',
      style: TextStyle(
          color: Colors.blue,
          fontSize: 20.0
      ),
    ),
  ],
);
```

![img](https://200lab-blog.imgix.net/2021/07/27CC767C-90FC-4723-B489-60F21C6FC531.png)Without baselines



```dart
Row(
  crossAxisAlignment: CrossAxisAlignment.baseline,
  textBaseline: TextBaseline.alphabetic,
  children: [
    Text(
      'Flutter',
      style: TextStyle(
        color: Colors.yellow,
        fontSize: 30.0
      ),
    ),
    Text(
      'Flutter',
      style: TextStyle(
          color: Colors.blue,
          fontSize: 20.0
      ),
    ),
  ],
);
```

![img](https://200lab-blog.imgix.net/2021/07/B652B226-5630-4DBF-9689-E5DFAEEEEEEF.png)With baselines

## TextDirection 

Xác định thứ tự sắp xếp children theo chiều ngang và cách diễn giải`start`và`end`theo chiều ngang.



```dart
Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  textDirection: TextDirection.rtl,
  children: [
    Text(
      'Flutter',
      style: TextStyle(
        color: Colors.yellow,
        fontSize: 30.0
      ),
    ),
    Text(
      'Flutter',
      style: TextStyle(
          color: Colors.blue,
          fontSize: 20.0
      ),
    ),
  ],
);
```

![img](https://200lab-blog.imgix.net/2021/07/A8F8A34E-90BD-4278-B56F-3D8865889B3C.png)



```dart
Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  textDirection: TextDirection.ltr,
  children: [
    Text(
      'Flutter',
      style: TextStyle(
        color: Colors.yellow,
        fontSize: 30.0
      ),
    ),
    Text(
      'Flutter',
      style: TextStyle(
          color: Colors.blue,
          fontSize: 20.0
      ),
    ),
  ],
);
```

![img](https://200lab-blog.imgix.net/2021/07/9EF1ACF4-898F-4AEB-865C-020361A3AA04.png)



```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  textDirection: TextDirection.ltr,
  children: [
    Text(
      'Flutter',
      style: TextStyle(
        color: Colors.yellow,
        fontSize: 30.0
      ),
    ),
    Text(
      'Flutter',
      style: TextStyle(
          color: Colors.blue,
          fontSize: 20.0
      ),
    ),
  ],
);
```

![img](https://200lab-blog.imgix.net/2021/07/F075883A-9095-4B74-8C99-20324174E8DB.png)



```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  textDirection: TextDirection.rtl,
  children: [
    Text(
      'Flutter',
      style: TextStyle(
        color: Colors.yellow,
        fontSize: 30.0
      ),
    ),
    Text(
      'Flutter',
      style: TextStyle(
          color: Colors.blue,
          fontSize: 20.0
      ),
    ),
  ],
);
```

![img](https://200lab-blog.imgix.net/2021/07/614AFFBD-8520-42D9-A53B-E2D2D75A07CC.png)



## VerticalDirection 



Xác định thứ tự sắp xếp children theo chiều dọc và cách diễn giải `start`và`end`theo chiều dọc.

Mặc định là Vertical Direction.down.



```dart
Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  verticalDirection: VerticalDirection.down,
  children: [
    Text(
      'Flutter',
      style: TextStyle(
        color: Colors.yellow,
        fontSize: 30.0
      ),
    ),
    Text(
      'Flutter',
      style: TextStyle(
          color: Colors.blue,
          fontSize: 20.0
      ),
    ),
  ],
);
```

![img](https://200lab-blog.imgix.net/2021/07/8C2A904A-45D8-4A5B-8830-6CBBBF3A117C.png)



```dart
Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  verticalDirection: VerticalDirection.up,
  children: [
    Text(
      'Flutter',
      style: TextStyle(
        color: Colors.yellow,
        fontSize: 30.0
      ),
    ),
    Text(
      'Flutter',
      style: TextStyle(
          color: Colors.blue,
          fontSize: 20.0
      ),
    ),
  ],
);
```

![img](https://200lab-blog.imgix.net/2021/07/8B7CD3D9-52E1-4100-9485-830182E3C811.png)

MainAxis trong Row và Column là gì?

![img](https://200lab-blog.imgix.net/2021/07/7ACF916D-9FC9-4F5F-A4C4-6CC20E813C3E.jpeg)



## MainAxisAlignment



Vị trí của các child widget trên trục chính.

**MainAxisAlignment.start**

Đặt các children càng gần đầu trục chính càng tốt.

![img](https://200lab-blog.imgix.net/2021/07/BBA44222-08EB-4423-A822-480627318A76.jpeg)

**MainAxisAlignment.center**

Đặt các children càng gần giữa trục chính càng tốt.

![img](https://200lab-blog.imgix.net/2021/07/6C356879-7476-4632-AD8D-E5E3DF635B62.jpeg)

**MainAxisAlignment.end**

Đặt các children càng gần cuối trục chính càng tốt.

![img](https://200lab-blog.imgix.net/2021/07/AD1113B4-0769-4DC3-ADE4-CAB11F6E5676.jpeg)

**MainAxisAlignment.spaceAround**

Đặt đều không gian trống giữa các children cũng như một nửa không gian đó trước và sau children đầu tiên và children cuối cùng.

![img](https://200lab-blog.imgix.net/2021/07/9E147B85-DA67-4BA9-8A26-5993F53768AA.jpeg)

**MainAxisAlignment.spaceBetween**

Đặt không gian trống giữa các children cách đều nhau.

![img](https://200lab-blog.imgix.net/2021/07/FEA7988D-2E67-4265-9845-D7D54C0A01DD.jpeg)

**MainAxisAlignment.spaceEvenly**

Đặt không gian trống đồng đều giữa các children cũng như trước và sau children đầu tiên và children cuối cùng.

![img](https://200lab-blog.imgix.net/2021/07/F66C04D2-97C1-4098-8AA7-A10768917314.jpeg)



## MainAxisSize

 

Kích thước sẽ được phân bổ cho widget trên trục chính.

**MainAxisSize.max**

Tối đa hóa lượng không gian trống dọc theo trục chính, tùy thuộc vào các hạn chế về incoming layout.



```dart
Center(
  child: Container(
    color: Colors.yellow,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.blue,
          height: 50.0,
          width: 50.0,
        ),
        Icon(Icons.adjust, size: 50.0, color: Colors.pink),
        Icon(Icons.adjust, size: 50.0, color: Colors.purple,),
        Icon(Icons.adjust, size: 50.0, color: Colors.greenAccent,),
        Container(
          color: Colors.orange,
          height: 50.0,
          width: 50.0,
        ),
        Icon(Icons.adjust, size: 50.0, color: Colors.cyan,),
      ],
    ),
  ),
);
```

![img](https://200lab-blog.imgix.net/2021/07/D5508B3D-7594-4DA3-AE1F-95D3FEB8FBB1.png)



```dart
Center(
  child: Container(
    color: Colors.yellow,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.blue,
          height: 50.0,
          width: 50.0,
        ),
        Icon(Icons.adjust, size: 50.0, color: Colors.pink),
        Icon(Icons.adjust, size: 50.0, color: Colors.purple,),
        Icon(Icons.adjust, size: 50.0, color: Colors.greenAccent,),
        Container(
          color: Colors.orange,
          height: 50.0,
          width: 50.0,
        ),
        Icon(Icons.adjust, size: 50.0, color: Colors.cyan,),
      ],
    ),
  ),
);
```

![img](https://200lab-blog.imgix.net/2021/07/7C17D22A-EF49-46EC-AE36-B01D5FAB594C.png)

**MainAxisSize.min**

Giảm thiểu dung lượng trống dọc theo trục chính, tùy thuộc vào các ràng buộc về incoming layout.



```dart
Center(
  child: Container(
    color: Colors.yellow,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.blue,
          height: 50.0,
          width: 50.0,
        ),
        Icon(Icons.adjust, size: 50.0, color: Colors.pink),
        Icon(Icons.adjust, size: 50.0, color: Colors.purple,),
        Icon(Icons.adjust, size: 50.0, color: Colors.greenAccent,),
        Container(
          color: Colors.orange,
          height: 50.0,
          width: 50.0,
        ),
        Icon(Icons.adjust, size: 50.0, color: Colors.cyan,),
      ],
    ),
  ),
);
```

![img](https://200lab-blog.imgix.net/2021/07/A6F33E1B-9964-4A09-9C3E-0F55EE8BD1CA.png)



```dart
Center(
  child: Container(
    color: Colors.yellow,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.blue,
          height: 50.0,
          width: 50.0,
        ),
        Icon(Icons.adjust, size: 50.0, color: Colors.pink),
        Icon(Icons.adjust, size: 50.0, color: Colors.purple,),
        Icon(Icons.adjust, size: 50.0, color: Colors.greenAccent,),
        Container(
          color: Colors.orange,
          height: 50.0,
          width: 50.0,
        ),
        Icon(Icons.adjust, size: 50.0, color: Colors.cyan,),
      ],
    ),
  ),
);
```

![img](https://200lab-blog.imgix.net/2021/07/26826CDB-B446-4C66-AEB7-56F03FB03829.png)

** Tham khảo 200lab





----



# Stack



`Stack`widget cho phép chúng ta xếp chồng nhiều layer lên nhau. Widget có nhiều children và sắp xếp chúng từ dưới lên trên. Vì vậy, mục đầu tiên là dưới cùng và cuối cùng là trên cùng.

```dart
Stack(
  children: <Widget>[
    BottomWidget(),
    MiddleWidget(),
    TopWidget(),
  ],
),
```

![img](https://200lab-blog.imgix.net/2021/07/98A4253B-CB2F-43DF-A6CD-19513E36D443.png)

Kích thước của`Stack`là kích thước của member lớn nhất trong layer. Vì vậy, nếu layer dưới cùng bao phủ toàn bộ màn hình thì kích thước của Stack là toàn màn hình hoàn chỉnh.

Mỗi member trong Stack cần được định vị hoặc căn chỉnh toạ độ, nếu không nó sẽ kết thúc ở góc trên cùng bên trái theo mặc định.

Ví dụ, hãy lấy ba container có kích thước thu nhỏ:

```dart
Stack(
  children: <Widget>[
    // Max Size
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
      height: 300.0,
      width: 300.0,
    ),
    Container(
      color: Colors.pink,
      height: 150.0,
      width: 150.0,
    )
  ],
),
```

Điều này mang lại cho chúng ta:

![img](https://200lab-blog.imgix.net/2021/07/69C28D44-4485-421F-AADF-C8A0CF795E43.png)

Nếu bạn để ý, các container nhỏ hơn có nhiều diện tích hơn để chuyển đến và do đó mặc định ở trên cùng bên trái. Để thay đổi điều này, bạn có thể căn chỉnh hoặc định vị widget của mình bằng`Align`widget hoặc`Positioned`widget.

`Align`widget thường đưa widget đến các vị trí cao nhất. Vậy nên ví dụ: nếu chúng ta nhập trên cùng bên phải, chúng ta cần thêm padding bổ sung để giữ cho nó gọn gàng và ngăn nắp.`Positioned`widget kết hợp hai điều này và cho phép chúng ta giữ một`Positioned`widget thay vì`Align`và`Padding`.

Chúng ta sẽ thay đổi ví dụ của mình để sử dụng`Align` và `Positioned`. Hãy wrap một cách đơn giản các container của chúng ta trong`Align`và sau đó là`Positioned`widget.

**Lưu ý:**`Positioned`phải là child của`Stack`. Không thể có một widget khác ở giữa Stack và widget.

Để căn chỉnh một cách đơn giản widget:

```dart
Align(
  alignment: Alignment.topRight,
  child: Container(
    color: Colors.pink,
    height: 150.0,
    width: 150.0,
  ),
)
```

![img](https://200lab-blog.imgix.net/2021/07/21610E99-BB44-4D91-94CA-D8751B6F5806.png)

Ở đây chúng ta căn chỉnh nó ở trên cùng bên phải (top right). Thông thường, đây không phải là những gì chúng ta thực sự muốn vì chúng ta cần một số padding vào container từ các cạnh. Chúng ta có thể sử dụng padding với`Align`hoặc`Positioned`để kiểm soát chi tiết hơn.

`Positioned`có nhiều loại, chúng ta sẽ tập trung vào loại mặc định.

`Positioned` chấp nhận các giá trị từ cả bốn phía, cho child biết nó phải cách xa cạnh tương ứng đó bao xa. Nếu không có giá trị nào được đưa ra, nó sẽ thu hẹp đến kích thước thấp nhất có thể.

Tại đây, chúng ta đưa ra một giá trị ở trên cùng và bên phải. Trên thực tế, điều này có nghĩa là child sẽ cách phía trên và bên phải 40.0 và không có constraint nào khác ở các phía khác. Do đó, nó cũng được căn chỉnh về phía trên và bên phải theo định nghĩa.

```dart
Positioned(
  right: 40.0,
  top: 40.0,
  child: Container(
    color: Colors.pink,
    height: 150.0,
    width: 150.0,
  ),
)
```

Điều này mang lại cho chúng ta:

![img](https://200lab-blog.imgix.net/2021/07/88993B37-4C3E-47CA-9361-E0295D678EE1.png)

Do đó,`Positioned`là một widget tốt hơn để sử dụng trong`Stack`hơn`Align`+`Padding`nhưng không có tác hại thực sự nào cả.



----



# ListView



Đây là phương thức khởi tạo mặc định của class `ListView`. `ListView` chỉ đơn giản là lấy một danh sách các con (`children`) và làm cho nó có thể cuộn được (`scrollable`)

Code của chúng ta sẽ nhìn như thế này:

```php
ListView(
  children: <Widget>[
    ItemOne(),
    ItemTwo(),
    ItemThree(),
  ],
),
```



Cách này thường chỉ được sử dụng với một số lượng nhỏ `children`. Nếu ta sử dụng với 1 danh sách đủ dài, sẽ rất mất thời gian để triển khai chúng vào code.

## ListView.builder()

Hàm khởi tạo `builder()` xây dựng 1 danh sách lặp lại các `item`. Constructor lúc này sẽ nhận 2 tham số chính: `itemCount` đại diện cho số lượng item, và `itemBuilder` đại diện cho từng mục hiển thị trong danh sách.

Code của chúng ta sẽ nhìn như thế này:

```php
ListView.builder(
  itemCount: itemCount,
  itemBuilder: (context, position) {
    return listItem();
  },
),
```



Danh sách các item được khởi tạo một cách `lazily`, nghĩa là chỉ một số item cụ thể được tạo, và khi người dùng thực hiện thao tác cuộn xuống dưới, các item trước đó sẽ bị hủy - khá tương đồng với cách hoạt động của `RecyclerView` trong **Android**.

**Trick:** Vì các item được load một cách lazily và chỉ có 1 số item cần thiết được load, ta sẽ không thực sự cần tới `itemCount`là tham số bắt buộc và List có thể có chiều dài vô hạn.

```php
ListView.builder(
  itemBuilder: (context, position) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(position.toString(), style: TextStyle(fontSize: 22.0),),
      ),
    );
  },
),
```



## ListView.separated()

Với hàm khởi tạo `separated()`, chúng ta tạo ra 1 list các item và có thể định nghĩa hiển thị ngăn cách giữa các item

Về bản chất, chúng ta đang xây dựng 2 list đan xen với nhau - 1 là danh sách chính bao gồm các item - 2 là danh sách các `separated`.

Lưu ý rằng độ dài vô hạn không thể được sử dụng trong trường hợp này - bắt buộc chúng ta phải sử dụng `itemCount` trong hàm khởi tạo:

```php
ListView.separated(
      itemBuilder: (context, position) {
        return ListItem();
      },
      separatorBuilder: (context, position) {
        return SeparatorItem();
      },
      itemCount: itemCount,
),
```



Kiểu list này cho phép ta xác định các `separated`, có các loại `item` khác nhau tương ứng với các `separated` khác nhau, thêm hoặc xóa `separated` khi cần...

Việc triển khai này cũng có thể được sử dụng để chèn các loại item khác (ví dụ: quảng cáo) một cách dễ dàng.



**Lưu ý:** Độ dài của list `separated` sẽ nhỏ hơn 1 đơn vị so với độ dài của list các item chính vì `separated` không tồn tại sau item cuối cùng của list.

-----

# Button

![img](https://images.viblo.asia/9fa07eba-4ca5-484b-bc64-9b4c50a87243.png)



## Text Button



- Với hình trên, code của `Text Button` sẽ như sau:

```javascript
          TextButton(
             style: TextButton.styleFrom(
              //backgroundColor: Colors.white, // background
               primary: Colors.pinkAccent, // foreground
             ),
             child: Text('Text Button', style: TextStyle(fontSize: 28))
           ),
```



- Để ý hình trên chúng ta có thể thấy thuộc tính `primary` chính là nơi chúng ta thiết lập tông màu chủ đạo (foreground color) cho Button, nếu là màu hồng thì text, icon của Button mặc định sẽ là màu hồng, tất nhiên chúng ta vẫn có thể set lại color cho từng Widget bất cứ khi nào chúng ta muốn :v.

- Mặc định `Text Button` sẽ không có background color, nhưng chúng ta vẫn có thể set background color cho nó, cơ mà theo mình cũng không nên đâu ha, có thể nhà sáng chế ra thằng này sẽ buồn đó =)), thay vào đó chúng ta có thể sử dụng thằng `ElevatedButton` chẳng hạn.

  

## Elevated Button



```javascript
          ElevatedButton(
           style: ElevatedButton.styleFrom(
             primary: Colors.green, // background
             onPrimary: Colors.white, // foreground
           ),
           child: Text('Elevated Button', style: TextStyle(fontSize: 28)
         ),
```



- Với `ElevatedButton` thì thuộc tính của nó có hơi ngược đời so với thằng `Text Button`.

- Thuộc tính `primary` là nơi để set background color cho Button
- Thuộc tính `onPrimary` là nơi để set forground color cho Button

- À tất nhiên thằng này mặc định có background color nha :v

## Outlined Button



```javascript
           OutlinedButton(
             style: OutlinedButton.styleFrom(
               // backgroundColor: Colors.white,// background
               primary: Colors.orange, // foreground text
               side: BorderSide(color: Colors.orange), // foreground border
             ),
             child: Text('Outlined Button', style: TextStyle(fontSize: 28)
           ),
```



Với `Outlined Button`

- Thuộc tính `primary` sẽ là nơi để set foreground color
- Thuộc tính `backgroundColor` là nơi sẽ set background color cho button Tính ra thằng này nó cũng same same thằng `Text Button`
- Mặc định thằng này sẽ ko có background color và border đâu nha, nếu muốn chúng ta phải khai báo thuộc tính cho nó, như code mình add trên ý :v

## Thêm Icon cho Button



![img](https://images.viblo.asia/6b961820-90c2-4441-8fa9-8b920b4946f7.png)

- Trường hợp nếu Button có icon thì lúc này constructor của Button sẽ là `Prefix + Button.icon(...)`, đồng thời thuộc tính **child** sẽ không còn áp dụng được nữa, thay vào đó chúng ta sẽ sử dụng thuộc tính **label**

#### Text Button

```javascript
           TextButton.icon(
             style: TextButton.styleFrom(
               primary: Colors.pinkAccent, // text + icon color
             ),
             icon: Icon(Icons.add, size: 32),
             label: Text('Text Button', style: TextStyle(fontSize: 28)),
             onPressed: () {},
           ),
```



#### Elevated Button

```javascript
          ElevatedButton.icon(
            icon: Icon(Icons.edit, size: 32),
            label: Text('Elevated Button', style: TextStyle(fontSize: 28),
            onPressed: () {},
          ),
```



#### Outlined Button

```javascript
           OutlinedButton.icon(
             style: OutlinedButton.styleFrom(
               side: BorderSide(color: Colors.blue),
             ),
             icon: Icon(Icons.search, size: 32),
             label: Text('Outlined Button', style: TextStyle(fontSize: 28),
             onPressed: () {},
           ),
```



## Padding



![img](https://images.viblo.asia/25b7a4f1-6e11-47d2-8fa1-ee3af6b6c1a7.png)

- Trường hợp chúng ta muốn thêm **padding** cho Button thì sao, cũng đơn giản thui :v

#### Text Button

```javascript
           TextButton(
             style: TextButton.styleFrom(
               backgroundColor: Colors.white,
               padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
             ),
             child: Text('Text Button', style: TextStyle(fontSize: 28),
             onPressed: () {},
           ),
```



#### Elevated Button

```javascript
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            ),
            child: Text('Elevated Button', style: TextStyle(fontSize: 28),
            onPressed: () {},
          ),
```



#### Outlined Button

```javascript
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              side: BorderSide(color: Colors.blue), // foreground border
            ),
            child: Text('Outlined Button', style: TextStyle(fontSize: 28),
            onPressed: () {},
          ),
```



## Size



- Trường hợp chúng ta muốn add width và height cho button của mình thì sao, cũng giản đơn thôi :v

![img](https://images.viblo.asia/ab925f20-d6be-4686-b37b-02e91774cc77.png)

- Với 3 button chúng ta chỉ cần thêm thuộc tính: minimumSize: Size(width, hieght), chừng đó là đủ

#### Text Button

```javascript
           TextButton(
          style: TextButton.styleFrom(
               backgroundColor: Colors.white,
               minimumSize: Size(240, 80),
             ),
             child: Text('Text Button', style: TextStyle(fontSize: 28),
             onPressed: () {},
           ),
```



#### Elevated Button

```javascript
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(240, 80),
            ),
            child: Text('Elevated Button', style: TextStyle(fontSize: 28),
            onPressed: () {},
          ),
```



#### Outlined Button

```dart
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: Size(240, 80),
              side: BorderSide(color: Colors.blue), // foreground border
            ),
            child: Text('Outlined Button', style: TextStyle(fontSize: 28),
            onPressed: () {},
          ),
```



## Shadow



- Trường hợp chúng ta muốn thêm 1 chút shadow nhìn cho đẹp mắt thì sao

![img](https://images.viblo.asia/d16a29c1-e7c0-4a83-9664-f53818d9fd3f.png)

- Lúc này chúng ta sẽ quan tâm tới 2 thuộc tính chính: `elevation` : Là thuộc tính giúp tạo shadow cho button `shadowColor`: Color của shadow

#### Text Button

```javascript
           TextButton(
             style: TextButton.styleFrom(
               elevation: 8,
               shadowColor: Colors.blue.withOpacity(0.5),
             ),
             child: Text('Text Button', style: TextStyle(fontSize: 28),
             onPressed: () {},
           ),
```



- Trường hợp các bạn muốn color nó nhạt hoặc trong suốt hơn thì các bạn có thể chỉnh sửa lại Opacity cho nó nha, như code mình add trên ý :v

#### Elevated Button

```javascript
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 8,
              shadowColor: Colors.white,
            ),
            child: Text('Elevated Button', style: TextStyle(fontSize: 28),
            onPressed: () {},
          ),
```



#### Outlined Button

```javascript
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              elevation: 8,
              shadowColor: Colors.blue,
              side: BorderSide(color: Colors.blue), // foreground border
            ),
            child: Text('Outlined Button', style: TextStyle(fontSize: 28),
            onPressed: () {},
          ),
```



## Border



- Trường hợp chúng ta muôn thêm **border** cho các Button thì sao:

![img](https://images.viblo.asia/116cba77-87d3-4cfa-bce3-10607e8cef10.png)

- Lúc này chúng ta sẽ quan tâm tới thuộc tính **side: BorderSide(width, color)**

#### Text Button

```javascript
           TextButton(
             style: TextButton.styleFrom(
               side: BorderSide(width: 2, color: Colors.blue),
             ),
             child: Text('Text Button', style: TextStyle(fontSize: 28),
             onPressed: () {},
           ),
```



- Trường hợp các bạn muốn color nó nhạt hoặc trong suốt hơn thì các bạn có thể chỉnh sửa lại Opacity cho nó nha, như code mình add trên ý :v

#### Elevated Button

```javascript
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              side: BorderSide(width: 2, color: Colors.white),
            ),
            child: Text('Elevated Button', style: TextStyle(fontSize: 28),
            onPressed: () {},
          ),
```



#### Outlined Button

```javascript
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: 2, color: Colors.blue),
            ),
            child: Text('Outlined Button', style: TextStyle(fontSize: 28),
            onPressed: () {},
          ),
```



## Shape



- Trường hợp chúng ta muốn Button của mình trở nên tròn hơn hoặc có hình dạng khác, lúc này chúng ta chỉ cẩn thêm thuộc tính **shape** , cụ thể hơn các bạn có thể xem code dưới đây.![img](https://images.viblo.asia/51cffa42-cf06-4cc3-9209-94862ca376d0.png)

#### Text Button

```javascript
         TextButton(
           style: TextButton.styleFrom(
             side: BorderSide(width: 2, color: Colors.blue),
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(16),
             ),
           ),
           child: Text('Text Button', style: TextStyle(fontSize: 28),
           onPressed: () {},
         ),
```



- Trường hợp các bạn muốn color nó nhạt hoặc trong suốt hơn thì các bạn có thể chỉnh sửa lại Opacity cho nó nha, như code mình add trên ý :v

#### Elevated Button

```javascript
          ElevatedButton(
           style: ElevatedButton.styleFrom(
             side: BorderSide(width: 2, color: Colors.white),
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(16),
             ),
           ),
            child: Text('Elevated Button', style: TextStyle(fontSize: 28),
            onPressed: () {},
          ),
```



#### Outlined Button

```javascript
          OutlinedButton(
           style: OutlinedButton.styleFrom(
             side: BorderSide(width: 2, color: Colors.blue),
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(16),
             ),
           ),
             // shape: StadiumBorder()
            child: Text('Outlined Button', style: TextStyle(fontSize: 28),
            onPressed: () {},
          ),
```



Ngoài thằng **RoundedRectangleBorder** các bạn có thể sử dụng thằng mặc định **StadiumBorder** cũng được, nó hỗ trợ sẵn bo tròn góc cho Button luôn rồi, vừa tiện vừa ngắn code :v

## Disable button



- Trong 1 vài trường hợp, chúng ta muốn Button của mình có style như `disabled button` thì sao.![img](https://images.viblo.asia/2f382050-f3b5-4d64-89c2-4b37bbb6249e.png)
- Chà lúc này ta phải quan tâm đến 1 thằng đó là **onSurface: color**, có cái hay ở thằng này là nếu chúng ta cho nó color là màu trắng thì lúc này màu đó nó không trắng hoàn toàn mà nhìn nó hơi mờ mờ nhạt nhạt (xem hình trên), là do nó bị chèn thêm 1 chút opacity (độ mờ) đó các bạn, mục đích là khi nhòm vào là biết cái button đó nhìn như nó vừa bị disabled vậy =))

#### Text Button

```javascript
         TextButton(
             style: ElevatedButton.styleFrom(
               onSurface: Colors.white,
             ),
           child: Text('Text Button', style: TextStyle(fontSize: 28),
           onPressed: () {},
         ),
```



- Trường hợp các bạn muốn color nó nhạt hoặc trong suốt hơn thì các bạn có thể chỉnh sửa lại Opacity cho nó nha, như code mình add trên ý :v

#### Elevated Button

```javascript
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              onSurface: Colors.white,
            ),
            child: Text('Elevated Button', style: TextStyle(fontSize: 28),
            onPressed: () {},
          ),
```



#### Outlined Button

```javascript
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              onSurface: Colors.white,
              side: BorderSide(width: 2, color: Colors.white30),
            ),
             // shape: StadiumBorder()
            child: Text('Outlined Button', style: TextStyle(fontSize: 28),
            onPressed: () {},
          ),
```