# Thay đổi màn hình splash trong Flutter

Khi ứng dụng của bạn được mở, sẽ có một khoảng thời gian ngắn trong khi ứng dụng gốc tải Flutter. Theo mặc định, trong thời gian này, ứng dụng gốc hiển thị màn hình trắng. Gói này tự động tạo mã gốc cho iOS, Android và Web để tùy chỉnh màu nền và hình ảnh. Hỗ trợ chế độ tối, toàn màn hình và các tùy chọn nền tảng cụ thể.

![img](https://raw.githubusercontent.com/jonbhanson/flutter_native_splash/master/splash_demo.gif) ![img](https://raw.githubusercontent.com/jonbhanson/flutter_native_splash/master/splash_demo_dark.gif)

# Cách sử dụng 

Đầu tiên, bạn cận add thư viện `flutter_native_splash` vào `pubspec.yaml` của bạn.

```yaml
dependencies:
  flutter_native_splash: ^2.2.10+1
```

Đừng quên run lệnh `Flutter pub get` nhé.

## 1. Splash screen

Tạo một file mới có tên là `flutter_native_splash.yaml`, sau đó hãy copy đoạn code này vào file.

```yaml
flutter_native_splash:
  color: "#ffffff"
  image: assets/test.png
  branding: assets/branding-development.png
  fullscreen: true
  android_gravity: fill
  ios_content_mode: scaleToFill


  android_12:
    image: assets/logo-development.png
    fullscreen: true
    
  web: false
```

Ở đây chúng ta sẽ chỉ cần quan tâm tới một số trường ở trên.

- `color`: Màu sắc background
- `image`: Ảnh logo
- `branding`: Thường là logo nằm ở phía bottom của splash
- `fullscreen`: Bạn có muốn splash full screen không: true/false
- `android_gravity`: Bạn mong muốn `image` hiển thị với `gravity` như thế nào. Thường thì sẽ là `center` hoặc `fill` cho đầy màn hình.
- `ios_content_mode`: Giống với `android_gravity`. Tham khảo giá trị tại [link](https://developer.apple.com/documentation/uikit/uiview/contentmode)
- `android_12`: Với Android 12 thì hơi đặc biệt. Nó không ăn các thông số ở trên nên chúng ta cần phải clone thông số với android 12 nữa.

## 2. Chạy package

Sau khi add file vào project của bạn, bạn tiến hành chạy lệnh bên dưới:

```bash
flutter pub run flutter_native_splash:create
```

Và lúc này màn hình splash đã sẵn sàng.

Trường hợp terminal không tìm thấy được vị trí file `yaml` của bạn thì có thể dùng lệnh bên dưới:

```bash
flutter pub run flutter_native_splash:create --path=path/to/my/file.yaml
```

## 3. Ngưng động thời gian(có cũng được mà không thì chẳng sao)

By default, the splash screen will be removed when Flutter has drawn the first frame. If you would like the splash screen to remain while your app initializes, you can use the `preserve()` and `remove()` methods together. Pass the `preserve()` method the value returned from `WidgetsFlutterBinding.ensureInitialized()` to keep the splash on screen. Later, when your app has initialized, make a call to `remove()` to remove the splash screen.

Mặc định thì màn hình splash sẽ bị xóa sau khi Flutter vẽ được frame đầu tiên. Trong trường hợp bạn muốn ngưng động lại để xử lí một số logic như: Check maintenance, get profile, bla bla bla... thì bạn có thể sử dụng:

```dart
FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
```

Ví dụ:

```dart
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

// Khi bạn chán rồi thì có thể gọi lệnh bên dưới để remove màn hình splash đi.
    FlutterNativeSplash.remove();
```

