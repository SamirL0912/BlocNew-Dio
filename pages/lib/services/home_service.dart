import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeService {
  final String url = "https://mocki.io/v1/4711e907-1503-46d1-b4ba-880fd932f1f8";

  Future<String> fetchCristianoInfo() async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data is Map<String, dynamic>) {
        return """
Nombre: ${data["nombre"]}
Edad: ${data["edad"]}
Nacionalidad: ${data["nacionalidad"]}
Equipo: ${data["equipo"]}
""";
      } else {
        return "Datos no disponibles";
      }
    } else {
      throw Exception("Error al cargar info: ${response.statusCode}");
    }
  }
}
