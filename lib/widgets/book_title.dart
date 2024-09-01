import 'package:book_app/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookTitle extends StatefulWidget {
  const BookTitle({super.key});

  @override
  State<BookTitle> createState() => _BookTitleState();
}

class _BookTitleState extends State<BookTitle> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Book_Title',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Text(
                  'Author',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: favoriteProvider.favoriteBook,
            icon: favoriteProvider.isFavorite
                ? const Icon(Icons.favorite_border)
                : const Icon(Icons.favorite),
            color: Colors.red[500],
          ),
          SizedBox(
            child: SizedBox(
              child: Text('${favoriteProvider.favoriteCount}'),
            ),
          ),
        ],
      ),
    );
  }
}
