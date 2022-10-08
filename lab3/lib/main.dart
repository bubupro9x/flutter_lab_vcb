import 'package:flutter/material.dart';

import 'example_listile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            // const MyHomePage(title: 'Flutter Demo Home Page'),
            const ContactExample());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _list = [
    Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.route,
            color: Colors.blue,
          ),
          Text(
            'Route',
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.share,
          color: Colors.blue,
        ),
        Text(
          'Share',
          style: TextStyle(color: Colors.blue),
        ),
      ],
    )
  ];

  Widget buildImage(String url, {BuildContext? context}) {
    return Expanded(
      child: Tooltip(
        message: url,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black, width: 10)),
            child: Image.network(
              url,
              fit: BoxFit.cover,
              height: 180,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            color: Colors.grey.shade400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    buildImage(
                      'https://wallpaperboat.com/wp-content/uploads/2021/09/29/79083/demon-slayer-29.jpg',
                    ),
                    buildImage(
                        'https://i.pinimg.com/474x/27/0f/b2/270fb203615e41fab2ec1743b7800a6c.jpg')
                  ],
                ),
                Row(
                  children: [
                    buildImage(
                        'https://i.pinimg.com/474x/27/0f/b2/270fb203615e41fab2ec1743b7800a6c.jpg'),
                    buildImage(
                        'https://wallpaperboat.com/wp-content/uploads/2021/09/29/79083/demon-slayer-29.jpg'),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
