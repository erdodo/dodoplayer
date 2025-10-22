import 'package:dodoplayer/AuthCheck.dart';
import 'package:dodoplayer/HomePage.dart';
import 'package:dodoplayer/pages/favorites/Favorites.dart';
import 'package:dodoplayer/pages/search/Search.dart';
import 'package:dodoplayer/pages/sign/LoginPage.dart';
import 'package:dodoplayer/providers/GlobalProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GlobalProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ErdoFlix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(
          primary: Colors.red,
          surface: Colors.black,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ),
      ),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const MyHomePage(title: 'ErdoFlix'),
        '/favorites': (context) => const FavoritesPage(),
        '/search': (context) => const SearchPage(),
      },
      home: const AuthCheck(),
    );
  }
}