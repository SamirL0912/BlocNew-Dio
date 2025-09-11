import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeService {
  Future<String> fetchCristianoInfo() async {
    final url = Uri.parse("https://mocki.io/v1/dd6f4fde-ac0f-4c86-87a8-6e8cc462cb08");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      
      return data["descripcion"];
    } else {
      throw Exception("Error al cargar info: ${response.statusCode}");
    }
  }
}
