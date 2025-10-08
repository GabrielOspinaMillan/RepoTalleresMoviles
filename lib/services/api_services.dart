import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taller1/models/themeal.dart';

class ApiService {
  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<Category>> fetchCategories() async {
    final url = Uri.parse('$_baseUrl/categories.php');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = json.decode(response.body);
        final List<dynamic> categoriesJson = body['categories'];
        return categoriesJson
            .map((json) => Category.fromJson(json))
            .toList();
      } else {
        throw Exception('Error cargando categorías: ${response.statusCode}');
      }
    } catch (e) {
      // Captura cualquier error de red o parsing
      throw Exception('Error de red o formato: $e');
    }
  }
}
