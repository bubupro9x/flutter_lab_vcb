import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'contact_controller.dart';

class ContactExample extends StatefulWidget {
  const ContactExample({Key? key}) : super(key: key);

  @override
  _ContactExampleState createState() => _ContactExampleState();
}

class _ContactExampleState extends State<ContactExample> {
  final _debouncer = Debouncer(milliseconds: 500);

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addContact');
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(),
      body: Column(
        children: [
          Header(),
          TextField(
            onChanged: (value) {
              _debouncer.run(() {
                Provider.of<ContactController>(context, listen: false)
                    .onUserFilterList(value);
              });
              setState(() {});
            },
          ),
          Expanded(
            child: StreamBuilder<List<Contact>>(
                stream: Provider.of<ContactController>(context, listen: false)
                    .stream
                    .stream,
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

/*


Dựa vào ứng dụng Contact đã làm trước đó.
Hãy phát triển thêm các tính năng sau đây:

- Chức năng add danh bạ:
  - Push sang một màn hình khác chưa các text field:
  Name, Phone. Sau khi người dùng nhập xong và
  bấm vào button Add thì back lại màn hình danh sách contact
  và add data mới add vào.
    - Keyword: Return data from a screen.
    - or can pass contact controller to the add contact screen
  - Xóa tất cả fake data và sử dụng data đã add trước đó.
  - Sử dụng lib shared_preferences để lưu toàn bộ data Contact
  xuống dưới disk, và lần sau vào app load data
  lên để show ra màn hình.

Tham khảo ứng dụng danh bạ thông thường trong điện thoại.
 */
