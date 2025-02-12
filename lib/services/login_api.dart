
import 'package:dio/dio.dart';
import 'package:superjet/consts/consts.dart';
import 'package:superjet/generated/l10n.dart';

class LoginApi {
  final Dio _dio=Dio();
  LoginApi() {
    // Set default options if needed
    _dio.options.baseUrl = baseUrl;
    _dio.options.headers = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Future<Map<String,dynamic>> LoginUser( String email, String password,) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      return response.data;

      // Handle successful response
    } on DioException catch (e) {
      throw (e.response?.data['message']);
    }
  }
}
