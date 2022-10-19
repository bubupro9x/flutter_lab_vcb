import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:lab6_image_picker/users_view_model.dart';
import 'package:mockito/mockito.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

void main() {
  final UsersViewModel vm = UsersViewModel();

  group('Test UsersViewMoel', () {
    test('Test getUsers', () async {
      await vm.getUsers();
      expect(vm.users.length, 20);
    });
  });
}
