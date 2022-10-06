// void main(List<String> args)  {
//   log('1', success: (value) {
//     print('value: $value');
//     print('success');
//   }, error: () {
//     print('error');
//   });
// }
//
// void log(
//   String str, {
//   required Function(int) success,
//   required Function error,
// }) {
//   try {
//     final int temp = int.parse(str);
//     success(temp);
//   } catch (_) {
//     error();
//   }
// }
//
// void main(List<String> args) async {
//   print('start');
//   callAPI().then((value){
//         print('result: $value');
//       });
//   print('end');
// }
//
// Future<bool> callAPI() async {
//   await Future.delayed(const Duration(seconds: 2));
//   print('complete');
//   return true;
// }

import 'dart:async';

StreamController _controller = StreamController();

void main() {
  watchStream();
  _controller.add('hello');
}

void watchStream() {
  _controller.stream.listen((event) {
    print(event);
  });
}
