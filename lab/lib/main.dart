import 'package:flutter/material.dart';
import 'package:lab/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Hello VCB'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> list = <int>[];

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    for (var i = 0; i < 10000000000; i++) {}

    list = List<int>.generate(100, (index) => index);
    _scrollController.addListener(() {
      if(_scrollController.offset + 500 >= _scrollController.position.maxScrollExtent){
        list.addAll( List<int>.generate(100, (index) => index));
        setState(() {

        });
      }
    });
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      // list.add(_controller.text);
    });
  }

  // final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          // TextField(
          //   controller: _controller,
          // ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (_) =>
                                Detail()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(list[index].toString()),
                  ),
                );
              },
              itemCount: list.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
