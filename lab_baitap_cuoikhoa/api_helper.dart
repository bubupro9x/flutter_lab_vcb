import 'package:dio/dio.dart';

class APIHelper {
  final Dio dio = Dio();
  static final APIHelper _singleton = APIHelper._internal();

  factory APIHelper() {
    return _singleton;
  }

  APIHelper._internal();
}