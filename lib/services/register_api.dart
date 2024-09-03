
import 'package:dio/dio.dart';
import 'package:superjet/consts/consts.dart';


class RegisterApi {
final Dio _dio=Dio();
  RegisterApi() {
    // Set default options if needed
    _dio.options.baseUrl = baseUrl;
    _dio.options.headers = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Future<Map<String,dynamic>> registerUser(String name, String email, String password, String confirmPassword) async {
    try {
      final response = await _dio.get(
        '/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
        },
      );

      return response.data;

      // Handle successful response
    } on DioException catch (e) {
      throw (e.response?.data['message']);
    }
  }
}
