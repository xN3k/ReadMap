import 'package:book_app/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavedButton extends StatefulWidget {
  const SavedButton({super.key});

  @override
  State<SavedButton> createState() => _SavedButtonState();
}

class _SavedButtonState extends State<SavedButton> {
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
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Save'),
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
