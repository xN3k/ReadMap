import 'package:book_app/models/book.dart';
import 'package:book_app/network/book_service.dart';
import 'package:flutter/material.dart';

class BookProvider with ChangeNotifier {
  final BookService _bookService = BookService();

  List<Book> _books = [];
  List<Book> get books => _books;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> searchBook(String query) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _books = await _bookService.searchBook(query);
      notifyListeners();
    } catch (e) {
      _errorMessage = "Error retriving book $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
