import 'package:pages/services/dio_services.dart';

class HomeService {
  final DioService _dioService;

  HomeService(this._dioService);

  Future<String> getCristianoBio() async {
    try {
      final response = await _dioService.get(
        "https://mocki.io/v1/9b5ab57e-94b7-41c8-a4d0-f665a7535ff2",
      );
      return response.data.toString();
    } catch (e) {
      throw Exception("Error obteniendo biografía: $e");
    }
  }

  Future<String> getCristianoStats() async {
    try {
      final response = await _dioService.get(
        "https://mocki.io/v1/8f1cdadb-9fa2-4b2a-a278-ba08595c7d1b",
      );
      return response.data.toString();
    } catch (e) {
      throw Exception("Error obteniendo estadísticas: $e");
    }
  }
}
