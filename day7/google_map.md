# Google Map + Flutter



![img](https://images.viblo.asia/98f4ad44-462b-4068-92ac-278b3a25c538.png)

## 0. Overview

Google gần đây đã giới thiệu [plugin Google Maps](https://pub.dartlang.org/packages/google_maps_flutter) chính thức cho Flutter, cũng như có thêm hỗ trợ cho Google Maps trong Flutter.

Tại thời điểm hiện tại, plugin này vẫn đang là bản xem thử (Developers Preview) và có thể có những thay đổi đột phá trong tương lai.

Bài viết sẽ cố gắng giúp bạn nắm được việc sử dụng plugin Google Maps trong Flutter. Sẽ có những thay đổi trong thời gian tới vì hiện tại mới chỉ là bản Preview.

## 1. Setup

Đầu tiên, chúng ta sẽ setup môi trường cũng như config để sử dụng flugin Google Maps

1. Thêm flugin Google Maps dưới dạng **dependencies** vào trong file **pubspec.yaml** .

```dart
dependencies:
  ...
  google_maps_flutter: ^0.4.0
```



Bạn có thể kiểm tra version mới nhất từ [đây](https://pub.dartlang.org/packages/google_maps_flutter#-readme-tab-) .

1. Bước tiếp theo là bạn phải đăng kí Google Map API key. Truy cập trang [Google Maps Platform](https://cloud.google.com/maps-platform/) và nhấp vào “Get Started”. Chọn Maps và nhấp vào Continue. ![img](https://images.viblo.asia/823021ca-c9ab-4a6d-867c-8e85db16645b.png) Chọn một dự án hiện có hoặc tạo một dự án mới và hoàn thành các bước còn lại để lấy API key của bạn.
2. Thêm API key này vào ứng dụng Flutter của bạn

- Với Android, bạn sẽ chỉ định API key trong tệp application manifest *(android/app/src/main/AndroidManifest.xml)*

```dart
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>
```



- Với iOS, chỉ định API key trong application delegate *(ios/Runner/AppDelegate.m)*:

```dart
#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
// Add the GoogleMaps import.
#import "GoogleMaps/GoogleMaps.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Add the following line with your API key.
  [GMSServices provideAPIKey:@"YOUR KEY HERE"];
  [GeneratedPluginRegistrant registerWithRegistry:self];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
@end
```



Riêng với iOS, bạn cần phải làm thêm 1 bước nữa, đó là thêm key `io.flutter.embedded_views_preview` vào trong **Info.plist** *(ios/Runner/Info.plist)* và xét giá trị là **true**

```dart
<key>io.flutter.embedded_views_preview</key>
<true/>
```



## 2. Thêm Google Map vào ứng dụng

Để thêm Google Map, chúng ta sử dụng widget Google Map trong cây widget. Ví dụ cơ bản

```dart
Column(
  children: <Widget>[
    Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        onMapCreated: (GoogleMapController controller) {},
      ),
    ),
  ],
),
```



![img](https://images.viblo.asia/2908da46-ec57-4060-a49f-e9a0c26ff620.png)

Khá là đơn giản để add flugin Google Maps vào trong Flutter với vài dòng code. Nhưng đây mới chỉ là hiển thị map bất kì, chưa có bất kì custom nào. Và thường các ứng dụng không chỉ là đơn giản hiển thị một map bất kì như thế. Sẽ có những yêu cầu về customize, control map, thêm markers ....

Do đó chúng ta sẽ cần đi sâu tìm hiểu.

## 3. Thay đổi các tuỳ chọn trong Map

### 3.1 Thay đổi map type

Chúng ta có thể thay đổi loại Map bằng tham số mapType trong GoogleMapOptions. Các loại Map chúng ta có thể xét: **satellite**, **hybrid**, **normal** hoặc **terrain**. Ví dụ, xét mapTyle là **satellite**

```dart
GoogleMap(
  onMapCreated: (GoogleMapController controller) {},
  options: GoogleMapOptions(
    mapType: MapType.satellite,
  ),
),
```



![img](https://images.viblo.asia/df0179d7-5f69-4036-9e43-c1e6097d1481.png)

### 3.2 Xét vị trí mặc định camera

Bạn có thể xét giá trị tham số cameraPocation để đặt vị trí camera vào một điểm xác định thay vì điểm bất kì trên Map. Ví dụ

```dart
options: GoogleMapOptions(
  cameraPosition: CameraPosition(
    target: LatLng(37.4219999, -122.0862462),
  ),
),
```



### 3.3 Hiển thị ví trí hiện tại của bạn

Để hiển thị vị trí hiển tại của bạn, bạn phải đặt tham số **myLocationEnabled** là true .

```dart
options: GoogleMapOptions(
...
  myLocationEnabled : true,
  ...
),
```



Đồng thời phải thêm các quyền cần thiết trên cả hai nền tảng: iOS và Android.

- Với Android, bạn cần thêm

```
<uses-permission android:name=”android.permission.ACCESS_FINE_LOCATION” />
```

or

```
<uses-permission android:name=”android.permission.ACCESS_COARSE_LOCATION” />
```

vào trong file **manifest.xml**

Bạn cũng cần phải xin phép người dùng một cách rõ ràng. Bạn có thể xử dụng package [permission handler](https://pub.dartlang.org/packages/permission_handler) để xử lý việc xin quyền sử dụng.

- Với iOS , bạn cần thêm key `NSLocationWhenInUseUsageDescription` cùng nội dung thông báo rõ ràng vào trong `Info.plist` file.

Khi người dùng cố gắng bật chức năng My location trong bản đồ, một thông báo yêu cầu cấp quyền sẽ tự động hiển thị .

![img](https://images.viblo.asia/0172468d-b6ca-48d6-b86b-be85d56bd0a2.png)

### 3.4 Enabling/Disabling Gestures

GoogleMapOptions cung cấp cho chúng ta các tùy chọn khác nhau để bật hoặc tắt các loại cử chỉ cụ thể như nghiêng, thu phóng to/nhỏ, v.v.

```dart
options: GoogleMapOptions(
  cameraPosition: CameraPosition(
    target: LatLng(37.4219999, -122.0862462),
  ),
  rotateGesturesEnabled: false,
  scrollGesturesEnabled: false,
  tiltGesturesEnabled: false,
)
```



## 4. Di chuyển camera trên map

Phương thức **onMapCreated** trong GoogleMap đã cung cấp cho chúng ta GoogleMapController.

```dart
onMapCreated: (GoogleMapController controller) {},
```



Chúng ta có thể sử controller này để làm những việc như đặt điểm đánh dấu (markers) hoặc di chuyển camera xung quanh.

```dart
// Declare outside build method
GoogleMapController mapController;
Scaffold(
  body: Column(
    children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
      ),
    ],
  ),
  floatingActionButton: FloatingActionButton(onPressed: () {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(37.4219999, -122.0862462), zoom: 20.0),
      ),
    );
  }),
);
```



Trong trí dụ trên, khi click vào FloatingActionButton thì sẽ di chuyển camera tới một ví trí xác định trên map **LatLng(37.4219999, -122.0862462) **

### 4.1 CameraUpdate.newCameraPosition()

Phương pháp này cho phép chúng ta đặt **latitude** và **longitude** , tỉ lệ **zoom**, **bearing** (hướng của bản đồ theo độ) và **tilt** (độ nghiêng cao hơn cho chế độ xem bên / nghiêng của các tòa nhà).

```dart
mapController.animateCamera(
  CameraUpdate.newCameraPosition(
    CameraPosition(
      target: latLng,
      tilt: 50.0,
      bearing: 45.0,
      zoom: 20.0,
    ),
  ),
);
```



### 4.2 CameraUpdate.newLatLngBounds()

Cái này đặt camera giữa hai LatLngs.

Ví dụ, sẽ hợp lý hơn khi một ứng dụng như Uber chỉ cần hiển thị đủ bản đồ để có thể thấy bạn và chiếc xe được giao nhiệm vụ đón bạn thay vì hiển thị bản đồ của toàn thành phố.

```dart
mapController.animateCamera(
    CameraUpdate.newLatLngBounds(
      LatLngBounds(
        southwest: LatLng(48.8589507, 2.2770205),
        northeast: LatLng(50.8550625, 4.3053506),
      ),
      48.0,
    ),
);
```



Hàm lấy điểm **southwest** và **northeast** để giới hạn phần hiển thị trên bản đồ.

Giá trị 48.0 là phần **pading**

![img](https://images.viblo.asia/44c56ef1-10e4-4e92-9d4d-247414e2a24d.png)

Nếu chúng ta xét giá trị **pading** = 0.0

```dart
mapController.animateCamera(
    CameraUpdate.newLatLngBounds(
      LatLngBounds(
        southwest: LatLng(48.8589507, 2.2770205),
        northeast: LatLng(50.8550625, 4.3053506),
      ),
      0.0,
    ),
);
```



![img](https://images.viblo.asia/72d1ad71-e2ae-42d2-8221-97ae41ed14b9.png)

### 4.3 CameraUpdate.newLatLng()

Chức năng này chỉ đơn giản là camera di chuyển tới một vị trí mới trên map trong khi vẫn giữ nguyên hệ số thu phóng (zoom).

```dart
mapController.animateCamera(
  CameraUpdate.newLatLng(
    LatLng(
      37.4219999,
      -122.0862462,
    ),
  ),
);
```



### 4.4 CameraUpdate.newLatLngZoom()

Chức năng này là cho phép camera di chuyển tới một vị trí mới trên map đồng thời thay đổi hệ số thu phóng (zoom).

```dart
mapController.animateCamera(
  CameraUpdate.newLatLngZoom(
    LatLng(37.4219999, -122.0862462),
    10.0, // Zoom factor
  ),
);
```



### 4.5 CameraUpdate.scrollBy()

Di chuyển (scroll) bản đồ theo hướng X và / hoặc Y với một lượng nhất định.

```dart
mapController.animateCamera(
  CameraUpdate.scrollBy(50.0, 50.0),
);
```



### 4.6 CameraUpdate.zoomIn(), CameraUpdate.zoomOut()

Chức năng zoom in / zoom out

```dart
mapController.animateCamera(
  CameraUpdate.zoomIn(),
);


mapController.animateCamera(
  CameraUpdate.zoomOut(),
);
```



### 4.7 CameraUpdate.zoomBy()

Zoom theo giá trị

```dart
mapController.animateCamera(
  CameraUpdate.zoomBy(4.0),
);
```



### 4.8 CameraUpdate.zoomTo()

Zoom tới giá trị

```dart
mapController.animateCamera(
  CameraUpdate.zoomTo(5.0),
);
```



## 5. Thêm markers trên Map

Tương tự như việc di chuyển camera trên Map, chúng ta sẽ sử dụng GoogleMapController để thêm điểm đánh dấu (markers) vào Map.![img](https://images.viblo.asia/0eba3296-08f2-4514-b891-587ef6f750ee.png)

Đơn giản sử dụng thuộc tính **markers** và truyền một set Markers vào cho tới một vị trí **LatLng**

```dart
GoogleMap(
                    myLocationButtonEnabled: false,
                    mapType: MapType.normal,
                    markers: {
                      Marker(
                        markerId: const MarkerId('place_name'),
                        position: LatLng(user.address.coordinates.lat,
                            user.address.coordinates.lng),
                      )
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(user.address.coordinates.lat,
                          user.address.coordinates.lng),
                      zoom: 13,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                      controller.
                    },
                  ),
```



### 5.1 Thêm text vào markers

Chúng ta có thể thêm thông tin vào các điểm đánh dấu (markers) bằng cách sử dụng tham số infoWindowText.

```dart
MarkerOptions(
    position: LatLng(37.4219999, -122.0862462),
    infoWindowText: InfoWindowText("Title", "Content"),
  ),
```



![img](https://images.viblo.asia/f21c9162-a506-465b-b6fb-6f12940fd46d.png)

### 5.2 Thay đổi marker icon

Chúng ta có thể thay đổi n đang icon đang được sử dụng cho điểm đánh dấu bằng tham số icon .

```dart
MarkerOptions(
  position: LatLng(37.4219999, -122.0862462),
  icon: BitmapDescriptor.fromAsset('images/flutter.png',),
),
```



### 5.3 Thay đổi giao diện của điểm đánh dấu mặc định

- Chúng ta có thể thay đổi màu bằng cách sử dụng tham số icon:

```dart
MarkerOptions(
  position: LatLng(37.4219999, -122.0862462),
  icon:
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
),
```



![img](https://images.viblo.asia/70bc3b45-e23d-40e4-97ab-307f07360e3a.png)

- Chúng ta có thể đặt alpha (làm icon mờ)

```dart
MarkerOptions(
  position: LatLng(37.4219999, -122.0862462),
  alpha: 0.5,
),
```



![img](https://images.viblo.asia/6f2c1dc5-a092-4100-b3be-edf7657d2cf0.png)

- Cuối cùng bạn có thể xoay marker icon

```dart
MarkerOptions(
  position: LatLng(37.4219999, -122.0862462),
  rotation: 45.0, // Rotation in degrees
),
```



![img](https://images.viblo.asia/c021b2a7-5a16-4f8f-88d6-72c3c498ecf1.png)

Các bạn có thể tìm hiểu về Google Map trong Flutter thông qua các example từ các nguồn

- [A Flutter example to use Google Maps in iOS and Android apps](https://flutterawesome.com/a-flutter-example-to-use-google-maps-in-ios-and-android-apps/)
- [Place Tracker](https://github.com/flutter/samples/tree/master/place_tracker)

## Những lưu ý khi làm việc với google map

### Một số ứng dụng của Google Map API

- Đánh dấu các địa điểm trên bản đồ kèm theo thông tin cho địa điểm đó : khu vui chơi giải trí, nhà hàng khách sạn, cây ATM, bệnh viện, trường học,… bất cứ địa điểm nào bạn muốn
- Chỉ dẫn đường đến các địa điểm cần tìm(đường tối ưu và nhiều option khác),chỉ dẫn đường giao thông công cộng, có thể là các địa điểm cung cấp như trên. Ở đây sử dụng các service google cung cấp.
- Khoanh vùng khu vực: các trung tâm kinh tế, khu đô thị, khu ô nhiễm…
- Tình trạng giao thông các khu vực… từ đó đưa ra các giải pháp…



### Google Maps API thay đổi cách tính phí

Hiện tại, Google đã thay đổi cách tính phí cho cho các dịch vụ Map API, khi tạo Account mới, người dùng sẽ được sử dụng free dịch vụ API từ Google với hạn mức là 200$/ 1 tháng, bao gồm tất cả dịch vụ mà **Google Map API** cung cấp. Nghĩa là bạn có thể phát triển những ứng dụng nhỏ với lượt request thấp, chi phí cho tổng số request trong tháng dưới 200$ theo bảng giá mà Google đưa ra sẽ được miễn phí tháng đó, ngược lại nếu số lượng request vượt mức 200$ thì cần phải thanh toán toàn bộ chi phí.

Ví dụ: Số lượng request của ứng dụng trong tháng chỉ đạt mức phí 190$, bạn sẽ hoàn toàn được miễn phí và không phải thanh toán số tiền đó. Nếu mức phí vượt hạn mức free, 210$/ tháng thì bạn sẽ phải thanh toán toàn bộ số tiền 210$ đó.

![Bảng giá các dịch vụ Maps.](https://mona.media/wp-content/uploads/2019/12/bang-gia-maps.jpg)

Bảng giá các dịch vụ Maps.

![Bảng giá dịch vụ Routes](https://mona.media/wp-content/uploads/2019/12/bang-gia-routes.jpg)

Bảng giá dịch vụ Routes

![Bảng giá dịch vụ Places](https://mona.media/wp-content/uploads/2019/12/bang-gia-places.jpg)

Bảng giá dịch vụ Places

Một số dịch vụ Static Maps và Dynamic Maps cho phiên bản mobile đang được Google miễn phí để khuyến khích các nhà phát triển xây dựng ứng dụng trên nền tảng Maps của Google.



### Google Map API bị chặn ở Việt Nam

Theo một số thông báo từ Google, Việt Nam nằm trong danh sách những vùng lãnh thổ bị cấm sử dụng Map API từ họ. Chính vì vậy để sử dụng được những dịch vụ Maps API cung cấp, người dùng cần sử dụng Billing Account mới, bank account này cần nằm ngoài danh sách các quốc gia bị chặn thì mới có thể sử dụng.

![danh sách các quốc gia bị cấm.](https://mona.media/wp-content/uploads/2019/12/danh-sach-bi-chan.jpg)

Việt Nam nằm trong danh sách các quốc gia bị cấm.

Những chia sẻ từ Mona hy vọng có thể giúp bạn hiểu hơn về dịch vụ **Google Map API** mà Google đang cung cấp.
