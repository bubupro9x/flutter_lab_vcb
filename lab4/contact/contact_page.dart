import 'dart:async';

import 'package:flutter/material.dart';

import 'contact_controller.dart';

class ContactExample extends StatefulWidget {
  const ContactExample({Key? key}) : super(key: key);

  @override
  _ContactExampleState createState() => _ContactExampleState();
}

class _ContactExampleState extends State<ContactExample> {
  final _debouncer = Debouncer(milliseconds: 500);

  final ContactController _controller = ContactController();

  Widget Header() {
    print('Header is rebuilt');
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('Ứng dụng danh bạ'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Header(),
          TextField(
            onChanged: (value) {
              _debouncer.run(() {
                _controller.onUserFilterList(value);
              });
              setState(() {});
            },
          ),
          Expanded(
            child: StreamBuilder<List<Contact>>(
                stream: _controller.stream.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListContacts(
                      tempContact: snapshot.data!,
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class ListContacts extends StatelessWidget {
  const ListContacts({Key? key, required this.tempContact}) : super(key: key);

  final List<Contact> tempContact;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return buildItem(contact: tempContact[index], context: context);
      },
      itemCount: tempContact.length,
    );
  }

  Widget buildItem({required Contact contact, required BuildContext context}) {
    return ListTile(
        onTap: () {
          Navigator.of(context).pushNamed('/detail', arguments: contact);
        },
        subtitle: Text(contact.phone),
        title: Text(contact.name),
        leading: CircleAvatar(
          child: Text(contact.name.substring(0, 1)),
        ));
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
