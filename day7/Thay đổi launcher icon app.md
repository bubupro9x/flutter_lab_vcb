# Thay đổi launcher icon app

## 📖 Guide 

### 1. Setup the config file 

Thêm cấu hình `Flutter auncher Icons` vào `pubspec.yaml` của bạn hoặc tạo tệp cấu hình mới có tên là` flut_launcher_icons.yaml`. Một ví dụ đã được biểu diễn ở dưới. Các ví dụ phức tạp hơn [có thể tìm thấy trong các dự án mẫu](https://github.com/fluttercommunity/flutter_launcher_icons/tree/master/example).

```yaml
dev_dependencies:
  flutter_launcher_icons: "^0.10.0"

flutter_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/icon/icon.png"
```

### 2. Run the package 

Sau khi config xong thì bạn vui lòng chạy đoạn code bên dưới.

```bash
flutter pub get
flutter pub run flutter_launcher_icons:main
```

## 🔍 Attributes 

- `android`/`ios`
  - `true`: Override the default existing Flutter launcher icon for the platform specified
  - `false`: Ignore making launcher icons for this platform
  - `icon/path/here.png`: This will generate a new launcher icons for the platform with the name you specify, without removing the old default existing Flutter launcher icon.
- `image_path`: The location of the icon image file which you want to use as the app launcher icon
- `image_path_android`: The location of the icon image file specific for Android platform (optional - if not defined then the image_path is used)
- `image_path_ios`: The location of the icon image file specific for iOS platform (optional - if not defined then the image_path is used)

## 👀 Example 

[![Video Example](https://i.imgur.com/R28hqdz.png)](https://www.youtube.com/watch?v=RjNAxwcP3Tc)