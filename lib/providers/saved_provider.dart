import 'package:book_app/database/books_db.dart';
import 'package:book_app/models/book.dart';
import 'package:flutter/material.dart';

class SavedProvider with ChangeNotifier {
  bool _isSaved = false;
  bool get isSaved => _isSaved;

  Future<void> toggleSaved(Book book) async {
    try {
      _isSaved = true;
      await DatabaseHelper.instance.insert(book);
      notifyListeners();
    } catch (e) {
      _isSaved = false;
      throw Exception('Error: $e');
    }
  }
}
