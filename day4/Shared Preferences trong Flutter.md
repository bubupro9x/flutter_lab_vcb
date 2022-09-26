# Shared Preferences trong Flutter

Để lưu trữ các dữ liệu ở local trong ứng dụng Flutter, ngoài cách lưu bằng sqlite, chúng ta còn thể lưu dữ liệu vào Shared Preferences

## 1. Sơ lược về Shared Preferences trong Flutter

- Dùng để lưu những tập dữ liệu nhỏ dưới dạng key-value
- Các loại dữ liệu có thể lưu như là int, double, bool, String and List<String>
- Các dữ liệu được lưu lại trong một file .xml và được lưu vào trong bộ nhớ đệm của máy
- Các dữ liệu chúng ta có thể dùng để lưu như là các thông số về Settings, token,, …

## 2. Cách sử dụng

- Thêm thư viện vào trong file pubspect.yaml:

```yaml
shared_preferences: any
```

Vì các hàm xử lý lưu dữ liệu trong shared_preferences đều là các hàm Future, nên chúng ta cần dùng await để gọi:

- Hàm lưu dữ liệu

```dart
// Obtain shared preferences.
final prefs = await SharedPreferences.getInstance();

// Save an integer value to 'counter' key. 
await prefs.setInt('counter', 10);
// Save an boolean value to 'repeat' key. 
await prefs.setBool('repeat', true);
// Save an double value to 'decimal' key. 
await prefs.setDouble('decimal', 1.5);
// Save an String value to 'action' key. 
await prefs.setString('action', 'Start');
// Save an list of strings to 'items' key. 
await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
```

- Hàm đọc dữ liệu

```dart
// Try reading data from the 'counter' key. If it doesn't exist, returns null.
final int? counter = prefs.getInt('counter');
// Try reading data from the 'repeat' key. If it doesn't exist, returns null.
final bool? repeat = prefs.getBool('repeat');
// Try reading data from the 'decimal' key. If it doesn't exist, returns null.
final double? decimal = prefs.getDouble('decimal');
// Try reading data from the 'action' key. If it doesn't exist, returns null.
final String? action = prefs.getString('action');
// Try reading data from the 'items' key. If it doesn't exist, returns null.
final List<String>? items = prefs.getStringList('items');
```

- Nếu chúng ta muốn xóa bỏ dữ liệu đã được lưu

```dart
// Remove data for the 'counter' key. 
final success = await prefs.remove('counter');
```