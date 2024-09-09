import 'package:flutter/material.dart';

import '../models/book.dart';
import '../screens/book_detail.dart';

class BookListSection extends StatelessWidget {
  const BookListSection({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
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
  }
}
