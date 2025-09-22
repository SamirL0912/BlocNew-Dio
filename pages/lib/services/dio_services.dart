import 'package:dio/dio.dart';

class DioService {
  final Dio _dio = Dio();
  final String url = "https://mocki.io/v1/bf738c54-8532-4229-a463-46b47d280283";

  Future<String> fetchCristianoBio() async {
    try {
      final response = await _dio.get(url);
      final data = response.data;

      if (data is Map<String, dynamic> && data["bio"] != null) {
        return """
Nombre: ${data["bio"]["nombre"]}
Edad: ${data["bio"]["edad"]}
Nacionalidad: ${data["bio"]["nacionalidad"]}
Equipo: ${data["bio"]["equipo"]}
""";
      } else {
        return "Biografía no disponible";
      }
    } catch (e) {
      return "Error al cargar biografía: $e";
    }
  }

  Future<String> fetchCristianoStats() async {
    try {
      final response = await _dio.get(url);
      final data = response.data;

      if (data is Map<String, dynamic> && data["estadisticas"] != null) {
        return """
Goles: ${data["estadisticas"]["goles"]}
Asistencias: ${data["estadisticas"]["asistencias"]}
Partidos: ${data["estadisticas"]["partidos"]}
""";
      } else {
        return "Estadísticas no disponibles";
      }
    } catch (e) {
      return "Error al cargar estadísticas: $e";
    }
  }
}
