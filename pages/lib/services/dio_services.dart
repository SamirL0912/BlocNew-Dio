import 'package:dio/dio.dart';

class DioService {
  final Dio _dio = Dio();

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }

  Future<bool> login(String username, String password) async {
    try {
      final response = await _dio.post(
        "https://mocki.io/v1/dc929232-b782-4c2b-91dc-cb7983022b9c",
        data: {"username": username, "password": password},
      );

      return response.statusCode == 201;
    } catch (e) {
      throw Exception("Error en login: $e");
    }
  }
}
