import 'package:dio/dio.dart';

class LoginService {
  final Dio dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  Future<bool> login(String username, String password) async {
    try {
      final response = await dio.post(
        "https://68ddf036d7b591b4b78df267.mockapi.io/api/v1/login",
        data: {"username": username, "password": password},
      );

      await Future.delayed(const Duration(seconds: 2));

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = response.data;
        return data["username"] == username && data["password"] == password;
      }
    } on DioException catch (e) {
      // Log básico para depuración; el cubit/bloc puede mostrar un mensaje al usuario
      // Usamos print para dejar constancia en la consola
      print('DioException en login: ${e.type} - ${e.message}');
      rethrow;
    } catch (e) {
      print('Error no esperado en login: $e');
      rethrow;
    }

    return false;
  }
}
