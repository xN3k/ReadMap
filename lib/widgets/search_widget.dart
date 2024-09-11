import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../providers/book_provider.dart';
import '../screens/book_detail.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  // void _selectBook(context, Book book) {}
  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Search',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
            ),
            onSubmitted: (query) => bookProvider.searchBook(query),
          ),
          Expanded(
            child: bookProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : bookProvider.books.isEmpty
                    ? const Center(child: Text('No books found'))
                    : ListView.builder(
                        itemCount: bookProvider.books.length,
                        itemBuilder: (context, index) {
                          Book book = bookProvider.books[index];
                          return Card(
                            child: ListTile(
                              leading: book.imageLinks['thumbnail'] != null
                                  ? Image.network(
                                      bookProvider.books[index]
                                          .imageLinks['thumbnail']!,
                                      fit: BoxFit.cover,
                                      width: 50,
                                      height: 50,
                                    )
                                  : Container(
                                      width: 50,
                                      height: 50,
                                      color: Colors.grey[200],
                                      child: Icon(Icons.book,
                                          color: Colors.grey[800]),
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
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
