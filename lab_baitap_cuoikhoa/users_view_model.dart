import 'package:flutter/material.dart';
import 'package:lab6_image_picker/users_model.dart';

import 'api_helper.dart';

class UsersViewModel extends ChangeNotifier {
  List<UsersModel> _users = [];

  List<UsersModel> get users => _users;

  UsersViewModel() {
    notifyListeners();
    getUsers();
  }

  Future<void> getUsers() async {
    _users.clear();
    final result =
        await APIHelper().dio.get('https://random-data-api.com/api/v2/users?size=20');
    _users =
        List<UsersModel>.from(result.data.map((x) => UsersModel.fromJson(x)));
    notifyListeners();
  }
}
