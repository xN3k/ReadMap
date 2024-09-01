import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/image/clean.jpg',
      width: 600,
      height: 240,
      fit: BoxFit.contain,
    );
  }
}
