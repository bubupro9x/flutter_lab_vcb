import 'package:flutter/material.dart';

class ContactViewModel extends ChangeNotifier {
  List<Contact>? _listFilter;

  List<Contact>? get listFilter => _listFilter;
  List<Contact>? _orginalList;

  List<Contact>? get orginalList => _orginalList;

  ContactViewModel() {
    getAllContact();
  }

  void getAllContact() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    _orginalList = _listContact;
    if (_orginalList != null) {
      _listFilter = List.from(_orginalList!);
      notifyListeners();
    }
  }

  void onUserFilterList(String value) {
    if (_orginalList != null) {
      _listFilter = _orginalList!
          .where((element) =>
              element.name.toUpperCase().contains(value.toUpperCase()))
          .toList();

      notifyListeners();
    }
  }

  void addContact({required String name, required String phone}) {
    _orginalList?.add(Contact(name: name, phone: phone));
    _listFilter = List.from(_orginalList!);
    notifyListeners();
  }
}

class Contact {
  final String name;
  final String phone;

  Contact({required this.name, required this.phone});
}

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
