import 'package:book_app/widgets/book_cover.dart';
import 'package:book_app/widgets/book_title.dart';
import 'package:flutter/material.dart';

class BookDescription extends StatelessWidget {
  const BookDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookCover(),
          BookTitle(),
        ],
      ),
    );
  }
}
