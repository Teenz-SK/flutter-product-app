import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  static Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
        headers: {"User-Agent": "FlutterApp", "Accept": "application/json"},
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        return data.map((e) => User.fromJson(e)).toList();
      } else {
        throw Exception("API failed");
      }
    } catch (e) {
      print("API ERROR: $e");
      throw e;
    }
  }
}
