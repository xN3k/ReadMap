import 'package:book_app/widgets/book_list_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../providers/book_provider.dart';

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
                          return BookListSection(book: book);
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
