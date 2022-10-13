import 'package:flutter/material.dart';
import 'package:lab3/contact_view_model.dart';
import 'package:provider/provider.dart';

class AddContact extends StatelessWidget {
  AddContact({
    Key? key,
  }) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'name',
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                hintText: 'phone',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Contact obj = Contact(
                    name: _nameController.text,
                    phone: _phoneController.text,
                  );
                  Provider.of<ContactViewModel>(context,listen: false)
                      .addContact(name: obj.name, phone: obj.phone);
                  Navigator.pop(context);
                },
                child: const Text('Save')),
          ],
        ),
      ),
    );
  }
}
