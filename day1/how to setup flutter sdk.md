# Setup Flutter

## Window

- **Bước 1** − Các bạn truy cập địa chỉ ,[ https://flutter.dev/docs/get-started/install/windows](https://flutter.dev/docs/get-started/install/windows) và tải phiên bản mới nhất của Flutter SDK

- **Bước 2** − Giải nén vô thư mục bất kì ví dụ C:\flutter\

- **Bước 3** − Cập nhật system path cho thư mục flutter\bin. Trong thanh tìm kiếm ở Start, bạn gõ ‘env’ sau đó chọn Edit environment variables for your account.. Dưới dòng chữ User variables bạn kiểm tra nếu thấy ô Path:, thì thêm đường dẫn đầy đủ của thư mục flutter\bin sử dụng dấu ; để ngăn cách với các biến khác.

- **Bước 4** − Flutter cung cấp một tool gọi là **flutter doctor** để kiểm tra tất cả những yêu cầu cần thiết cho môi trường phát triển Flutter. 

  - ```dart
    flutter doctor
    ```

- **Bước 5** − Các bạn chạy lệnh phía trên để hệ thống kiểm tra và đưa ra báo cáo như sau

- **Bước 6** − Cài đặt bản Android SDK mới nhất nếu bạn chưa cài đặt và được cảnh báo bởi flutter doctor

- **Bước 7** − Cài đặt Android Studio mới nhất nếu bạn chưa cài đặt và được cảnh báo

- **Bước 8** − Bật android emulator hoặc kết nối tới một thiết bị Android

- **Bước 9** − Cài đặt plugin Flutter và Dart cho Android Studio. Hai plugin này sẽ cung cấp các template để tạo ứng dụng Flutter và các tuỳ chọn để chạy và debug ứng dụng Flutter trên Android studio

  - Mở Android Studio.
  - Chọn File → Settings → Plugins.
  - Tìm kiếm Flutter plugin và click vào Install.
  - Chọn Yes khi hệ thống yêu cầu cài đặt Dart plugin.
  - Khởi động lại Android studio.

---------------------------------



## Mac

Để cài đặt Flutter SDK trên MacOS, các bạn thực hiện theo các bước sau

- **Bước 1** − Truy cập địa chỉ URL,[ https://flutter.dev/docs/get-started/install/macos](https://flutter.dev/docs/get-started/install/macos) và tải về phiên bản Flutter SDK mới nhất

- **Bước 2** − Giải nén vô thư mục bất kì /path/to/flutter

- **Bước 3** − Cập nhật system path bao gồm thư mục flutter bin (ở trong ~/.bashrc file). bằng cách chạy lệnh sau

  ```bash
  $ export PATH="$PATH:`pwd`/flutter/bin"
  ```

- **Bước** **4** − Update lại hệ thống và kiểm tra Path bằng lênh sau

  ```bash
  source ~/.bashrc
  source $HOME/.bash_profile
  echo $PATH
  ```

  Flutter cung cấp một tool, flutter doctor dùng để kiểm tra các yêu cầu cho Fullter tương tự bên Windows.

- **Bước** **5** − Cài đặt bản mới nhất XCode nếu được yêu cầu bởi flutter doctor

- **Bước** **6** − Cài đặt Android SDK nếu được yêu cầu bởi flutter doctor

- **Bước** **7** − Cài đặt bản mới nhất Android Studio, nếu được yêu cầu bởi flutter doctor

- **Bước** **8** − Bật máy ảo android emulator hoặc kết nối tới thiết bị Android nếu bạn phát triển ứng dụng Android

- **Bước** **9** − Bật iOS simulator hoặc kết nối tới thiết bị iPhone nếu bạn phát triển ứng dụng iOS

- **Bước** **10** − Cài đặt Flutter và Dart plugin cho Android Studio tương tự như trên



Như vậy là mình đã hướng dẫn các bạn cài đặt Flutter SDK cho máy tính cá nhân, ở bài sau chúng ta sẽ viết ứng dụng đầu tiên với Flutter

