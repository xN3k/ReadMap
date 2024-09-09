import 'package:book_app/database/books_db.dart';
import 'package:book_app/models/book.dart';
import 'package:flutter/material.dart';

import '../widgets/book_list_section.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: FutureBuilder(
        future: DatabaseHelper.instance.getFavorites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong ${snapshot.error}'),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<Book> favBooks = snapshot.data!;
            return ListView.builder(
              itemCount: favBooks.length,
              itemBuilder: (context, index) {
                Book book = favBooks[index];
                return BookListSection(book: book);
              },
            );
          } else {
            return const Center(
              child: Text('Nothing favorite'),
            );
          }
        },
      ),
      // child: favoriteBooks.isEmpty
      //     ? const Center(
      //         child: Text('No Favorite Book'),
      //       )
      //     : ListView.builder(
      //         itemCount: favoriteBooks.length,
      //         itemBuilder: (context, index) {
      //           final book = favoriteBooks[index];
      //           return Card(
      //             child: ListTile(
      //               leading: book.imageLinks['thumbnail'] != null
      //                   ? Image.network(
      //                       book.imageLinks['thumbnail']!,
      //                       fit: BoxFit.cover,
      //                       width: 50,
      //                       height: 50,
      //                     )
      //                   : Container(
      //                       width: 50,
      //                       height: 50,
      //                       color: Colors.grey[200],
      //                       child: Icon(Icons.book, color: Colors.grey[800]),
      //                     ),
      //               title: Text(book.title),
      //               subtitle: Text('By ${book.authors.join(', ')}'),
      //               onTap: () {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) => BookDetail(
      //                       book: book,
      //                     ),
      //                   ),
      //                 );
      //               },
      //             ),
      //           );
      //         }),
    );
  }
}
