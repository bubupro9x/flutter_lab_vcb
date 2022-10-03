# Tích hợp thư viện Notification vào dự án

### Push notificaiton là gì

Push notification là một trong những kĩ thuật rất quan trọng trong một ứng dụng di động. Hiểu đơn giản thì Push Notification là những message từ phía server gửi xuống điện thoại thông qua một cổng giao tiếp, tạm gọi là cloud message. Sau đó phía điện thoại sẽ tiếp nhận thông báo và hiển thị chúng.

Có rất nhiều dịch vụ cung cấp giải pháp Push Notification như: Firebase, Onesignal, Pushy,...

Nhưng trong giới hạn bài chia sẻ này, mình sẽ hướng dẫn các bạn tích hợp Push Notification bằng Firebase, cụ thể là FCM nhé.

![undefined](https://media.techmaster.vn/api/static/c1ao6ns51co0leiqkhmg/wJIs35rJ)



### Tại sao phải dùng Push notification

Có khá nhiều lý do để chúng ta phải sử dụng Push notification trong một ứng dụng. Phải kể đến là những lợi ích mà Push notification có thể mang lại cho người lập trình và người sử dụng ứng dụng.

* Thông thường một thông báo là được tự động kích hoạt nhằm thông báo tới người dùng là ứng dụng đó đã hoàn thành một công việc nào đó. Hoặc bạn có thể gửi thông tin về chương trình khuyến mãi tới cho khách hàng của bạn.
* Nhắc nhở người dùng của bạn về một thông báo nào đó mà bạn muốn triển tải.

### Cài đặt Push Notification

1. Cài đặt `firebase_core`
Đầu tiên bạn phải chắn chắng rằng là bạn đã cài đặt `firebase_core` và initialize Firebase trước đó. Nếu chưa thì xem hướng dẫn [ở đây nhé](https://firebase.flutter.dev/docs/overview/).

2. Add dependency
```bash
flutter pub add firebase_messaging
```
Chạy dòng lệnh ở trên tại terminal dự án nhé. Nó sẽ giúp bạn add thư viện `firebase_messaging` vào trong dự án của bạn. Cũng giống như cách bạn dependency thủ công bằng tay tại file `pubspec.yaml` vậy.

3. Tích hợp trên Android
Nếu như bạn đang dùng Flutter version >= 1.12 thì không cần phải làm bước ở dưới này nhé và skip qua nội dung khác.

Trong class `Application`, bạn hãy thêm sửa file lại như code bên dưới nhé:

```dart
// ...
import io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingBackgroundService;

public class Application extends FlutterApplication implements PluginRegistrantCallback {
  // ...
  @Override
  public void onCreate() {
    super.onCreate();
    FlutterFirebaseMessagingBackgroundService.setPluginRegistrant(this);
  }

  @Override
  public void registerWith(PluginRegistry registry) {
    GeneratedPluginRegistrant.registerWith(registry);
  }
  // ...
}

```
4. Tích hợp trên Iphone

Với device Iphone thì là một câu chuyện khác, và bạn cần phải cấu hình nhiều bước hơn để có thể enable được APNs(Apple Push Notification Service). Bạn có thể tham khảo tại [link](https://firebase.flutter.dev/docs/messaging/apple-integration) này.



### Cách sử dụng

Ở bài chia sẻ này, mình sẽ nói về cách sử dụng `FirebaseMessaging` để xử lí các sự kiện liên quan tới Push Notification trong sự án của các bạn nhé.

Đầu tiên thì để sử dụng các phương thức `FirebaseMessaging` sdk cung cấp. Chúng ta có thể gọi đến `instance` của `FirebaseMessaging`.

```dart
FirebaseMessaging messaging = FirebaseMessaging.instance;
```

**1. Nhận thông báo**

>Lưu ý:
>FCM không hoạt động trên IOS simulator. Nếu muốn nhận được thông báo, bạn hãy sử dụng device thật.

Một trong số lưu ý để nhận được thông báo FCM là:
* Ứng dụng nhất định phải được mở trước đó ít nhất một lần để có thể cấp quyền cho notification, và đăng ký FCM.
* Bạn sẽ không nhận được thông báo nếu như tắt ứng dụng trong setting apps. Và chỉ khi nào bạn mở ứng dụng lại thì nó mới hoạt động trở lại nhé.

**2. Yêu cầu quyền (IOS)**

Với device IOS, trước khi muốn nhận được thông báo, bạn buộc phải yêu cầu người dùng cấp quyền Notification trên ứng dụng. Để hiển thị ra thông báo yêu cầu cấp quyền, bạn có thể sử dụng đoạn code dưới đây.

```dart
FirebaseMessaging messaging = FirebaseMessaging.instance;

NotificationSettings settings = await messaging.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);

print('User granted permission: ${settings.authorizationStatus}');

```

`authorizationStatus` sẽ trả về một giá trị có thể được sử dụng để xác định quyết định của người dùng.
* `authorized`: Người dùng đã cấp quyền.
* `denied`: Người dùng đã từ chối quyền
* `notDetermined`:  Người dùng vẫn chưa chọn đã cấp quyền hay chưa
* `provisional`:  Người dùng đã cấp quyền tạm thời.

> Trên device Android, `authorizationStatus` sẽ trả về `authorized` nếu người dùng chưa tắt thông báo cho ứng dụng của bạn.

**3. Xử lý thông báo khi app mở**

Để lắng nghe thông báo trong khi ứng dụng của bạn đang được mở, hãy lắng nghe `onMessage` stream.

```dart
FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  print('Got a message whilst in the foreground!');
  print('Message data: ${message.data}');

  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
  }
});
```

**4. Xử lý thông khi app tắt**

Xử lý tin nhắn trong khi ứng dụng của bạn ở chế độ nền hơi khác một chút. Tin nhắn có thể được xử lý thông qua trình xử lý `onBackgroundMessage`. Khi nhận được, một `isolate` sẽ được tạo ra.

```dart
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}
```

Vì trình xử lý chạy trong vùng nhớ riêng bên ngoài ngữ cảnh ứng dụng của bạn, nên không thể cập nhật trạng thái ứng dụng hoặc thực thi bất kỳ logic nào tác động đến giao diện người dùng. Tuy nhiên, bạn có thể thực hiện logic như yêu cầu HTTP, thực hiện các hoạt động IO (ví dụ: cập nhật bộ nhớ cục bộ), giao tiếp với các plugin khác, v.v.

**5. Theo dõi topic**

Ví dụ ứng của bạn là một ứng dụng về thông tin báo chí, và có một người dùng nào đó họ theo dõi một topic liên quan đến bóng đá chẳng hạn. Nghĩa là lúc đó bạn cần bắn những notification liên quan đến thông tin bóng đá đến cho họ. Cũng tương tự với những topic khác như sách, âm nhạc. Và người dùng đó thì không có nhu cầu nhận notification liên quan đến những topic khác.
Khi đó, `FirebaseMessaging` cung cấp cho chúng ta một phương thức để chỉ lắng nghe notification những topic mà ta muốn theo dõi.
Ta sẽ sử dụng đoạn code bên dưới:

```dart
// subscribe to topic on each app start-up
await FirebaseMessaging.instance.subscribeToTopic('sport');
```

Và để bỏ theo dõi topic đó thì ta dùng đoạn code này

```dart
// subscribe to topic on each app start-up
await FirebaseMessaging.instance.unsubscribeFromTopic('sport');
```



### Sử dụng FCm để Push Notifications trên Flutter

# Tạo project Firebase

Để tạo một dự án Firebase, chúng ta cần đăng nhập vào Firebase và đi đến bảng điều khiển. Ở đó, bã hãy nhấp vào 'Add a project'để tạo dựán mới.

Ở đây mình sẽ tạo một project Firebase có tên là `FlutterPushNotification`.
![create project firebase](https://media.techmaster.vn/api/static/c1ao6ns51co0leiqkhmg/_p3SpQaY)

Sau khi bạn tạo xong thì bạn sẽ đi đến trang quản lý dự án như hình bên dưới.

![firebase console page](https://media.techmaster.vn/api/static/c1ao6ns51co0leiqkhmg/jrHlUzP-)

# Cấu hình Firebase với ứng dụng Android app

Vì một số vấn liên quan đến việc đăng ký APNs riêng cho iPhone nên trong scope này mình chỉ đề cập đến việc tích hợp trên Android OS.

Trước tiên bạn cần phải biết được tên của project Flutter của bạn là gì, ở đây chúng tôi gọi nó là `package name`.
Bạn sẽ tìm được nó ở trong file `./android/app/src/AndroidManifest.xml`

Ví dụ như:
```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    package="com.example.pushNotification">
```
Thì `package name` của bạn chính là `com.example.pushNotification`. Lưu nó lại nhé vì ngay bước sau chúng ta sẽ cần sử dụng đến nó.

Bạn hãy quay lại trang Firebase Cosole, và click vào icon Android như hình bên dưới để tạo ứng dụng Android trên project Firebase của bạn.

![create app android](https://media.techmaster.vn/api/static/c1ao6ns51co0leiqkhmg/ZnRb8saz)

Ở phần Android package name, bạn hãy nhập package name mà bạn đã lưu ở trên nhé.

![add fb to android app](https://media.techmaster.vn/api/static/c1ao6ns51co0leiqkhmg/qFsfiaRt)

Sau đó hãy bấm vào Register app, và bạn sẽ đến bước tiếp theo.
Ở bước này bạn sẽ download 1 file config là `google-service.json`. File này chứa các thông tin config của ứng dụng bạn và project Firebase bạn đã tạo. Và sau đó hãy lưu file này theo hướng dẫn bên dưới ảnh trong thư mục android của bạn nhé. Nhớ là phải lưu đúng vị trí không thì nó sẽ không hoạt động đâu.

![google service](https://media.techmaster.vn/api/static/c1ao6ns51co0leiqkhmg/yY3zydA5)

Bước thứ 3 sẽ hướng dẫn các bạn modify file build.gradle của dự án của bạn.
Cứ làm theo hướng dẫn là oke nhé.
![gradle](https://media.techmaster.vn/api/static/c1ao6ns51co0leiqkhmg/yR90G6Ut)

Vậy là xong. Bạn đã tạo được 1 app android trên project Firebase của bạn rồi. Hiểu đơn giản là app của bạn đã được kết nối đến Firebase này, và bạn có thể thoải mái sử dụng các dịch vụ mà Firebase cung cấp.

# Push notificationvới Cloud Messaging

Bước 1: Vào Firebase Console và chọn Project đã tạo.
Bước 2: Chọn Cloud Messaging ở Left Menu.
Bước 3: Click chọn New notification.
Bước 4: Nhập thông tin của notification và tiến hành gửi.
Bước 5: Check thành quả trên device.