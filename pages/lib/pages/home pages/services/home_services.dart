import 'package:dio/dio.dart';

class HomeService {
  final Dio dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  Future<Map<String, dynamic>> getStats() async {
    try {
      final response = await dio.get(
        "https://mocki.io/v1/4ba4ef1e-1121-44ce-b2ec-43d8236507cd",
      );
      await Future.delayed(const Duration(seconds: 4));

      return Map<String, dynamic>.from(response.data);
    } on DioException catch (e) {
      print('DioException en getStats: ${e.type} - ${e.message}');
      rethrow;
    } catch (e) {
      print('Error no esperado en getStats: $e');
      rethrow;
    }
  }
}
