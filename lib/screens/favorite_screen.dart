import 'package:book_app/screens/book_detail.dart';
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
      padding: const EdgeInsets.all(32),
      child: ListView.builder(
          itemCount: favoriteBooks.length,
          itemBuilder: (context, index) {
            final book = favoriteBooks[index];
            return Card(
              child: ListTile(
                leading: book.imageLinks['thumbnail'] != null
                    ? Image.network(
                        book.imageLinks['thumbnail']!,
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      )
                    : Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey[200],
                        child: Icon(Icons.book, color: Colors.grey[800]),
                      ),
                title: Text(book.title),
                subtitle: Text('By ${book.authors.join(', ')}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetail(
                        book: book,
                      ),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
