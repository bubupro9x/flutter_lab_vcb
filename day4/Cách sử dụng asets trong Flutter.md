# Cách sử dụng asets trong Flutter

### Tạo folder chứa ảnh

Tạo mới một folder chứa ảnh ngang hàng với file pubspec.yaml, bạn có thể đặt ảnh bên trong folder images rồi đặt ở trong assets như hình bên dưới hoặc đặt ảnh trực tiếp vào assets cũng không sao.![img](https://images.viblo.asia/adc06b4b-d57f-4f6c-ad70-10b5428dee9f.png)

Mỗi image sẽ được định danh bằng một đường dẫn cụ thể tới nơi mà image file được đặt. Thứ tự sắp xếp của image không quan trọng, và tên của folder chứa ảnh cũng không quan trọng, bạn có thể đặt tuỳ ý. Trong quá trình build, Flutter sẽ đặt các image này vào một kho lưu trữ đặc biệt được gọi là asset bundle, nơi mà app sẽ đọc dữ liệu ở runtime.

### Copy ảnh vào folder vừa tạo

Bây giờ, bạn có thể đưa ảnh vào folder images, ví dụ như ở trên, mình đã đưa vào ba ảnh 1.png, 2.png, 3.png. Lúc này đường dẫn đến ảnh sẽ như sau:

```none
assets/images/1.png
```



### Đăng ký folder ảnh vào file pubspec.yaml

Để sử dụng được ảnh từ assets, ta cần đăng ký nó vào file pubspec.yaml, bạn có thể tìm thấy nó ngay trong cây thư mục root của dự án. Ngay bên dưới dòng `uses-material-design: true`, khai báo assets cho những image mà ta định dùng như sau:

```none
assets:
    - assets/images/1.png
    - assets/images/2.png
    - assets/images/3.png
```



Hoặc nếu bạn muốn load tất cả các ảnh trong folder này, chỉ cần khai báo như sau là được:

```none
assets:
    - assets/images/
```



### Sử dụng ảnh trong code

Để load ảnh vào code, ta sử dụng cú pháp sau:

```none
Image.asset('assets/images/1.png')
```



Hãy cùng đặt ba ảnh được khai báo ở trên vào một Row nhé.

```none
body: Center(
          child: Row(
            children: [
              Image.asset('assets/images/1.png'),
              Image.asset('assets/images/2.png'),
              Image.asset('assets/images/3.png'),
            ],
      ),
),
```



Chạy app lên, bạn sẽ thấy ảnh số một sẽ được hiển thị trên màn hình sau:![img](https://images.viblo.asia/0ea77f0a-3689-4bb8-9741-6a0bc725b00d.png)

Nhưng hãy khoan, ảnh số 2 và 3 đi đâu rồi??? Nếu nhìn kỹ, bạn sẽ thấy một đường đứng màu vàng sọc chạy dọc theo góc phải bức ảnh, đường sọc này ám chỉ bức ảnh có width lớn hơn màn hình hiển thị nên nó không hiện hết được ảnh.

Ngoài ra, bạn có nhận ra đây là nấm Matsutake, một loại nấm siêu ngon của Nhật Bản không, hãy cùng chỉnh lại để giỏ nấm siêu đắt đỏ này hiển thị đầy đủ nhé ![😛](https://twemoji.maxcdn.com/2/72x72/1f61b.png).

Để set kích thước cho ảnh, ta có thể thêm vào width và height cho từng ảnh:

```none
body: Center(
          child: Row(
            children: [
              Image.asset('assets/images/1.png', width: 130, height: 150,),
              Image.asset('assets/images/2.png', width: 130, height: 150,),
              Image.asset('assets/images/3.png', width: 130, height: 150,),
            ],
       ),
),
```



Bây giờ thì cả ba ảnh đều được lên hình rồi nhé:![img](https://images.viblo.asia/caf749fd-ddb1-417a-9d1d-aee1d95a8a5a.png)

Tuy nhiên, khoảng cách giữa cách ảnh vẫn chưa phân bổ đều, để dàn đều ảnh, cách tốt nhất là đặt các bức ảnh vào Expanded, và set .spaceEvenly cho mainAxisAlignment để chia đều các ảnh.

```none
body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Image.asset('assets/images/1.png'),
              ),
              Expanded(
                child: Image.asset('assets/images/2.png'),
              ),
              Expanded(
                child: Image.asset('assets/images/3.png'),
              ),
        ],
    ),
 ),
```



Ngoài ra, bạn cũng có thể set thêm các thuộc tính khác để chỉnh UI, ví dụ như thêm flex vào để set độ scale của ảnh...

Đến đây, chắc hẳn các bạn đã tự mình load được ảnh vào một dự án Flutter rồi, rất nhanh và tiện phải không nào ^.^



** Thảm khảo tài liệu tại viblo.asia