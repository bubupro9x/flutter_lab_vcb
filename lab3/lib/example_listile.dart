import 'dart:async';

import 'package:flutter/material.dart';

class ContactExample extends StatefulWidget {
  const ContactExample({Key? key}) : super(key: key);

  @override
  _ContactExampleState createState() => _ContactExampleState();
}

class _ContactExampleState extends State<ContactExample> {
  List<Contact> get _listContact => [
        Contact(name: 'Mai Van A', phone: '0999123121'),
        Contact(name: 'Van Van B', phone: '0999123122'),
        Contact(name: 'Hoang Van C', phone: '0999123123'),
        Contact(name: 'Huynh Van D', phone: '0999123124'),
        Contact(name: 'Nguyen Van E', phone: '0999123125'),
        Contact(name: 'Nguyen Van F', phone: '0999123126'),
        Contact(name: 'Nguyen Van G', phone: '0999123127'),
        Contact(name: 'Nguyen Van H', phone: '0999123128'),
        Contact(name: 'Nguyen Van I', phone: '0999123129'),
        Contact(name: 'Nguyen Van J', phone: '0999123110'),
        Contact(name: 'Nguyen Van K', phone: '0999123111'),
        Contact(name: 'Nguyen Van L', phone: '09991231123'),
      ];
  late List<Contact> _tempContacts;
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    _tempContacts = List.from(_listContact);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _debouncer.run(() {
                _tempContacts = _listContact
                    .where((element) => element.name
                        .toUpperCase()
                        .contains(value.toUpperCase()))
                    .toList();
                setState(() {});
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return buildItem(contact: _tempContacts[index]);
              },
              itemCount: _tempContacts.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem({required Contact contact}) {
    return ListTile(
        subtitle: Text(contact.phone),
        title: Text(contact.name),
        leading: CircleAvatar(
          child: Text(contact.name.substring(0, 1)),
        ));
  }
}

class Contact {
  final String name;
  final String phone;

  Contact({required this.name, required this.phone});
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
