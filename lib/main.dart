import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/reading_list_provider.dart';
import 'screens/albums_master.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ReadingListProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Albums de Tintin',
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
          backgroundColor:
              Colors.red, // Mettre en rouge le bandeau d'en-tête par défaut
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 18.0, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
        scaffoldBackgroundColor: Colors.black87, // Couleur de fond
      ),
      home: const AlbumsMaster(),
    );
  }
}
