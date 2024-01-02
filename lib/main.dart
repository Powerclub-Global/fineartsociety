import 'package:fineartsociety/pages/all_artist_page.dart';
import 'package:fineartsociety/pages/contact_page.dart';
import 'package:fineartsociety/pages/events_page.dart';
import 'package:fineartsociety/pages/exhibitions_page.dart';
import 'package:fineartsociety/pages/indivisual_page.dart';
import 'package:fineartsociety/pages/news_page.dart';
import 'package:fineartsociety/pages/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/main_page.dart';
import 'pages/artist_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fine Art Society',
      theme: ThemeData(primarySwatch: Colors.amber, fontFamily: 'Cinzel'),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/artist': (context) => const ArtistPage(),
        '/news': (context) => const NewsPage(),
        '/allArtist': (context) => const AllArtistsPage(),
        '/events': (context) => const EventsPage(),
        '/contact': (context) => const ContactPage(),
        '/exhibitions': (context) => const ExhibitionPage(),
        '/indivisualItem': (context) => const IndivisualPage(),
        '/productsPage': (context) => const ProductsPage()
        // Add more routes as needed
      },
    );
  }
}
