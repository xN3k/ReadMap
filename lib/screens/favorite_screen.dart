import 'package:book_app/widgets/book_list_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorite_provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favoriteBooks = favoriteProvider.favoriteList;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: favoriteBooks.isEmpty
          ? const Center(
              child: Text('No Favorite Book'),
            )
          : ListView.builder(
              itemCount: favoriteBooks.length,
              itemBuilder: (context, index) {
                final book = favoriteBooks[index];
                return BookListSection(book: book);
              }),
    );
  }
}
