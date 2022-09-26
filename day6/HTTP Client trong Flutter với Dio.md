# HTTP Client trong Flutter với Dio

Dio là một công cụ HTTP Client tuyệt vời cho Flutter. Nó hỗ trợ `interceptors`, `Global configuration`, `FormData`, `Request Cancellation`, `File downloading`, `Timeout`, vân vân và mây mây.

## Bắt đầu với **Flutter**

### Add dependency

```yaml
dependencies:
  dio: ^4.0.6
```

### Một chiếc ví dụ về cách sử dụng đơn giãn

```dart
import 'package:dio/dio.dart';
void getHttp() async {
  try {
    var response = await Dio().get('http://www.google.com');
    /// tạo một request call đến http://www.google.com với phương thức GET
    print(response);
  } catch (e) {
    print(e);
  }
}
```

## Ví dụ

#### `GET`

```dart
Response response;
var dio = Dio();
response = await dio.get('/test?id=12&name=wendu');
print(response.data.toString());
// Optionally the request above could also be done as
response = await dio.get('/test', queryParameters: {'id': 12, 'name': 'wendu'});
print(response.data.toString());
```

#### `POST`

```dart
response = await dio.post('/test', data: {'id': 12, 'name': 'wendu'});
```

#### `DOWNLOAD`

```dart
response = await dio.download('https://www.google.com/', './xx.html');
```

#### `FORM DATA`

```dart
var formData = FormData.fromMap({
  'name': 'wendux',
  'age': 25,
});
var response = await dio.post('/info', data: formData);
```

#### `UPLOADING MULTIPLE FILES`

```dart
var formData = FormData.fromMap({
  'name': 'wendux',
  'age': 25,
  'file': await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),
  'files': [
    await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
    await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
  ]
});
var response = await dio.post('/info', data: formData);
```

#### `LẮNG NGHE TIẾN TRÌNH UPLOAD`

```dart
response = await dio.post(
  'http://www.dtworkroom.com/doris/1/2.0.0/test',
  data: {'aa': 'bb' * 22},
  onSendProgress: (int sent, int total) {
    print('$sent $total');
  },
);
```

#### `CÁC FUTURE CỦA DIO`

```dart
Future<Response> get(...)

Future<Response> post(...)

Future<Response> put(...)

Future<Response> delete(...)

Future<Response> head(...)

Future<Response> put(...)

Future<Response> path(...)

Future<Response> download(...)

Future<Response> fetch(RequestOptions)
```

## Các APIs của Dio

Khi khởi tạo `instance` của `Dio`, bạn cũng có thể khỏi tạo cùng với đối tượng `BaseOptions`. 

Trong trường hợp mình muốn định nghĩa một số thuộc tính cho `dio` của mình như `connectTimeout`, `base url`, thì mình có thể làm như sau.

```dart
var dio = Dio(); // with default Options

// Set default configs
dio.options.baseUrl = 'https://www.xx.com/api';
dio.options.connectTimeout = 5000; //5s
dio.options.receiveTimeout = 3000;

// or new Dio with a BaseOptions instance.
var options = BaseOptions(
  baseUrl: 'https://www.xx.com/api',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);
Dio dio = Dio(options);
```

