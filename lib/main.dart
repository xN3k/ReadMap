import 'package:book_app/providers/book_provider.dart';
import 'package:book_app/providers/favorite_provider.dart';
import 'package:book_app/providers/saved_provider.dart';
import 'package:book_app/providers/theme_provider.dart';
import 'package:book_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => FavoriteProvider()),
      ChangeNotifierProvider(create: (context) => BookProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => SavedProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context).currentTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ReadMap',
      theme: themeProvider,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: const HomeScreen(),
    );
  }
}
