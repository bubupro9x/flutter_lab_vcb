import 'dart:async';

void main(List<String> args) async {
  exec(finish: (value) {
    print('finish loop $value');
  });

  exec(finish: (value) {
    print('completed $value');
  });
}

void exec({required Function(String) finish}) {
  for (int i = 1; i < 100000; i++) {}
  finish('hello');
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
