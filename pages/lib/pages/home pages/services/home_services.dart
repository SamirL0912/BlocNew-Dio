import 'package:dio/dio.dart';

class HomeService {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> getStats() async {
    final response = await dio.get(
      "https://mocki.io/v1/4ba4ef1e-1121-44ce-b2ec-43d8236507cd",
    );
    await Future.delayed(const Duration(seconds:4));

    return response.data;
  }
}
