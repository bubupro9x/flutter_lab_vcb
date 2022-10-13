import 'package:flutter/material.dart';
import 'package:lab3/add_contact.dart';
import 'package:provider/provider.dart';

import 'contact_view_model.dart';
import 'contact_detail.dart';
import 'contact_page.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ContactViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        onGenerateRoute: (setting) {
          if (setting.name == '/detail') {
            return MaterialPageRoute(builder: (_) {
              return ContactDetail(contact: setting.arguments as Contact);
            });
          }
          if (setting.name == '/addContact') {
            return MaterialPageRoute(builder: (_) {
              return AddContact();
            });
          }
        },
        home: const ContactExample(),
      ),
    );
  }
}
