
import 'package:dio/dio.dart';
import 'package:superjet/consts/consts.dart';

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

  Future<void> registerUser(String name, String email, String password, String confirmPassword) async {
    try {
      final response = await _dio.get(
        '/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'confirm_password': confirmPassword,
        },
      );

      // Handle successful response
    } on DioException catch (e) {
      throw (e.response?.data['message']);
    }
  }
}
