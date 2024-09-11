import 'package:book_app/models/book.dart';
import 'package:book_app/providers/saved_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'book_detail.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize the provider to load saved books
    Provider.of<SavedProvider>(context, listen: false).loadSavedBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SavedProvider>(
      builder:
          (BuildContext context, SavedProvider savedProvider, Widget? child) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder(
            future: savedProvider.savedBooksFuture,
            builder: (context, snapshot) => snapshot.connectionState ==
                    ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : snapshot.hasError
                    ? Center(child: Text('Error: ${snapshot.error}'))
                    : snapshot.hasData && snapshot.data!.isNotEmpty
                        ? ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              Book book = snapshot.data![index];
                              return InkWell(
                                child: Card(
                                  child: ListTile(
                                    trailing: IconButton(
                                      onPressed: () {
                                        savedProvider.toggleDelete(book);
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline,
                                      ),
                                    ),
                                    leading:
                                        book.imageLinks['thumbnail'] != null
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
                                                child: Icon(Icons.book,
                                                    color: Colors.grey[800]),
                                              ),
                                    title: Text(book.title),
                                    subtitle:
                                        Text('By ${book.authors.join(', ')}'),
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
                                ),
                              );
                            },
                          )
                        : const Center(child: Text('No saved books found.')),
          ),
        );
      },
    );
  }
}
