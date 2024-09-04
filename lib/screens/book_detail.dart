import 'package:book_app/models/book.dart';
import 'package:book_app/widgets/saved_button.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                book.imageLinks['thumbnail']!,
                fit: BoxFit.contain,
                height: 240,
                width: 600,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                book.title,
                style: theme.headlineSmall,
              ),
              Text(
                'By ${book.authors.join(', ')}',
                style: theme.labelLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Publisished: ${book.publishedDate}',
                style: theme.bodySmall,
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              const SavedButton(),
              Text('Description', style: theme.titleMedium),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary)),
                child: Text(book.description),
              )
            ],
          ),
        ),
      ),
    );
  }
}
