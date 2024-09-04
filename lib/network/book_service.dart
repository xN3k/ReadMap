import 'dart:convert';

import 'package:book_app/models/book.dart';
import 'package:http/http.dart' as http;

class BookService {
  final String baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<List<Book>> searchBook(String query) async {
    final url = Uri.parse("$baseUrl?q=%$query");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        List<dynamic> items = data['items'] ?? [];
        return items.map((item) => Book.fromJson(item)).toList();
      } else {
        throw Exception('Failed to Load Book');
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
