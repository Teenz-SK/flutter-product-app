import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class ApiService {

  Future<List<Post>> fetchPosts() async {

  final url = Uri.parse(
      "https://jsonplaceholder.typicode.com/posts");

  try {

    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );

    print("Status Code: ${response.statusCode}");

    if (response.statusCode == 200) {

      List jsonData = json.decode(response.body);

      return jsonData
          .map((post) => Post.fromJson(post))
          .toList();

    } else {

      throw Exception(
          "Failed to load posts: ${response.statusCode}");

    }

  } catch (e) {

    throw Exception("Error: $e");

  }

}

}