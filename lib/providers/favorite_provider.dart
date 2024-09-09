import 'package:book_app/models/book.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  bool _isFavorite = true;
  int _favoriteCount = 0;
  final List<Book> _favoriteList = [];

  bool get isFavorite => _isFavorite;
  int get favoriteCount => _favoriteCount;
  List<Book> get favoriteList => _favoriteList;

  void favoriteBook(Book book) {
    if (_favoriteList.contains(book)) {
      _favoriteList.remove(book);
      _favoriteCount -= 1;
      _isFavorite = true;
      notifyListeners();
    } else {
      _favoriteList.add(book);
      _favoriteCount += 1;
      _isFavorite = false;
      notifyListeners();
    }
  }
}
