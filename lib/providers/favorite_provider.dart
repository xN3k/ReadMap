import 'package:book_app/database/books_db.dart';
import 'package:book_app/models/book.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  bool _isFavorite = true;
  final List<Book> _favoriteList = [];

  bool get isFavorite => _isFavorite;
  List<Book> get favoriteList => _favoriteList;

  Future<void> favoriteBook(Book book) async {
    if (_favoriteList.contains(book)) {
      _favoriteList.remove(book);
      _isFavorite = false;
      await DatabaseHelper.instance.toggleFavorite(book.id, isFavorite);
      notifyListeners();
    } else {
      _favoriteList.add(book);
      _isFavorite = true;
      await DatabaseHelper.instance.getFavorites();
      notifyListeners();
    }
  }
}
