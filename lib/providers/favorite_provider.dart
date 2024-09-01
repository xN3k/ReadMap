import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  bool _isFavorite = false;
  int _favoriteCount = 0;

  bool get isFavorite => _isFavorite;
  int get favoriteCount => _favoriteCount;

  void favoriteBook() {
    if (_isFavorite) {
      _favoriteCount += 1;
      _isFavorite = false;
      notifyListeners();
    } else {
      _favoriteCount -= 1;
      _isFavorite = true;
      notifyListeners();
    }
  }
}
