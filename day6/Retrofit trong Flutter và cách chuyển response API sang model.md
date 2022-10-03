# Retrofit trong Flutter và cách chuyển response API sang model

**Retrofit là gì ?**

Trong Android, Retrofit là một HTTP client type-safe cho Android & Java, giúp dễ dàng kết nối đến một dịch vụ REST API trên web bằng cách chuyển đổi API thành Java Interface.

Theo khái niệm chung thì Retrofit là một thư viện dùng để gọi Rest API bằng cách gửi các dynamic header, parameter, print request và response theo cách bảo mật ( secured way).

**Cách sử dụng Retrofit trong Flutter**

Hãy tạo một project mới để sử dụng retrofit Flutter !

**+ Tích hợp thư viện**
Trong file : pubspec.yaml, thêm các thư viện package : retrofit, dio, logger, retrofit_generator, build_runner, json_annotation, json_serializable ; khai báo các thư viện như hình dưới :

```yaml
dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^0.1.3
  retrofit: ^1.3.4
  logger: ^0.9.1
  dio: ^3.0.9
  json_annotation: ^3.0.1

dev_dependencies:
  retrofit_generator: ^1.3.7+2
  build_runner: ^1.10.0
  json_serializable: ^3.3.0

  flutter_test:
    sdk: flutter
```



**+ Tạo các file**

\+ Tạo package : services, trong package tạo file : post_api_service.dart có nội dụng như bên dưới :

```dart
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;
  @GET("/posts")
  Future<List<Post>> getTasks();

}
@JsonSerializable()
class Post{
  int userId;
  int id;
  String body;
  String title;
  Post({this.userId, this.id, this.body, this.title});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
```



bạn thấy báo rất nhiều lỗi ?
Đừng quá lo lắng, chạy dòng lệnh trong mục terminal : flutter pub run build_runner build
Trong quá trình chạy bạn thấy báo lỗi : Missing “part ‘post_api_service.g.dart’;”. ?

Thêm khai báo : part ‘post_api_service.g.dart và tiếp tục chạy tiếp dòng lệnh trên : flutter pub run build_runner build
Khi đó file post_api_service.g.dart sẽ được tạo ra

**Nói thêm về: Chuyển đổi JSON format sang Dart file**

Có hai cách dùng đển chuyển Json format sang dart file. Những source trong mục này , chỉ để dùng diễn giải không sử dụng trong project.

**Cách 1: Manual Serialization**

Đây là các mà chúng ta vẫn hay làm khi sử dụng http thuần với bloc, sử dụng các hàm ví dụ như fromJson, dưới đây là ví dụ :

Tạo file post.dart , có nội dung như sau :

```dart
class Post {
  int userId; 
  int postId; 
  String title; 
  String body; 
  
  Post({this.userId, this.postId, this.title, this.body});
  
  factory Post.fromJson(Map<String, dynamic> json)
  {
    return Post(
      userId: json["userId"],
      postId: json['id'],
      title: json["title"],
      body: json['body'],
    );
  }
  
  Map<String, dynamic> toJson()=>
      {
        'userId': userId,
        'id': postId, 
        'title': title, 
        'body': body,
      };
}
```



**Cách 2 – Automatic Serialization**

Trước khi để sử dụng cách này thì bạn cần khai báo các thư viện như json_annotation và json_serializable như ở trên.

```dart
@JsonSerializable()
class Post {
  int userId;
  int postId;
  String title;
  String body;

  Post({this.userId, this.postId, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);


  Map<String, dynamic> toJson()=> _$PostToJson(this);
}
```



Bạn thấy một số lỗi ?
Tiếp tuc chạy dòng lệnh trong mục terminal : flutter pub run build_runner build
Trong quá trình chạy bạn thấy báo lỗi : Missing “part ‘post.g.dart’;”.

Thêm khai báo đó: part ‘post.g.dart’; và tiếp tục chạy tiếp dòng lệnh trên : flutter pub run build_runner build

Nhận xét : Phương pháp automatic serialization dùng cho các dự án trung bình và lớn

**Xây dựng UI**
Trong file main.dart, bạn có thể dùng đoạn code bên dưới :

```dart
import 'package:flutter/material.dart';

import 'services/post_api_service.dart';
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reddit Application',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          centerTitle: true,
          title: Text(
            'Posts',
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: _buildBody(context),
      ),
    );
  }


  FutureBuilder<List<Post>> _buildBody(BuildContext context) {
    final client = RestClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<List<Post>>(

      future: client.getTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Post> posts = snapshot.data;
          return _buildPosts(context, posts);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext context, List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              posts[index].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts[index].body),
          ),
        );
      },
    );
  }
}
```



Dưới đây là kết quả :

![img](https://baoflutter.com/wp-content/uploads/2020/06/retrofit_flutter.png)

Về phần source code bạn tham khảo trên link Github của Báo Flutter => [here](https://github.com/PhamBao91/baoflutter/tree/master/retrofit_src)

Kết luận : Retrofit là khái niệm ban đầu được dùng cho Android, tuy nhiên khi dùng trên Flutter framework, nó cũng phát huy tác dụng trên iOS. Sử dụng retrofit có rất nhiều ưu việt, nó phù hợp với các dự án trung bình và lớn bởi tính tiện dụng của nó.

** Tham khảo tại baoflutter.com