# Work manager in Flutter

Trong bài viết này, chúng ta sẽ học cách sử dụng `Work manager` trong Flutter. Trước khi bắt đầu thực hiện nó, chúng tôi sẽ thảo luận ngắn gọn về quản lý công việc.

`Work manager` để tạo các công việc định kỳ trong background yêu cầu hệ thống đảm bảo rằng chúng sẽ được hoàn thành ngay cả khi ứng dụng bị đóng.

WorkManager thực hiện những tác vụ nặng giúp bạn, giải quyết các mối quan tâm về khả năng tương thích cũng như các phương pháp hay nhất về sức khỏe hệ thống và pin.
Bạn cũng có thể lên lịch cho cả công việc định kỳ và chuỗi nhiệm vụ phụ thuộc phức tạp với người quản lý công việc, công việc nền có thể được tiến hành song song hoặc tuần tự, với một thứ tự thực hiện được chỉ định. WorkManager in flashing quản lý luồng đầu vào và đầu ra giữa các tác vụ một cách dễ dàng.



## Hãy bắt đầu triển khai Trình quản lý công việc trong ứng dụng Flutter trong một vài bước:

### Thiết lập dự án

Tạo một dự án Flutter mới và thêm phiên bản workmanager mới nhất dưới tệp tin cậy trong tệp pubspec.yaml của dự án của bạn như ví dụ sau và chạy lệnh flashing pub get để cài đặt thư viện này trong dự án của bạn.

```yaml
dependencies:
  workmanager: any
```

###  Import package

```dart
import 'package:workmanager/workmanager.dart';
```

### **Implementation**

```dart
ElevatedButton(
                  child: Text("Register Periodic Task"),
                  onPressed: () {
                    Workmanager().registerPeriodicTask(
                      "3",
                      simplePeriodicTask,
                      initialDelay: Duration(seconds: 10),
                    );
                  }),
```

Nó sẽ đợi ít nhất 10 giây trước khi ra mắt lần đầu tiên. Vì ta chưa cung cấp tần suất nên sẽ là 15 phút mặc định.

### **Example**

```dart
import 'dart:async';
import 'dart:io';
import 'dart:math';
 
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';
 
void main() => runApp(MyApp());
 
const simpleTaskKey = "simpleTask";
const rescheduledTaskKey = "rescheduledTask";
const failedTaskKey = "failedTask";
const simpleDelayedTask = "simpleDelayedTask";
const simplePeriodicTask = "simplePeriodicTask";
const simplePeriodic1HourTask = "simplePeriodic1HourTask";
 
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case simpleTaskKey:
        print("$simpleTaskKey was executed. inputData = $inputData");
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool("test", true);
        print("Bool from prefs: ${prefs.getBool("test")}");
        break;
      case rescheduledTaskKey:
        final key = inputData!['key']!;
        final prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey('unique-$key')) {
          print('has been running before, task is successful');
          return true;
        } else {
          await prefs.setBool('unique-$key', true);
          print('reschedule task');
          return false;
        }
      case failedTaskKey:
        print('failed task');
        return Future.error('failed');
      case simpleDelayedTask:
        print("$simpleDelayedTask was executed");
        break;
      case simplePeriodicTask:
        print("$simplePeriodicTask was executed");
        break;
      case simplePeriodic1HourTask:
        print("$simplePeriodic1HourTask was executed");
        break;
      case Workmanager.iOSBackgroundTask:
        print("The iOS background fetch was triggered");
        Directory? tempDir = await getTemporaryDirectory();
        String? tempPath = tempDir.path;
        print(
            "You can access other plugins in the background, for example Directory.getTemporaryDirectory(): $tempPath");
        break;
    }
 
    return Future.value(true);
  });
}
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
 
enum _Platform { android, ios }
 
class PlatformEnabledButton extends ElevatedButton {
  final _Platform platform;
 
  PlatformEnabledButton({
    required this.platform,
    required Widget child,
    required VoidCallback onPressed,
  }) : super(
      child: child,
      onPressed: (Platform.isAndroid && platform == _Platform.android ||
          Platform.isIOS && platform == _Platform.ios)
          ? onPressed
          : null);
}
 
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter WorkManager Example"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text("Plugin initialization",
                  style: Theme.of(context).textTheme.headline4),
              ElevatedButton(
                  child: Text("Start the Flutter background service"),
                  onPressed: () {
                    Workmanager().initialize(
                      callbackDispatcher,
                      isInDebugMode: true,
                    );
                  }),
              SizedBox(height: 16),
              Text("One Off Tasks (Android only)",
                  style: Theme.of(context).textTheme.headline4),
              //This task runs once.
              //Most likely this will trigger immediately
              PlatformEnabledButton(
                platform: _Platform.android,
                child: Text("Register OneOff Task"),
                onPressed: () {
                  Workmanager().registerOneOffTask(
                    "1",
                    simpleTaskKey,
                    inputData: <String, dynamic>{
                      'int': 1,
                      'bool': true,
                      'double': 1.0,
                      'string': 'string',
                      'array': [1, 2, 3],
                    },
                  );
                },
              ),
              PlatformEnabledButton(
                platform: _Platform.android,
                child: Text("Register rescheduled Task"),
                onPressed: () {
                  Workmanager().registerOneOffTask(
                    "1-rescheduled",
                    rescheduledTaskKey,
                    inputData: <String, dynamic>{
                      'key': Random().nextInt(64000),
                    },
                  );
                },
              ),
              PlatformEnabledButton(
                platform: _Platform.android,
                child: Text("Register failed Task"),
                onPressed: () {
                  Workmanager().registerOneOffTask(
                    "1-failed",
                    failedTaskKey,
                  );
                },
              ),
              //This task runs once
              //This wait at least 10 seconds before running
              PlatformEnabledButton(
                  platform: _Platform.android,
                  child: Text("Register Delayed OneOff Task"),
                  onPressed: () {
                    Workmanager().registerOneOffTask(
                      "2",
                      simpleDelayedTask,
                      initialDelay: Duration(seconds: 10),
                    );
                  }),
              SizedBox(height: 8),
              Text("Periodic Tasks (Android only)",
                  style: Theme.of(context).textTheme.headline4),
              //This task runs periodically
              //It will wait at least 10 seconds before its first launch
              //Since we have not provided a frequency it will be the default 15 minutes
              PlatformEnabledButton(
                  platform: _Platform.android,
                  child: Text("Register Periodic Task"),
                  onPressed: () {
                    Workmanager().registerPeriodicTask(
                      "3",
                      simplePeriodicTask,
                      initialDelay: Duration(seconds: 10),
                    );
                  }),
              //This task runs periodically
              //It will run about every hour
              PlatformEnabledButton(
                  platform: _Platform.android,
                  child: Text("Register 1 hour Periodic Task"),
                  onPressed: () {
                    Workmanager().registerPeriodicTask(
                      "5",
                      simplePeriodic1HourTask,
                      frequency: Duration(hours: 1),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
```

### **Dispose a work manager**

- Xử dụng tên

```dart
Workmanager().cancelByUniqueName("<MyTask>");
```

- Xử dụng tag

```dart
Workmanager().cancelByTag("tag");
```

###  **Dispose all work manager jobs**

```dart
 ElevatedButton(
                child: Text("Cancel All"),
                onPressed: () async {
                  await Workmanager().cancelAll();
                  print('Cancel all tasks completed');
                },
              ),
```

