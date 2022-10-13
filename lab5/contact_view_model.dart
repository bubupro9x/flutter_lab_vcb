import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactViewModel extends ChangeNotifier {
  final ListContact _listFilter = ListContact(contacts: []);

  ListContact get listFilter => _listFilter;
  ListContact _orginalList = ListContact(contacts: []);

  ListContact get orginalList => _orginalList;

  ContactViewModel() {
    getAllContact();
  }

  void getAllContact() async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getString('contacts');
    if (result != null) {
      _orginalList = listContactFromJson(result);
      _listFilter.contacts = List.from(_orginalList.contacts);
    }
    notifyListeners();
  }

  void onUserFilterList(String value) {
    _listFilter.contacts = _orginalList.contacts
        .where((element) =>
            element.name.toUpperCase().contains(value.toUpperCase()))
        .toList();

    notifyListeners();
  }

  void addContact({required String name, required String phone}) async {
    _orginalList.contacts.add(Contact(name: name, phone: phone));
    _listFilter.contacts = List.from(_orginalList.contacts);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('contacts', listContactToJson(_orginalList));
    notifyListeners();
  }
}

ListContact listContactFromJson(String str) =>
    ListContact.fromJson(json.decode(str));

String listContactToJson(ListContact data) => json.encode(data.toJson());

class ListContact {
  ListContact({
    required this.contacts,
  });

  List<Contact> contacts;

  factory ListContact.fromJson(Map<String, dynamic> json) => ListContact(
        contacts: List<Contact>.from(
            json["contacts"].map((x) => Contact.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "contacts": List<dynamic>.from(contacts.map((x) => x.toJson())),
      };
}

class Contact {
  Contact({
    required this.name,
    required this.phone,
  });

  String name;
  String phone;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
      };
}
