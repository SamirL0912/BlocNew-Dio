import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeService {
  final String url = "https://mocki.io/v1/bf738c54-8532-4229-a463-46b47d280283";

  Future<String> fetchCristianoBio() async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

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
    } else {
      throw Exception("Error al cargar bio: ${response.statusCode}");
    }
  }

  Future<String> fetchCristianoStats() async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data is Map<String, dynamic> && data["estadisticas"] != null) {
        return """
Goles: ${data["estadisticas"]["goles"]}
Asistencias: ${data["estadisticas"]["asistencias"]}
Partidos: ${data["estadisticas"]["partidos"]}
""";
      } else {
        return "Estadísticas no disponibles";
      }
    } else {
      throw Exception("Error al cargar estadísticas: ${response.statusCode}");
    }
  }
}
