# Listview và cách truyền data vào Listview Widget

Nếu bạn muốn có một giải pháp để hiển thị một danh sách các Widget và thậm chí có thể cuộn được theo chiều ngang hay dọc thì ListView chính là một lựa chọn vô cùng hiệu quả.

Dưới đây là một số cách để xây dựng một ListView:

## Sử dụng List<Widget> cho thuộc tính children

Đây là cách xây dựng dựng mặc định của một ListView. Bằng cách xây dựng từng Widget cụ thể và đặt trong children của ListView, các Widget sẽ được hiển thị lần lượt theo trên giao diện người dùng.

Cách xây dựng này phù hợp với việc hiển thị một số lượng ít các Widget vì việc xây dựng một List yêu cầu cần phải làm việc với tất cả các thành phần con có thể được hiển thị kể cả khi các Widget chưa hiển thị lên màn hình.

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04112814/image-8.png?resize=746%2C549&ssl=1)

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04112642/image-7.png?resize=484%2C238&ssl=1)

## Sử dụng ListView.builder

Đây là cách xây dựng ListView được áp dụng cho trường hợp cần hiển thị một lượng lớn (hay vô hạn) các Widget con vì builder chỉ được gọi cho những Widget thực sự được hiển thị lên màn hình.

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04122108/image-9.png?resize=769%2C48&ssl=1)Giả sử ta có một mảng dữ liệu 100 phần tử từ 1 đến 100

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04124135/image-14.png?resize=724%2C289&ssl=1)Ta có thể thay đổi số lượng item được hiển thị qua thuộc tính itemCount

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04123309/image-12.png?resize=487%2C227&ssl=1)

## Sử dụng ListView.separated

Đây là cách xây dựng ListView được áp dụng cho trường hợp khi cần hiển thị một số lượng lớn các Widget con và các Widget dùng để ngăn cách giữa các Widget đó vì builder chỉ được gọi cho những Widget thực sự được hiển thị lên màn hình.

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04122108/image-9.png?resize=769%2C48&ssl=1)Giả sử ta có một mảng dữ liệu 100 phần tử từ 1 đến 100

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04125102/image-15.png?resize=721%2C310&ssl=1)Ta có thể thêm Widget dùng để tách các Widget con qua separatorBuilder

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04125236/image-16.png?resize=484%2C269&ssl=1)

## Sử dụng ListView.custom

Đây là cách xây dựng ListView giúp bạn có thể tùy chỉnh nhiều hơn cho các model con. Ví dụ: một model con tùy chỉnh có thể kiểm soát thuật toán được sử dụng để ước tính kích thước của các mô hình con không thực sự hiển thị.

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04122108/image-9.png?resize=769%2C48&ssl=1)Giả sử ta có một mảng dữ liệu 100 phần tử từ 1 đến 100

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04135202/image-17.png?resize=722%2C304&ssl=1)Sử dụng SliverChildBuilderDelegate để xây dựng Widget con

![img](https://i0.wp.com/s3.ap-southeast-1.amazonaws.com/techover.storage/wp-content/uploads/2022/04/04135416/image-18.png?resize=475%2C223&ssl=1)

## Một số thuộc tính thường được sử dụng

### padding

ListView có khoảng cách với Widget cha. Ví dụ: padding: const EdgeInsets.all(8).

### scrollDirection

Thuộc tính scrollDirection xác định hướng cuộn của ListView, mặc định của ListView sẽ là vertical. Ví dụ: scrollDirection: Axis.horizontal.

### reverse

ListView sẽ được hiển thị ngược chiều, đây là thuộc tính có kiểu bool, mặc định là false.

### physics

Thuộc tính physics giúp bạn cài đặt ListView được cuộn như thế nào. Ví dụ: physics: const NeverScrollableScrollPhysics(),

## Tài liệu tham khảo

ListView class trong Flutter: [ListView class – widgets library – Dart API (flutter.dev)](https://api.flutter.dev/flutter/widgets/ListView-class.html)