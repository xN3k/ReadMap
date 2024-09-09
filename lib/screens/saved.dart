import 'package:book_app/database/books_db.dart';
import 'package:book_app/models/book.dart';
import 'package:book_app/widgets/book_list_section.dart';
import 'package:flutter/material.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DatabaseHelper.instance.readAllBooks(),
      builder: (context, snapshot) => snapshot.hasData
          ? ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Book book = snapshot.data![index];
                return InkWell(
                  child: BookListSection(book: book),
                );
              })
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
