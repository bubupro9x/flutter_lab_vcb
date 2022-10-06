# Bài tập Dart



```dart
Viết chương trình in ra số nguyên tố từ 0 đến 100
Viết chương trình hoán đồi 2 số
Viết chương trình hoán đổi 2 số (không dùng biến tạm)
Viết chương trình in ra cách đọc của 1 số từ 0 đến 999
Sử dụng vòng lập để in ra tất cả kí tự từ A-Z
Viết chương trình tính tổng từ 1+3+5+7+...+999(không dùng vòng lập)
Viết chương trình phân tích số nguyên N thành cách thừa số nguyên tố: 100 = 2*2*5*5
/////
Viết class NhanVien gồm các thuộc tính: tên, tuổi, tiền thực nhận, số giờ làm.
Khởi tạo nhân viên A, 20 tuổi, số giờ làm = 100
Khởi tạo nhân viên B, 21 tuổi, số giờ làm = 90
Khởi tạo nhân viên C, 27 tuổi, số giờ làm = 200
Khởi tạo nhân viên D, 25 tuổi, số giờ làm = 210
In ra màn hình, thông tin nhân viên kèm theo tiền thực nhận.
Công thức tính số tiền thực nhận: 
	Tien luong = số giờ làm * 22000
  Tiền thực nhận = Tiền lương + tiền thưởng
  Tiền thưởng = Lương *20% nếu giờ làm >=200
  Tiền thưởng = Lương * 10% nếu giờ làm >=100 <200
  Tiền thưởng = 0 nếu giờ làm <100
Lưu ý: Viết hàm in thông tin và hàm tính tiền trong class NhanVien
/////
  
  
  
/// bai tap generic
class User {
  User(this.name, this.age);
  final String name;
  final int age;
}

class Number {
  Number(this.data);
  List<in
Map<String, dynamic> mapA = {
  'status': 200,
  'message': 'success',
  'data': {
    'name': 'duy',
    'age': 26,
  }
};

Map<String, dynamic> mapB = {
  'status': 200,
  'message': 'success',
  'data': [1, 2, 3, 4]
};

Cho class User (name,age), class Num(list<int> nums).
Viết hàm để convert mapA ra đối tượng User và mapB ra đối tượng Num.
```