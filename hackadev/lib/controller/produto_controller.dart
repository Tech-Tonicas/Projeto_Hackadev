import 'dart:convert';
import 'package:http/http.dart' as http;

class ProdutoController {
  Future<List<dynamic>> fetchProdutos() async {
    final Map<String, String> headers = {"Content-Type": "application/json"};
    final response = await http.get(
      Uri.parse('http://localhost:3000/produtos'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Falha ao carregar produtos');
    }
  }
}