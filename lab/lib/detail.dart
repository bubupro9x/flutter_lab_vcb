import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
   Detail({Key? key,  this.text}) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          text!,
          style: const TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
