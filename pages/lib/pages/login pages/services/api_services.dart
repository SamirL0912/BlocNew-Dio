import 'package:dio/dio.dart';

class LoginService {
  final Dio dio = Dio();

  Future<bool> login(String username, String password) async {
    final response = await dio.post(
      "https://68ddf036d7b591b4b78df267.mockapi.io/api/v1/login",
      data: {"username": username, "password": password},
    );

    await Future.delayed(const Duration(seconds: 2));

    if (response.statusCode == 201 || response.statusCode == 200) {
      final data = response.data;
      return data["username"] == username && data["password"] == password;
    }

    return false;
  }
}
