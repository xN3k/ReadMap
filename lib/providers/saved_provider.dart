import 'package:book_app/database/books_db.dart';
import 'package:book_app/models/book.dart';
import 'package:flutter/material.dart';

class SavedProvider with ChangeNotifier {
  bool _isSaved = false;
  bool get isSaved => _isSaved;

  late Future<List<Book>> _savedBooksFuture;
  Future<List<Book>> get savedBooksFuture => _savedBooksFuture;

  SavedProvider() {
    loadSavedBooks();
  }

  void loadSavedBooks() {
    _savedBooksFuture = DatabaseHelper.instance.readAllBooks();
    notifyListeners();
  }

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

  Future<void> toggleDelete(Book book) async {
    await DatabaseHelper.instance.deleteBook(book.id);
    loadSavedBooks();
  }
}
