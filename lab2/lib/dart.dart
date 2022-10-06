import 'dart:async';

void main(List<String> args) async {
  final nv1 = NhanVien(
    null,
    age: 12,
    soGioLam: 100,
  );
  print(nv1.tienThucNhan);
  print(nv1.toString());
}

class NhanVien {
  NhanVien(
    name, {
    required this.age,
    required this.soGioLam,
  });

  late String name;
  late int age;
  late int soGioLam;

  int get tienThucNhan => soGioLam * 22000;

  @override
  String toString() {
    return 'name: $name - age $age';
  }
}
