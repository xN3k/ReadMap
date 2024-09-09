import 'package:book_app/models/book.dart';
import 'package:book_app/providers/saved_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorite_provider.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

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
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final savedProvider =
                            Provider.of<SavedProvider>(context, listen: false);

                        // Call toggleSaved and handle the result
                        await savedProvider.toggleSaved(book);

                        // Show a SnackBar based on the result
                        SnackBar snackBar = SnackBar(
                          content: Text(savedProvider.isSaved
                              ? 'Book saved successfully'
                              : 'Failed to save book'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: const Text('Save'),
                    ),
                    IconButton(
                        onPressed: () async {},
                        icon: favoriteProvider.favoriteList.contains(book)
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_border))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
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
