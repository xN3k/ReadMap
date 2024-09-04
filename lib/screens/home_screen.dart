import 'package:book_app/providers/book_provider.dart';
import 'package:book_app/screens/book_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _selectBook(context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BookDetail(
                book: book,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Book'),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            NavigationDestination(
              icon: Icon(Icons.download_done),
              label: 'Saved',
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(32),
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
                                  subtitle:
                                      Text('By ${book.authors.join(', ')}'),
                                  onTap: () => _selectBook(context, book),
                                ),
                              );
                            }),
              ),
            ],
          ),
        ));
  }
}
