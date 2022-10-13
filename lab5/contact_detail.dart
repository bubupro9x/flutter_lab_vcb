import 'package:flutter/material.dart';
import 'package:lab3/contact_controller.dart';

class ContactDetail extends StatelessWidget {
  const ContactDetail({Key? key, required this.contact}) : super(key: key);

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${contact.name}'),
            Text('Phone: ${contact.phone}')
          ],
        ),
      ),
    );
  }
}