Ngoài ra `BaseOptions` còn khá nhiều thuộc tính hay ho. Bạn có thể tham khảo [tại đây](https://pub.dev/documentation/dio/latest/dio/BaseOptions-class.html).

## Request Options

Một trong những phần quan trọng không thể thiếu trong một request http chính là `Request Options`. Tương tự với những ngôn ngữ khác. `Dio` cũng có cho mình đầy đủ các thuộc tính trong một `request`

```dart
{
  /// Http method.
  String method;

  /// Request base url, it can contain sub path, like: 'https://www.google.com/api/'.
  String baseUrl;

  /// Http request headers.
  Map<String, dynamic> headers;

   /// Timeout in milliseconds for opening  url.
  int connectTimeout;

   ///  Whenever more than [receiveTimeout] (in milliseconds) passes between two events from response stream,
  ///  [Dio] will throw the [DioError] with [DioErrorType.RECEIVE_TIMEOUT].
  ///  Note: This is not the receiving time limitation.
  int receiveTimeout;

  /// Request data, can be any type.
  T data;

  /// If the `path` starts with 'http(s)', the `baseURL` will be ignored, otherwise,
  /// it will be combined and then resolved with the baseUrl.
  String path='';

  /// The request Content-Type. The default value is 'application/json; charset=utf-8'.
  /// If you want to encode request body with 'application/x-www-form-urlencoded',
  /// you can set [Headers.formUrlEncodedContentType], and [Dio]
  /// will automatically encode the request body.
  String contentType;

  /// [responseType] indicates the type of data that the server will respond with
  /// options which defined in [ResponseType] are `JSON`, `STREAM`, `PLAIN`.
  ///
  /// The default value is `JSON`, dio will parse response string to json object automatically
  /// when the content-type of response is 'application/json'.
  ///
  /// If you want to receive response data with binary bytes, for example,
  /// downloading a image, use `STREAM`.
  ///
  /// If you want to receive the response data with String, use `PLAIN`.
  ResponseType responseType;

  /// `validateStatus` defines whether the request is successful for a given
  /// HTTP response status code. If `validateStatus` returns `true` ,
  /// the request will be perceived as successful; otherwise, considered as failed.
  ValidateStatus validateStatus;

  /// Custom field that you can retrieve it later in [Interceptor]、[Transformer] and the   [Response] object.
  Map<String, dynamic> extra;
  
  /// Common query parameters
  Map<String, dynamic /*String|Iterable<String>*/ > queryParameters;  
  
   /// [collectionFormat] indicates the format of collection data in request
  /// options which defined in [CollectionFormat] are `csv`, `ssv`, `tsv`, `pipes`, `multi`,`multiCompatible`.
  /// The default value is `multiCompatible`
  late CollectionFormat collectionFormat;

}
```

## Response Schema

Một cấu trúc `response` trả về khi sử dụng `Dio` sẽ tương tự thế này

```dart
{
  /// Response body. may have been transformed, please refer to [ResponseType].
  T? data;
  /// Response headers.
  Headers headers;
  /// The corresponding request info.
  Options request;
  /// Http status code.
  int? statusCode;
  String? statusMessage;
  /// Whether redirect 
  bool? isRedirect;  
  /// redirect info    
  List<RedirectInfo> redirects ;
  /// Returns the final real request uri (maybe redirect). 
  Uri realUri;    
  /// Custom field that you can retrieve it later in `then`.
  Map<String, dynamic> extra;
}
```

Khi request của bạn thành công, bạn sẽ nhận được `response` như ở dưới.

```dart
Response response = await dio.get('https://www.google.com');
print(response.data);
print(response.headers);
print(response.requestOptions);
print(response.statusCode);
```

## Interceptors

Một trong những thứ đồ chơi không thể hay ho hơn đó chính là `interceptors` của `dio`.

Trong trường hợp bạn muốn chặn các bước `onRequest`, `onResponse`, `onError` để thực hiện một tác vụ gì đó bạn mong muốn. Một số trường hợp để áp dụng như in `debugLog`, `refresh token`.

```dart
dio.interceptors.add(InterceptorsWrapper(
    onRequest:(options, handler){
     // Do something before request is sent
     return handler.next(options); //continue
     // If you want to resolve the request with some custom data，
     // you can resolve a `Response` object eg: `handler.resolve(response)`.
     // If you want to reject the request with a error message,
     // you can reject a `DioError` object eg: `handler.reject(dioError)`
    },
    onResponse:(response,handler) {
     // Do something with response data
     return handler.next(response); // continue
     // If you want to reject the request with a error message,
     // you can reject a `DioError` object eg: `handler.reject(dioError)` 
    },
    onError: (DioError e, handler) {
     // Do something with response error
     return  handler.next(e);//continue
     // If you want to resolve the request with some custom data，
     // you can resolve a `Response` object eg: `handler.resolve(response)`.  
    }
));
```

Ví dụ về sử dụng `interceptor` để in log của các request.

```dart
import 'package:dio/dio.dart';
class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }
  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) {
    print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    return super.onError(err, handler);
  }
}
/// Sau đó bạn hãy app CustomInterceptors vào dio của bạn
/// dio.interceptors.add(CustomInterceptors());
```

Hoặc có sẵn một `interceptor` để làm chuyện này. Bạn tham khảo code ở dưới.

```dart
dio.interceptors.add(LogInterceptor(responseBody: false));
```



Ngoài ra trên `pub.dev` còn có rất nhiều packages về `interceptor` của dio như `cache request`, `refresh token`. Bạn có thể tham khảo.

## Handling Errors

Khi có lỗi sảy ra, `dio` sẽ quăng ra một `exception` là `DioError`.

```dart
try {
  //404
  await dio.get('https://wendux.github.io/xsddddd');
} on DioError catch (e) {
  // The request was made and the server responded with a status code
  // that falls out of the range of 2xx and is also not 304.
  if (e.response != null) {
    print(e.response.data)
    print(e.response.headers)
    print(e.response.requestOptions)
  } else {
    // Something happened in setting up or sending the request that triggered an Error
    print(e.requestOptions)
    print(e.message)
  }
}
```



## Using application/x-www-form-urlencoded format

Mặc định, `dio` sẽ request dữ liệu thành `JSON`. Vì thế, để gửi data theo format `application/x-www-form-urlencoded` bạn sẽ cần làm như thế này.

```dart
//Instance level
dio.options.contentType= Headers.formUrlEncodedContentType;
//or works once
dio.post(
  '/info',
  data: {'id': 5},
  options: Options(contentType: Headers.formUrlEncodedContentType),
);
```

## Sending FormData

Bạn cũng có thể gửi `FormData` với `dio`. 

```dart
var formData = FormData.fromMap({
  'name': 'wendux',
  'age': 25,
  'file': await MultipartFile.fromFile('./text.txt',filename: 'upload.txt')
});
response = await dio.post('/info', data: formData);
```

#### Multiple files upload

```dart
FormData.fromMap({
  'files': [
    MultipartFile.fromFileSync('./example/upload.txt', filename: 'upload.txt'),
    MultipartFile.fromFileSync('./example/upload.txt', filename: 'upload.txt'),
  ]
});
```

#### Upload file với key

```dart
var formData = FormData();
formData.files.addAll([
  MapEntry('files',
    MultipartFile.fromFileSync('./example/upload.txt',filename: 'upload.txt'),
  ),
  MapEntry('files',
    MultipartFile.fromFileSync('./example/upload.txt',filename: 'upload.txt'),
  ),
]);
```