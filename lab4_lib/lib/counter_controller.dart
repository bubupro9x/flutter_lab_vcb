import 'dart:async';

class CounterController {
  final CounterModel _counterModel = CounterModel(0);

  StreamController<int> streamController = StreamController()..add(0);

  void onUserClick(String text) {

    _counterModel.counter = _counterModel.counter + int.parse(text);
    streamController.add(_counterModel.counter);
  }
}

class CounterModel {
  CounterModel(this.counter);

  int counter = 0;
}
