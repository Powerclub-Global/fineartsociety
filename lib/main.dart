// lib/main.dart
import 'package:flutter/material.dart';
import 'pages/main_page.dart';
import 'pages/artist_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fine Art Society',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/artist': (context) => ArtistPage(artistIndex: 0),
        // Add more routes as needed
      },
    );
  }
}