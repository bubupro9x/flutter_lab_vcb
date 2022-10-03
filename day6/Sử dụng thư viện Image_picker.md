# Sử dụng thư viện Image_picker


Đầu tiên hãy mở tệp pubspec.yaml và thêm gói `image_picker`. Đây là gói sẽ cung cấp cho chúng tôi các phương pháp để truy cập thư viện và máy ảnh của chúng tôi.

Bây giờ, khi gói được cài đặt, chúng tôi sẽ cần thực hiện một số thay đổi đối với tệp cấu hình iOS và Android của chúng tôi. Đối với mục đích bài viết này, tôi đang sử dụng trình mô phỏng iOS.
Thêm các khóa sau vào tệp Info.plist của bạn, nằm trong <gốc dự án> /ios/Runner/Info.plist:

NSPhotoLibraryUsageDescription - mô tả lý do tại sao ứng dụng của bạn cần quyền cho thư viện ảnh. Đây được gọi là Quyền riêng tư - Mô tả Sử dụng Thư viện Ảnh trong trình chỉnh sửa trực quan.
NSCameraUsageDescription - mô tả lý do tại sao ứng dụng của bạn cần quyền truy cập vào camera. Đây được gọi là Quyền riêng tư - Mô tả Sử dụng Máy ảnh trong trình chỉnh sửa trực quan.

Bây giờ, khi các cấu hình và sự phụ thuộc của chúng ta đã được thiết lập, chúng ta hãy chuyển sang phần viết mã.

Đầu tiên đối với bản demo này, tôi sẽ chỉ tạo hai nút cơ bản, một cho Gallery và một cho camera. Sao chép và dán đoạn mã dưới đây.

```dart
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker Example"),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
                color: Colors.blue,
                child: const Text(
                    "Pick Image from Gallery",
                  style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.bold
                  )
                ),
                onPressed: () {
                }
            ),
            MaterialButton(
                color: Colors.blue,
                child: const Text(
                    "Pick Image from Camera",
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold
                    )
                ),
                onPressed: () {
                }
            ),
          ],
        ),
      )
    );
  }
```

![img](https://miro.medium.com/max/730/1*46AeB9qVKzU_AMKRTjHoqA.png)

Bây giờ, chúng tôi chỉ tạo hai nút cơ bản và các phương thức onPressed () của chúng hoàn toàn trống. Hãy xem phương pháp thực sự sẽ mở thư viện hoặc máy ảnh trên điện thoại của chúng tôi và chúng tôi sẽ có thể nhập ảnh.

Sao chép và dán đoạn mã dưới đây: -

```dart
File? image;
Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
if(image == null) return;
final imageTemp = File(image.path);
setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
```

![img](https://miro.medium.com/max/730/1*klxXDRx63x4h9hmAt-aUiQ.gif)

