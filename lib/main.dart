import 'package:fineartsociety/pages/all_artist_page.dart';
import 'package:fineartsociety/pages/contact_page.dart';
import 'package:fineartsociety/pages/events_page.dart';
import 'package:fineartsociety/pages/exhibitions_page.dart';
import 'package:fineartsociety/pages/news_page.dart';
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
        '/artist': (context) => ArtistPage(),
        '/news': (context) => NewsPage(),
        '/allArtist': (context) => AllArtistsPage(),
        '/events': (context) => EventsPage(),
        '/contact': (context) => ContactPage(),
        '/exhibitions': (context) => ExhibitionPage()
        // Add more routes as needed
      },
    );
  }
}
