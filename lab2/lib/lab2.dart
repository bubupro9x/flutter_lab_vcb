import 'package:lab2/dart.dart' as lab2;

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

const public = 2;

void main() {
  final ResponseWrapper<User> response1 =
      ResponseWrapper<User>.fromMap(mapA, (data){
        return  User.fromMap(data);
  });
  print(response1.data.name);
  /// num
  final ResponseWrapper<Number> response2 =
      ResponseWrapper<Number>.fromMap(mapB, (data) {
    return Number.fromMap(data);
  });

}
class ResponseWrapper<T> {
  ResponseWrapper(
      {required this.status, required this.message, required this.data});

  factory ResponseWrapper.fromMap(
      Map<String, dynamic> map, Function(dynamic) execute) {
    return ResponseWrapper(
        status: map['status'],
        message: map['message'],
        data: execute(
          map['data'],
        ));
  }

  final int status;
  final String message;
  final T data;
}

// Map<String, dynamic> mapA = {
//   'status': 200,
//   'message': 'success',
//   'data': {
//     'name': 'duy',
//     'age': 26,
//   }
// };

class User {
  User(this.name, this.age);

  final String name;
  final int age;

  factory User.fromMap(Map<String, dynamic> map) {
    return User(map['name'], map['age']);
  }
}

class Number {
  Number(this.data);

  List<int> data;

  factory Number.fromMap(List<int> m) {
    return Number(m);
  }
}


