### Dart là gì?
Dart là một ngôn ngữ lập trình web do Google phát triển. Nó được chính thức công bố tại Hội thảo GOTO Lưu trữ 2012-12-21 tại Wayback Machine ngày 10-12 tháng 10 năm 2011 tại Aarhus. Mục đích của Dart không phải để thay thế JavaScript như là ngôn ngữ kịch bản chính bên trong trình duyệt web, mà là cung cấp sự lựa chọn hiện đại hơn.

Dart là một ngôn ngữ lập trình động, dựa trên lớp, hướng đối tượng với phạm vi đóng và từ vựng. Về mặt cú pháp, nó khá giống với Java, C và JavaScript. Nếu bạn biết bất kỳ ngôn ngữ lập trình nào trong số này, bạn có thể dễ dàng học ngôn ngữ lập trình Dart.

Dart là một ngôn ngữ lập trình mã nguồn mở được sử dụng rộng rãi để phát triển ứng dụng di động, ứng dụng web hiện đại, ứng dụng máy tính để bàn và Internet of Things (IoT) bằng cách sử dụng khung Flutter. Nó cũng hỗ trợ một số khái niệm nâng cao như giao diện, mixin, lớp trừu tượng, tổng thể trường và giao diện kiểu. Nó là một ngôn ngữ biên dịch và hỗ trợ hai loại kỹ thuật biên dịch.

AOT (Ahead of Time) – Nó chuyển đổi mã Dart sang mã JavaScript được tối ưu hóa với sự trợ giúp của trình biên dịch dar2js và chạy trên tất cả các trình duyệt web hiện đại. Nó biên dịch mã tại thời điểm xây dựng.
JOT (Just-In-Time) – Nó chuyển đổi mã byte trong mã máy (mã gốc), nhưng chỉ mã cần thiết.

![dart](https://media.techmaster.vn/api/static/c1ao6ns51co0leiqkhmg/Dh--jz_J)

### Lý do cho ngôn ngữ mới
Mục đích của Dart là để giải quyết các vấn đề của JavaScript (mà, theo như một tài liệu bị rò rỉ, không thể được giải quyết bằng cách cải tiến ngôn ngữ) trong khi cung cấp hiệu năng tốt hơn, khả năng "có thể dễ dàng trở thành công cụ trong các dự án lớn" và an ninh tốt hơn. Các kỹ sư Google hiện đang phát triển một IDE trên nền tảng điện toán đám mây gọi là Brightly, mà có lẽ là ứng dụng Dart đầu tiên. Google sẽ cung cấp một trình biên dịch Dart thành mã ECMAScript 3 on the fly, dành cho các trình duyệt không tương thích Dart. Cũng có thể chuyển mã typed Closure thành Dart. Google cũng sẽ tích hợp một máy ảo vào Chrome và khuyến khích các đối thủ cạnh tranh làm điều này với trình duyệt của họ. Máy ảo Dart và Dart Cross Compiler có thể ra mắt vào cuối năm 2011.

Dart có một cộng đồng lớn trên toàn thế giới. Vì vậy, nếu bạn gặp vấn đề trong khi viết mã thì rất dễ dàng tìm được trợ giúp. Nhóm các nhà phát triển chuyên dụng đang làm việc để nâng cao chức năng của nó.

Ở đây chúng ta đã thảo luận về các tính năng thiết yếu của ngôn ngữ Dart. Chúng tôi sẽ bổ sung thêm các khái niệm về ngôn ngữ Dart trong các bài hướng dẫn sắp tới.
### Ví dụ

```dart
main()
{
  print('Hello, Dart!');
}
```

### Dart và Flutter

Bạn có tò mò tại sao nhóm phát triển Flutter lại chọn Dart không?


#### Tối ưu cho giao diện người dùng:

Hoạt động bất đồng bộ cho phép chương trình của bạn có thể hoàn thành hoàn toàn công việc trong khi chờ hoạt động khác kết thúc. Đây là một số hoạt động bất đồng bộ phổ biến:

- Tìm nạp dữ liệu thông qua mạng
- Viết cơ sở dữa liệu
- Đọc dữ liệu từ file

Hầu hết các máy tính, thậm chí các nền tảng mobile, đều có CPU đa nhân. Để tận dụng hết tất cả các nhân đó, các dev thông thường phải sử dụng các luồng bộ nhớ chia sẻ đồng thời. Các concurrency ở trạng thái chia sẻ có thể dễ bị lỗi và có thể dễ dẫn đến những code khá phức tạp. Thay vì sử dụng luồng, tất cả các code của ngôn ngữ Dart chạy bên trong các isolate. Mỗi isolate có vùng bộ nhớ riêng, đảm bảo rằng không có bất kỳ trạng thái của isolate này có thể truy cập được vào isolate kia.

Ngôn ngữ lập trình này cũng tối ưu cho việc xây dựng giao diện người dùng với những tính năng cho phép mở rộng các collection và tùy chỉnh UI cho từng nền tảng khác nhau.

#### Hiệu năng nhanh trên tất cả nền tảng

Như đã nói ở trên, Dart có trình biên dịch AOT, giúp nó biên dịch nhanh. Điều này không chỉ giúp Flutter nhanh hơn mà còn đảm bảo rằng mọi thứ đều được tùy chỉnh.